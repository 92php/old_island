const {sequelize} = require('../../core/db')

const {
    Sequelize, 
    Model, 
    Op
} = require('sequelize')

const {Art} = require('./art')   //Favor导入Art

class Favor extends Model {
    // 业务表
    // 添加记录
    // fave_num
    //(数据库事务)
    // ACID 原子性  一致性  隔离性  持久性
    static async like(art_id, type, uid) {
        const favor = await Favor.findOne({
            where: {
                art_id,
                type,
                uid
            }
        })

        if (favor) {
            throw new global.errs.linkError(); //提示已经点赞过
        }
        return sequelize.transaction(async t => {
            await Favor.create({
                art_id,
                type,
                uid
            }, {transaction: t})

            const art = await Art.getData(art_id, type, false);
            await art.increment('fav_nums', {by: 1, transaction: t});
        })
    }

    static async dislike(art_id, type, uid) {
        const favor = await Favor.findOne({
            where: {
                art_id,
                type,
                uid
            }
        })
        if (!favor) {
            throw new global.errs.DislikeError(); //提示不能取消
        }

        return sequelize.transaction(async t => {
            // 软删除
            await favor.destroy({
                force: false,    //添加deleted_at时间
                transaction: t
            })

            const art = await Art.getData(art_id, type, false);
            await art.decrement('fav_nums', {by: 1, transaction: t});
        })
    }

    static async userLikeIt(art_id, type, uid) {
        const favor = await Favor.findOne({
            where: {
                art_id,
                type,
                uid
            }
        })
        return favor ? true : false;
    }

        // art包含书籍点赞和期刊点赞
        static async getMyClassicFavors(uid) {
            // type != 400
            const { Art } = require('./art');
            const arts = await Favor.findAll({
                where: {
                    type: {
                        [Op.not]:400 //表示type != 400
                    }, // Symbol es6
                    uid,
                }
            })
            if(!arts){
                throw new global.errs.NotFound();
            }

            // 避免循环查询数据库 
            // 查询次数不可控 
            // 思考： 如何避免
            // in查询 [ids]
            //for(let art of arts){
            //    Art.getData()
            //}


            return await Art.getList(arts);

        }

      static async getBookFavor(uid,book_id){
        const favorNums = await Favor.count({
            where:{
                art_id:book_id,
                type:400
            }
        })
        const myFavor = await Favor.findOne({
            where:{
                art_id:book_id,
                uid
            }
        })
        return {
            fav_nums:favorNums,
            like_status:myFavor ? 1 : 0
        }
      }  
}

Favor.init({
    uid: Sequelize.INTEGER,
    art_id: Sequelize.INTEGER,
    type: Sequelize.INTEGER
}, {
    sequelize,
    tableName: 'favor'
})

module.exports = {
    Favor
}
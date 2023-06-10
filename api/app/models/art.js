const {
    Movie, 
    Music, 
    Sentence
} = require('./classic');

const {
    Op
} = require('sequelize')

const {
    flatten
} = require('lodash')

//const { Favor } = require('./favor');  //Art导入Favor



class Art {

    constructor(art_id, type) {
        this.art_id = art_id;
        this.type = type;
    }

    //实例方法
    // art.detail 不用()可调用
    //get detail(){
    //
    //}

    async getDetail(uid) {
        const { 
            Favor 
        } = require('./favor'); //避免循环导入
        const art = await Art.getData(this.art_id, this.type);
        if (!art) {
            throw new global.errs.NotFound();
        }
        const like = await Favor.userLikeIt(this.art_id, this.type, uid);
        // art.setDataValue('like_status',like);
        return {
            art,
            like_status: like
        }
    }

    static async getData(art_id, type, useScope = true) {
        let art = null;
        const finder = {
            where: {
                id: art_id
            }
        };

        const scope = useScope ? 'bh' : null;
        switch (type) {
            case 100:
                art = Movie.scope(scope).findOne(finder);
                break;
            case 200:
                art = Music.scope(scope).findOne(finder);
                break;
            case 300:
                art = Sentence.scope(scope).findOne(finder);
                break;
            case 400:
                const {Book} = require('./book')
                art = Book.scope(scope).findOne(finder);
                if(!art){
                    art = await Book.create({
                        id:art_id
                    })
                }
                break;
            default:
                break;

        }

        //if(art && art.image){
        //    let imgUrl = art.dataValues.image
        //    art.dataValues.image = global.config.host + imgUrl
        //}

        return art;
    }

    // 接收二维数组，按type分三种表
    // 一组art基本信息（artInfoList）
    static async getList(artInfoList) {
        // in查询 [ids]
        // 3种类型 3次in查询 // 也比for of 查询好得多 因为循环内容不可控!
        const artInfoObj = {
            100: [],
            200: [],
            300: []
        };

        // 遍历数组 for...of 循环出 key // ES6引入，为弥补for...in 的不足
        // 遍历对象 for...in 循环出value

        for (let artInfo of artInfoList) { //对数组循环用of
            artInfoObj[artInfo.type].push(artInfo.art_id);
            // artInfoObj value为各type的art_id
        }

        const arts = [];
        for (let key in artInfoObj) { // 对象遍历用in
            const ids = artInfoObj[key];
            if (ids.length === 0) {
                continue;
            }

            key = parseInt(key);
            arts.push(await Art._getListByType(ids, key)); // 此处key不经处理会是字符串 // 由于jsObj key是字符串
        }
        return flatten(arts); // 展开二维变一维
    }

    // in[art_id集合] 查询
    static async _getListByType(ids, type) {
        let arts = [];

        const finder = {
            where: {
                id: {
                    [Op.in]: ids  //ids是个数组
                }
            }
        }

        const scope = 'bh';
        switch (type) {
            case 100:
                arts = await Movie.scope(scope).findAll(finder)
                break;

            // type: 200 Music    
            case 200:
                arts = await Music.scope(scope).findAll(finder)
                break;

            // type:300 Sentence
            case 300:
                arts = await Sentence.scope(scope).findAll(finder)
                break;

            // 预留type
            case 400:
                break;

            default:
                break;
        }
        return arts;
    }
}

module.exports = {
    Art
}
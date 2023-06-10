const Router = require('koa-router')
const router = new Router({
    prefix: "/v1/classic"
})

const {Auth} = require('@middlewares/auth')
const {Flow} = require('@models/flow')
const {Movie, Music, Sentence} = require('@models/classic')
const {Art} = require('@models/art')
const {Favor} = require('@models/favor')
const {PositiveIntegerValidator, ClassicValidator} = require('../../validators/classic')


//查询最新一期期刊（index最大值）
router.get('/latest', new Auth().m, async (ctx, next) => {
    const flow = await Flow.findOne({
        order: [
            ['index', 'DESC']
        ]
    })

    let art = await Art.getData(flow.art_id, flow.type);
    //const i = art.get('image')
    //const t = art.image
    //const s = art.getDataValue('image')
    
    const likeLatest = await Favor.userLikeIt(flow.art_id, flow.type, ctx.auth.uid);

    art.setDataValue('index', flow.index);
    art.setDataValue('like_status', likeLatest);

    ctx.body = {
        art
    }
})

//获取当前一期的下一期刊
router.get('/:index/next', new Auth().m, async (ctx, next) => {
    const v = await new PositiveIntegerValidator().validate(ctx, {
        id: 'index'
    })

    const index = v.get('path.index');
    const flow = await Flow.findOne({
        where: {
            index: index + 1
        }
    });
    if (!flow) {
        throw  new global.errs.NotFound();
    }

    let art = await Art.getData(flow.art_id, flow.type);
    const likeNext = await Favor.userLikeIt(flow.art_id, flow.type, ctx.auth.uid);

    art.setDataValue('index', flow.index);
    art.setDataValue('like_status', likeNext);

    //排除某些字段
    //art.exclude = ['index','like_status']

    ctx.body = {
        art
    }
})

//获取当前一期的上一期刊
router.get('/:index/previous', new Auth().m, async (ctx, next) => {
    const v = await new PositiveIntegerValidator().validate(ctx, {
        id: 'index'
    })

    const index = v.get('path.index');
    const flow = await Flow.findOne({
        where: {
            index: index - 1
        }
    });
    if (!flow) {
        throw  new global.errs.NotFound();
    }

    let art = await Art.getData(flow.art_id, flow.type);
    const likePrevious = await Favor.userLikeIt(flow.art_id, flow.type, ctx.auth.uid);

    art.setDataValue('index', flow.index);
    art.setDataValue('like_status', likePrevious);

    ctx.body = {
        art
    }
})

// 获取某期刊详情信息
router.get('/:type/:id', new Auth().m, async (ctx, next) => {
    const v = await new ClassicValidator().validate(ctx);
    const id = v.get('path.id');
    const type = parseInt(v.get('path.type'));

    const artDetail = await new Art(id, type).getDetail(ctx.auth.uid);
    artDetail.art.setDataValue('like_status',artDetail.like_status);
    ctx.body = artDetail.art;

    //ctx.body = {
    //    art:artDetail.art,
    //    like_status:artDetail.like_status
    //}
});

// 获取报刊点赞数量
router.get('/:type/:id/favor', new Auth().m, async ctx => {
    const v = await new ClassicValidator().validate(ctx);
    const id = v.get('path.id')
    const type = parseInt(v.get('path.type'));

    /*
    const art = await Art.getData(id, type);
    if (!art) {
        throw new global.errs.NotFound();
    }

    const like = await Favor.userLikeIt(
        id, type, ctx.auth.uid
    )
    ctx.body = {
        fav_nums: art.fav_nums,
        like_status: like
    }
    */

    const artDetail = await new Art(id,type).getDetail(ctx.auth.uid)
    ctx.body = {
        fav_nums: artDetail.art.fav_nums,
        like_status: artDetail.like_status
    }

})


//获取我喜欢的期刊
router.get('/favor', new Auth().m, async (ctx) => {
    const uid = ctx.auth.uid;
    ctx.body = await Favor.getMyClassicFavors(uid);
})


module.exports = router;

/**
 * 数据库设计
 * 数据库设计是粗->细的过程
 * 1. 数据库主题有哪些
 * (1)user
 * 期刊 粗
 *  * (2)movie、(3)Sentence、(4)muisc
 * 如果把这三个模型都设计到期刊数据模型中是可以的，但是扩展性是比较差的
 * 相似性： 它们都有url,pubdate,title
 * movie中有导演
 * Sentence中有演员,
 * 如果都写在一起扩展性是不好的
 *
 * 2. 如何用数据表,标识一期一期的数据
 * 创建一个新的Model/表,来记录每一期的期刊
 * flow表:
 *
 * 3. 如何设计数据库,经验多了凭的是感觉
 ** movie、Sentence、muisc 和flow有什么区别?
 * * 实体表
 * movie、Sentence、muisc是一个实体,记录本身相关信息,
 * 实体表相当于大千世界的映射
 * * 业务表
 * flow很难找到一个具体的实体来体现,这个是抽象出来的,记录业务,用来解决业务问题的
 * * 业务表难点:
 *   (1)抽象
 *   (2)多变性:业务表没有一个具体的设计方式,存在着好/坏的业务表的区别
 *      好的业务表,会让我们操作数据表的时候变得简单,数据库性能好
 *      不好的业务表,会导致查询数据表变得繁琐,数据库性能不好
 *
 */

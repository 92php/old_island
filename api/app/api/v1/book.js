const Router = require('koa-router')
const { PositiveIntegerValidator,SearchValidator,AddShortCommentValidator } = require('../../validators/validator')
const { Auth } = require('../../../middlewares/auth')
const { HotBook } = require('../../models/hot_book')
const { Book } = require('../../models/book')
const { Favor } = require('../../models/favor')
const { Comment } = require('../../models/comment')
const {handleResult} = require('../../lib/helper')

const router = new Router({
  prefix: '/v1/book'
})



// 图书基础数据 服务
//公用型 API 公开

//nodejs 中间层
//微服务 



router.get('/hot_list',async (ctx, next) => {
    const books = await HotBook.getAll()
    ctx.body = books
  })
  
  // 书籍详情
  router.get('/:id/detail', async ctx => {
    const v = await new PositiveIntegerValidator().validate(ctx)
    const book = new Book()
    ctx.body = await book.detail(v.get('path.id'))
  })
  
  // 书籍搜索
  router.get('/search', async ctx => {
    const v = new SearchValidator().validate(ctx)
    const result = await Book.searchBookFormYuShu(v.get('query.q'), v.get('query.start'), v.get('query.count'))
    ctx.body = result
  })
  
  // 获取我喜欢的数量
  router.get('/favor/count', new Auth().m, async ctx => {
    const count = await Book.getMyFavorCount(ctx.auth.uid)
    ctx.body = {
      count
    }
  })
  
  // 书籍的点赞数
  router.get('/:book_id/favor', new Auth().m, async ctx => {
    const v = await new PositiveIntegerValidator().validate(ctx,{
      id:'book_id'
    }) 
  
    const favor = await Favor.getBookFavor(ctx.auth.uid, v.get('path.book_id'))
    ctx.body = favor
  })
  
  // 新增短评
  router.post('/add/short_comment', new Auth().m, async ctx => {
    const v = await new AddShortCommentValidator().validate(ctx,{
      id:'book_id'
    })

    const result = await Comment.addComment(v.get('body.book_id'), v.get('body.content'))
    //ctx.body = result

    handleResult()
    
  })
  
  // 获取短评
  router.get('/:book_id/short_comment', new Auth().m, async ctx => {
    const v = await new PositiveIntegerValidator().validate(ctx,{
      id:'book_id'
    }) 
    const book_id = v.get('path.book_id')
    const comments = await Comment.getComments(book_id)
    ctx.body = {
      comments,
      book_id
    }
  })

  //热搜关键词
  router.get('/hot_keyword', async ctx=>{
    ctx.body = {
      'hot':[
        'Python',
        '哈利波特',
        '村上春树',
        '白夜行',
        '韩寒'
      ]
    }
  })
  


module.exports = router

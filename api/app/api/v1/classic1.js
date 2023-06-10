//const router = require('../../app')

const Router = require('koa-router')
const router = new Router()

const {PositiveIntegerValidator} = require('../../validators/validator')


//router.get('/v1/classic/latest',(ctx,next)=>{
//    ctx.body = {key:'classic'}
//})

//http://localhost:3000/v1/3/classic/latest?param=11
router.post('/v1/:id/classic/latest',(ctx,next)=>{
    //header
    //body
    //获取参数
    const path = ctx.params
    const query = ctx.request.query
    const headers = ctx.request.header
    const body = ctx.request.body

    const v = new PositiveIntegerValidator().validate(ctx)
    //const id = v.get('path.id')
    //const id = v.get('path.id',parsed=false)

    /*
    if(!query){
        //动态
        const error = new Error('错误')
        error.error_code = 10001
        error.status = 400
        error.request_url = `${ctx.method} ${ctx.path}`

    }
    */

    ctx.body = {key:'classic'}

    //throw new Error('API Exception')
    // AOP 面向切面编程
    // 监听错误
    // 输出一段有意义的提示信息

    //koa 中间件
    //try {
        
    //} catch (error) {
        
    //}


})

module.exports = router
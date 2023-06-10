const Koa = require('koa')
const Router = require('koa-router')

//循环引用问题
//const classic = require('./api/v1/classic')

//const classic = require('./api/v1/classic')
//const book = require('./api/v1/book')  

const requireDirectory = require('require-directory')


//三种加载 
//1.commonJS    require
//2.ES6         import from
//3.AMD  

const app = new Koa()
//const router = new Router()

const modules = requireDirectory(module, './app/api',{
    visit:whenLoadModule
})

function whenLoadModule(obj){
    if(obj instanceof Router){
        app.use(obj.routes())
    }
}

//应用程序对象app

// 发送http koa 接受http请求
//中间件其实就是定义一个函数
//function test(){
//    console.log('hello')
//}
//函数注册到应用程序对象上,才叫中间件
//app.use(test)
/*
app.use(async (ctx,next)=>{
    console.log('1')
    const a = await next()
    console.log(a)
    console.log('2')
})
app.use(async (ctx,next)=>{
    console.log('3')
    //await next()
    console.log('4')
    return "haha"
})
//可以注册多个中间件
*/

/*
//加async 是因为中间价里面使用了await
app.use(async (ctx,next)=>{
    //await阻塞当前线程
    const axios = require('axios')
    const start = Date.now()
    const res = await axios.get('http://swoole.yiwenbing.com')
    console.log(res)
    const end = Date.now()
    console.log(end-start)
    //线程阻塞
})
*/

/*
app.use((ctx,next)=>{
    console.log(1)
    next()
    console.log(2)
})
app.use(async (ctx,next)=>{
    console.log(3)
    const axios = require('axios')
    const res = await axios.get('http://swoole.yiwenbing.com')
    next()
    console.log(4)
})
//保证按照洋葱模型执行先决条件是每个中间件函数前面加上async 同时如果中间件里面有next,一定要在next前面加上await
*/

/*
//洋葱模型 中间件传值
app.use(async (ctx,next)=>{
    console.log(1)
    await next()
    const r = ctx.r
    console.log(r)
    console.log(2)
})
app.use(async (ctx,next)=>{
    console.log(3)
    const axios = require('axios')
    const res = await axios.get('http://swoole.yiwenbing.com')
    ctx.r = res
    await next()
    console.log(4)
})
*/

/*
//http://localhost:3000/classic/latest
app.use(async (ctx,next)=>{
    console.log(ctx.path)
    console.log(ctx.method)
    if(ctx.path==="/classic/latest" && ctx.method==="GET"){
        //ctx.body = 'classic'
        ctx.body = {key:'classic'}
    }
})
*/

/*
router.get('/classic/latest',(ctx,next)=>{
    ctx.body = {key:'classic'}
})
*/


// 客户端兼容性  v1  v2 v3 
//api 版本 业务变动 
// api 携带版本号
//1. 路径
//2. 查询参数
//3. header
// 开闭原则  修改关闭 扩展开放

/*
router.get('/v1/classic/latest',(ctx,next)=>{
    ctx.body = {key:'classic'}
})
router.get('/v1/book/latest',(ctx,next)=>{
    ctx.body = {key:'book'}
})
*/


//app.use(router.routes())

/*
module.exports = {
    router:router
}
*/

//app.use(book.routes())
//app.use(classic.routes())


app.listen(3000)

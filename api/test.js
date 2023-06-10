//function test(){
//    console.log("hello")
//}

//test()

//后端：读写数据库 api
//写出好的代码
//提高开发效率
// 悲观锁 乐观锁 事物 脏读 幻读

// nodejs web框架 koa  express

//koa特点  洋葱模型 精简
//直接用不太方便，需要二次开发
//定制化能力强  

// Lin CMS    KOA + Vue


/*
async function f1(){
    return "hello"
}

console.log(f1())
*/

//异常处理
// 没有发生异常 正常返回结果
// 无异常 执行，不需要结果 undefined
// 发生了异常

//函数设计
// 判断出异常 return false null
// throw  new Error

//全局异常处理
// 机制  监听到任何异常

/*
function func1(){
    func2()
}
function func2(){
    //const r= func3()
    //if(!r){
    //
    //}

    try {
        func3()
    } catch (error) {
        
    }
}
function func3(){
    //return false

    throw new Error()
}

function func4(){
    
    try {
       // console.log(1/0)
       console.log(1/a)
    } catch (error) {
        throw error
    }
    return 'success'
}

console.log(func4())
*/

async function func5(){
    try {
       // func6()  // Unhandled promise
        await func6()
    } catch (error) {
        console.log('error1')
    }
}

function func6(){
    return new Promise((resolve,reject)=>{
        setInterval(function(){
            const r = Math.random()
            if(r<0.5){
                reject('error async')
            }
        })
    })
}

func5()









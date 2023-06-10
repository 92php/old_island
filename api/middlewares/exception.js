const {HttpException} = require('../core/http-exception')

const catchError = async (ctx, next) => {
    try {
        await next()

    } catch (error) {
        //已知异常 和未知异常

        // error 堆栈调用信息
        // error 简化 清晰明了的信息 给前端
        // HTTP status code 2xx 4xx 5xx

        // message
        // error_code 开发者自己定义 10001 20003
        // require_url 当前请求的url 

        // 开发环境
        const isHttpException = error instanceof HttpException
        const isDev = global.config.environment === 'dev'

        if (isDev && !isHttpException) {
            throw error
        }

        // 生成环境
        if (isHttpException) {
            ctx.body = {
                msg: error.msg,
                error_code: error.errorCode,
                request: `${ctx.method} ${ctx.path}`
            }
            ctx.status = error.code

        } else {
            ctx.body = {
                msg: "未知错误！",
                error_code: 9999,
                request: `${ctx.method} ${ctx.path}`
            }
            ctx.status = 500
        }
    }
}

module.exports = catchError

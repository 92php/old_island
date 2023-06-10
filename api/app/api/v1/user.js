const Router = require('koa-router')

const {RegisterValidator} = require('../../validators/user')
const {User} = require('@models/user')
const {handleResult} = require('../../lib/helper')

//const bcrypt = require('bcryptjs')

const router = new Router({
    prefix: '/v1/user'
})

// 用户注册
router.post('/register', async (ctx) => {
    const v = await new RegisterValidator().validate(ctx)
    
    //const salt = bcrypt.genSaltSync(10)
    // 位数，成本
    //明文，加密不同， 彩虹攻击 
    //const psw = bcrypt.hashSync(v.get('body.password2'),salt)

    const user = {
        email: v.get('body.email'),
        password: v.get('body.password2'),
        //password: psw,
        nickname: v.get('body.nickname')
    }

    const r = await User.create(user)

    handleResult('注册成功')
    //throw new global.errs.Success()
})

module.exports = router

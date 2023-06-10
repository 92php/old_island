const util = require('util')   //nodejs 提供的帮助工具
const axios = require('axios')

const {User} = require('../models/user')
const {generateToken} = require('../../core/util')
const {Auth} = require('../../middlewares/auth')

class WXManager {
    static async codeToToken(code) {
        // code
        // 1.code  前端小程序生成 
        // 2.服务端：后端拿到code调用微信提供的服务，最后返回openid
        // openid 唯一标识

        // 显示注册
        // 唯一标识
        // code
        // appid
        // appsecret
        // url
        const url = util.format(global.config.wx.loginUrl,
            global.config.wx.appId,
            global.config.wx.appSecret,
            code)

        const result = await axios.get(url)

        if (result.status !== 200) {
            throw new global.errs.AuthFailed("openid获取失败")
        }

        const errCode = result.data.errcode
        const errMsg = result.data.errmsg
        if (errCode) {
            throw new global.errs.AuthFailed("openid获取失败: " + errMsg)
        }

        // opedId
        // 建立档案 user uid
        // openId

        // 判断数据库是否存在微信用户 openid
        let user = await User.getUserByOpenid(result.data.openid)

        // 如果不存在，就创建一个微信小程序用户
        if (!user) {
            user = await User.createUserByOpenid(result.data.openid)
        }

        return generateToken(user.id, Auth.AUSE)
    }
}

module.exports = {
    WXManager
}
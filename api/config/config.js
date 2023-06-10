module.exports = {
    // prod
    environment: 'dev',
    database: {
        dbName: 'wxapp',
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root'
    },
    security: {
        secretKey: "abcdefg",
        // 过期时间 1小时
        expiresIn: 60 * 60
    },
    wx: {
        appId: '',
        appSecret: '',
        loginUrl: 'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code'
    },
    yushu:{
        detailUrl:'http://t.yushu.im/v2/book/id/%s',
        keywordUrl:'http://t.yushu.im/v2/book/search?q=%s&count=%s&start=%s&summary=%s'
      },
    host:'http://localhost:3000/'
}

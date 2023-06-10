const {sequelize} = require('../../core/db');
const {Sequelize, Model} = require('sequelize');


// 静态资源 图片 js css html  消耗流量
// 1.网站目录下
// 2.静态资源服务器 微服务 带宽足够
// 3.云服务 OSS 贵
// 4.github

//无感知刷新令牌
//1.二次重发，通过特定状态（令牌失效 403），再次获取新的令牌，再获取数据
//2.webapp 保存用户账号和密码到缓存，再次获取新的token

//3.双令牌
// access_token    refresh_token
// 当access_token（2小时）令牌失效了，就用refresh_token（一个月）令牌来获取新的令牌,并且延长refresh_token令牌失效时间






//公共字段
const classicFields = {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    image:{ 
        type:Sequelize.STRING,
        //get(){
        //    return global.config.host + this.getDatavalue('image')
        //}
    },
    content: Sequelize.STRING,
    pubdate: Sequelize.DATEONLY,
    fav_nums: {
        type: Sequelize.INTEGER,
        defaultValue: 0
    },
    title: Sequelize.STRING,
    type: Sequelize.TINYINT   //100 电影，200 音乐，300 句子
}

// 电影
class Movie extends Model {

}

Movie.init(classicFields, {
    sequelize,
    tableName: 'movie'
})

//句子
class Sentence extends Model {

}

Sentence.init(classicFields, {
    sequelize,
    tableName: 'sentence'
})


// 音乐
class Music extends Model {

}

const musicFields = Object.assign({url: Sequelize.STRING}, classicFields)
Music.init(musicFields, {
    sequelize,
    tableName: 'music'
})

module.exports = {
    Movie,
    Sentence,
    Music
}
const {sequelize} = require('../../core/db')
const {Sequelize, Model} = require('sequelize')

class Flow extends Model {

}

Flow.init({
    index: Sequelize.INTEGER,  //期刊序号
    art_id: Sequelize.INTEGER,  //对应move,music,sencence 表id
    type: Sequelize.INTEGER   //100 电影，200 音乐，300 句子
}, {
    sequelize,
    tableName: 'flow'
})

module.exports = {
    Flow
}
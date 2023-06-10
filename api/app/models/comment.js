const { Model, Sequelize } = require('sequelize')
const { sequelize } = require('../../cores/db')

class Comment extends Model {

  //注意：如果在Model中定义构造函数，会有问题，接口返回的字段，只会是有defaultValue的字段
  //constructor(){
  //  super()
  //}


  static async addComment (bookId, content){
    // 输入同内容短评，不插入，而是+1
    const comment = await Comment.findOne({
      where: {
        book_id: bookId,
        content
      }
    })
    if(!comment) {
      return await Comment.create({
        book_id: bookId,
        nums: 1,
        content
      })
    }else{
      return await comment.increment('nums', { by: 1 })
    }
    
  }

  static async getComments(book_id){
    const comments = await Comment.findAll({
      where: {
        book_id
      }
    })
    return comments
  }

  /*
  //去除不用的一些字段
  toJSON(){
    // this
    // this.dataValues //全部的字段
    return {
      content:this.getDataValue('content'),
      nums:this.getDataValue('num')
    }
  }
  */
}


//Comment.prototype.exclude = ['book_id','id']

Comment.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true
  },
  content: Sequelize.STRING(12),
  nums: {
    type: Sequelize.INTEGER,
    defaultValue: 0
  },
  book_id: Sequelize.INTEGER
}, {
  //sequelize: db,
  sequelize,
  tableName: 'book_comment'
})

module.exports = {
  Comment
}
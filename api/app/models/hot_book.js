const {Sequelize, Model, Op} = require('sequelize')
const { sequelize } = require('../../cores/db')
const { Favor } = require('./favor')


class HotBook extends Model {
  
  // 查询所有的书籍
  static async getAll(){
    const books = await HotBook.findAll({
      order: ['index']
    })
    const ids = []
    books.forEach(book => {
      ids.push(book.id)
    })
    //点赞数
    const favors = await Favor.findAll({
      where: {
        art_id: {
          [Op.in]: ids
        },
        type: 400
      },
      group: ['art_id'],
      attributes: ['art_id', [Sequelize.fn('COUNT', '*'), 'count']]
    })

    books.forEach(book => {
      HotBook._getEachBooksStatus(book, favors)
    })
    return books
  }

  static _getEachBooksStatus(book, favors){
    let count = 0
    favors.forEach(favor => {
      if(book.id === favor.art_id) {
        count = favor.get('count')
      }
    })
    book.setDataValue('fav_nums', count)
    return book
  }

}

//并发（concurrency）：把任务在不同的时间点交给处理器进行处理。在同一时间点，任务并不会同时运行。
//并行（parallelism）：把每一个任务分配给每一个处理器独立完成。在同一时间点，任务一定是同时运行。

//hot_book表中id是基础服务中的id,不是hot_book表主键id

HotBook.init({
  index: Sequelize.INTEGER,       // 用于排序
  image: Sequelize.STRING,
  author: Sequelize.STRING,
  title: Sequelize.STRING
}, {
  //sequelize: db,
  sequelize,
  tableName: 'hot_book'
})

module.exports = {
  HotBook
}
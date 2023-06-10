const {Sequelize,Model} = require('sequelize')
const {unset,clone,isArray} = require('lodash')
const {
    dbName,
    host,
    port,
    user,
    password
} = require('../config/config').database

const sequelize = new Sequelize(dbName, user, password, {
    dialect: 'mysql',
    host,
    port,
    logging: true,
    timezone: '+08:00',
    define: {
        // create_time && update_time
        timestamps: true,
        // delete_time
        paranoid: true,
        createdAt: 'created_at',
        updatedAt: 'updated_at',
        deletedAt: 'deleted_at',
        // 把驼峰命名转换为下划线
        underscored: true,
        freezeTableName: true,
        scopes: {
            bh: {
                attributes: {
                    exclude: ['updated_at', 'deleted_at', 'created_at']
                }
            }
        }
    }
})


// 创建模型
sequelize.sync({
    force: false
})



Model.prototype.toJSON = function(){
    //let data = this.dataValues
    let data = clone(this.dataValues)
    unset(data,'updated_at')
    unset(data,'deleted_at')
    unset(data,'created_at')

    for(key in data){
        if(key === 'image'){
            if(!data[key].startsWith('http'))
                data[key] = global.config.host + data[key]
        }
    }

    if(isArray(this.exclude)){
        this.exclude.forEach(
            (value)=>{
                unset(data.value)
            }
        )
    }

    return data
}



module.exports = {
    sequelize
}

//module.exports = {
//    db:sequelize
//}

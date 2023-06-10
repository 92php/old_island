const {
    LinValidator,
    Rule
} = require('../../core/lin-validator')

class PositiveIntegerValidator extends LinValidator{
    constructor(){
        super()
        this.id = [
            new Rule('isInt','需要是正整数',{min:1})
        ]
    }
}

class SearchValidator extends LinValidator{
    constructor(){
        super()
        this.q = [
            new Rule('isLength','搜索关键词不能为空',{min:1,max:16})
        ]
        this.start = [
            new Rule('isInt','不符合规范',{
                min:0,
                max:60000
            }),
            new Rule('isOptional','',0)
        ]
        this.count = [
            new Rule('isInt','不符合规范',{
                min:1,
                max:20
            }),
            new Rule('isOptional','',20)
        ]
    }
}

class AddShortCommentValidator extends PositiveIntegerValidator{
    constructor(){
        this.content = [
            new Rule('isLength','必须在1到12个字符之间',{
                min:1,
                max:12
            })
        ]
    }
}


module.exports = {
    PositiveIntegerValidator,
    SearchValidator,
    AddShortCommentValidator
}
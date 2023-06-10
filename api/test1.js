//const obj = {
//    name:'7yue',
//    age:18
//}

const obj = {
    name:'7yue',
    age:18,
    toJSON:function(){
        return {
            name1:'8yue'
        }
    }
}

console.log(obj)
console.log(JSON.stringify(obj))  //对象变字符串


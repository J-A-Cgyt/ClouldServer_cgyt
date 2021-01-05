//这是自行建立的script文件 用来放一些函数 一个script中可以放一堆函数
function myFristOutFunc() {
    document.getElementById("demo").innerHTML = "这是通过在.js文件中的script进行修改的尝试";
}

function alertTry() {
    window.alert("这是弹出的信息");
}

function writeTry() {
    document.write(Date()); //整个html文档会被刷新 这写的应该也是HTML格式
}

function jsGrammar() {
    //用于测试各种语法 但是注意这里不会报错 注意如果js中有错会导致整个JS文件失效 相关错误需要再浏览器的开发者界面才能发现错误
    var car = { //对象，类似C++中类的实例
        manufacture : "volvo",
        model : "S90",
        edition : "B5 智逸豪华版",
        sweptVol : 2.0,
        price : 406900
    }

    var brands = ["Audi","BMW","Mercedes"] //数组
    document.getElementById("demo").innerHTML = car.manufacture;
}

function displayDIV(boolean) {  //存在的问题 如何和后端进行数据交换？
    if (boolean) {
        document.getElementById("objectx").style.display = "none";
    }
    else {
        document.getElementById("objectx").style.display = "";
    }
}
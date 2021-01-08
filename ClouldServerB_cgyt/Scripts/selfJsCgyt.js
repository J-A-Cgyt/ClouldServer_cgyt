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

function refreshChart() {
    var ctxx = document.getElementById("chartThird");
    var chart3 = new Chart(ctxx, {
        type: 'line',
        data: {
            labels: ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90"],
            datasets: [{
                label: "实时产量/10s",
                backgroundColor: 'rgba(233,132,29,0.2)',
                borderColor: 'rgb(233,132,29)',
                data: [32, 53, 44, 59, 36, 48, 53, 48, 40, 57],
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}

function backPlatDataChart(arrayT) {

    var ctx4 = document.getElementById("chartBackCan");
    var chart4 = new Chart(ctx4, {
        type: 'line',
        data: {
            labels: ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90"],
            datasets: [{
                label: "实时产量/10s",
                backgroundColor: 'rgba(33,232,129,0.2)',
                borderColor: 'rgb(23,232,129)',
                data: arrayT,
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}

function loadXMLDoc() {
    var xmlhttp;
    var txt, x, i;

    var arrayT = new Array(); //数组试试

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {  //获取xml之后的动作必须在这个函数内执行 否则没动作
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            //document.getElementById("").innerHTML=xmlhttp.responseText;
            xmlDoc = xmlhttp.responseXML;
            txt = "";
            x = xmlDoc.getElementsByTagName("x");
            for (i = 0; i < x.length; i++) {
                txt = txt + x[i].childNodes[0].nodeValue + "&nbsp";
                arrayT[i] = x[i].childNodes[0].nodeValue;
            }
            document.getElementById("outPut").innerHTML = txt;
            backPlatDataChart(arrayT);
        }
    }

    xmlhttp.open("GET", "chartData/dataToShow.xml", true); //是能拿到数据 但是如何解析？
    xmlhttp.send();
}
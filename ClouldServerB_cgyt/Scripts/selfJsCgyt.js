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


//mainpage中的chartjs画图====================================================================================================

//状态图绘制----------------------------------------------------------------------------------------
function loadChartFromXMLA() {
    var xmlhttp;
    var nodeNormal, nodePaused, nodeFault;
    var normal, paused, fault;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            xmlDoc = xmlhttp.responseXML;

            nodeNormal = xmlDoc.getElementsByTagName("normal");
            nodePaused = xmlDoc.getElementsByTagName("paused");
            nodeFault = xmlDoc.getElementsByTagName("fault");

            normal = nodeNormal[0].childNodes[0].nodeValue;
            paused = nodePaused[0].childNodes[0].nodeValue;
            fault = nodeFault[0].childNodes[0].nodeValue;

            drawStatePie(normal, paused, fault);
        }
    }
    xmlhttp.open("GET", "chartData/mainPageChartData.xml", true); //是能拿到数据 但是如何解析？
    xmlhttp.send();
}

function drawStatePie(normal, paused, fault) {
    var ctxCGS = document.getElementById("cake_Global_State");

    var chartCGS = new Chart(ctxCGS, {
        type: "doughnut",

        data: {
            datasets: [
                {
                    data: [normal, paused, fault],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(224, 162, 35, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(224, 162, 35, 1)'
                    ]
                }
            ],

            labels: ["normal", "paused", "fault"]
        },

        options:{}
    })
}

//计划图绘制----------------------------------------------------------------------------------------
function loadChartFromXMLB() {
    var xmlhttp;
    var progress, x, y;
    var prog; //计划进度数值

    var outputLine = new Array(); //数组试试
    var passRateLine = new Array(); 

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            xmlDoc = xmlhttp.responseXML;
            //绘制计划监控线图
            x = xmlDoc.getElementsByTagName("output");  //这个读取好像是可以穿透的
            y = xmlDoc.getElementsByTagName("passRate");
            for (i = 0; i < x.length; i++) {
                outputLine[i] = x[i].childNodes[0].nodeValue;
                passRateLine[i] = y[i].childNodes[0].nodeValue;
            }
            drawDoubleLine(outputLine, passRateLine);
            //绘制进度饼图
            progress = xmlDoc.getElementsByTagName("progress_Global_Plan");
            prog = progress[0].childNodes[0].nodeValue;
            drawProgressPie(prog);
        }
    }

    xmlhttp.open("GET", "chartData/mainPageChartData.xml", true); //是能拿到数据 但是如何解析？
    xmlhttp.send();
}

    //绘制双线图（计划监控）
function drawDoubleLine(outputLine, passRateLine) {
    var ctxLGP = document.getElementById("line_Global_Plan");

    var chartLGP = new Chart(ctxLGP, {  //将图标绘制在第一个参数所代表的canvas中
        //图表类型
        type: 'line',

        //数据集
        data: {
            labels: ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90"],
            datasets: [
                {
                    label: "实时产量",
                    backgroundColor: 'rgba(225,199,32,0.2)',
                    borderColor: 'rgb(225,199,32)',
                    data: outputLine,
                },
                {
                    label: "实时合格率",
                    backgroundColor: 'rgba(25,129,232,0.2)',
                    borderColor: 'rgb(25,129,232)',
                    data: passRateLine,
                }
            ] //这个方括号里面的元素是不同系列的数据点 可以实现一个网格上画多条线
        },

        //配置选项
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

function drawProgressPie(progress) {
    var ctxPGP = document.getElementById("progress_Global_Plan");

    var chartPGP = new Chart(ctxPGP, {
        type: 'pie',
        data: {
            datasets: [
                {
                    data: [progress, 100 - progress],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)']
                },
            ],

            labels:["completed","rest"]
        },
        options: {
        }
    })
}

//资源图绘制----------------------------------------------------------------------------------------
function loadChartFromXMLC() {
    var xmlhttp;
    var i,j;
    var rawNode, energyNode;
    var rawArray = new Array();
    var energyArray = new Array();

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            xmlDoc = xmlhttp.responseXML;

            rawNode = xmlDoc.getElementsByTagName("raw");
            energyNode = xmlDoc.getElementsByTagName("energy");
            for (i = 0; i < rawNode.length; i++) {
                rawArray[i] = rawNode[i].childNodes[0].nodeValue;
            }
            for (j = 0; j < energyNode.length; j++) {
                energyArray[j] = energyNode[j].childNodes[0].nodeValue;
            }

            //调用绘制图像的函数
            drawResourceChart(rawArray, energyArray);
        }
    }
    xmlhttp.open("GET", "chartData/mainPageChartData.xml", true); //是能拿到数据 但是如何解析？
    xmlhttp.send();
}

function drawResourceChart(raw,energy) {
    var ctxBGR = document.getElementById("bar_Global_Resource");
    var ctxLGR = document.getElementById("line_Global_Resource");

    var chartBGR = new Chart(ctxBGR, {
        type: "bar",
        data: {
            labels: ["资源0", "资源1", "资源2", "资源3", "资源4", "资源5"],
            datasets: [{
                label:"资源存量",
                data: raw,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
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
    })

    var chartLGR = new Chart(ctxLGR, {
        type: "line",
        data: {
            labels: ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90"],
            datasets: [{
                label: "能源消耗",
                backgroundColor: 'rgba(215,129,22,0.2)',
                borderColor: 'rgb(215,129,22)',
                data: energy,
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
    })
}
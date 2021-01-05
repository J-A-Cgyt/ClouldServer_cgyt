<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="techStudy.aspx.cs" Inherits="ClouldServerB_cgyt.techStudy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> 这是用来试验各种功能与技术的网页 </title>     
    
    <script type="text/javascript">
        function displayDate() {
            document.getElementById("demo").innerHTML = Date(); //操作HTML元素用innerHTML
        }
        function myFunc() {
            document.getElementById("demo").innerHTML = "第二个JavaScript函数"
        }
    </script>
    <!--script放在哪无所谓 主要是调用函数的那个元素 似乎有些要求 虽然调试通过，但是还不知原因是啥 两种形式都行啊 也不知道为啥刚才不行-->
    <script>
        document.write("<h2>这是通过script向html页写入的内容</h2>");
    </script> 
    
    <!--看来写入的位置在form之前的body中,即body的最前端 注意 直接执行的script并没有放在某个函数中-->
    <script src="Scripts/selfJsCgyt.js"></script>
    <!--这一句导入了文件中写的script内容 所以里面可以啥都没-->

    <script src="Scripts/Chart.js"></script> <!--此句导入chart.js的库--> 
    <!--head部分似乎还没有绘制完html元素，在此处使用getelementById会找不到元素-->
</head>

<body>

    <p> script写入位置确认 <br /></p>

    <!--form可以认为是asp.net最外层的容器 在这个外面构建的asp内容也许会出错-->
    <form id="form1" runat="server">
        <h1> 这里用来试验各种HTML与ASP.NET还有 Javascript的各种技术 </h1>
        <p> 测试通过的各种交互、数据刷新等技术可以应用于正式的设计网页中 </p>
        <div>
            <p> 这里是放置相关控件和元素的主要div 布局就不在这个文件中尝试了 </p> <br />
            <p id="demo"> 这是一个demo段落 </p>    

            <button id="button_time" type="button" onclick="displayDate()"> 显示日期和时间 </button> &nbsp
            <input id="Button1" type="button" value="input形式的button" onclick="myFunc()"/> &nbsp
            <input id="Button2" type="button" value="外部script调用" onclick="myFristOutFunc()" /> &nbsp
            <input id="Button3" type="button" value="弹出警告框" onclick="alertTry()" /> &nbsp <br /> <br />
            <input id="Button4" type="button" value="document.write方法" onclick="writeTry()" /> &nbsp 
            <input id="Button5" type="button" value="JS语法学习" onclick="jsGrammar()" /> &nbsp  <br /> <br />
            <input id="Button6" type="button" value="隐藏DIV" onclick="displayDIV(true)"/> &nbsp 
            <input id="Button7" type="button" value="显示DIV" onclick="displayDIV(false)"/> &nbsp 

        </div>

        <div id="objectx">
            <p>
                这是一个测试隐藏功能是否有用的div  <br />
                还是使用外置的script <br />
                功能与2021/1/4测试通过
            </p>
        </div> <!--用于测试隐藏功能的div-->

        <hr />
        <div> <!-- ScriptManager 的学习div-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> <!--这个标签似乎只需要声明一下-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
            <ContentTemplate> <!-- 这个标签里面的东西可以被局部更新，不触发回发 使用了这个以后似乎是的CSS无效了 -->
                <asp:Label ID="Label1" runat="server" Text="这是一串字符" Font-Size="12px"></asp:Label>
                <br /> <br />
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
                字符的大小(px)
            </ContentTemplate>
        </asp:UpdatePanel>   
        </div>
        <div id="chartjsStudy" style="float:left; width:40%; height:400px;">
            <h3>这是一个用来学习Chart.js的div 如果样子还可以就当作主要的图表显示组件</h3> <br />
            <canvas id="myChart" width="30" height="20"></canvas> 
            <!--
                canvas的初始长宽只影响绘制图表后的长宽比 实际的长宽会继承canvas父标签的长宽 图表不会遮挡已存在的元素 这些特性可以在配置选项（option）中更改
                关联网址 https://chartjs.bootcss.com/docs/general/responsive.html 也建议使用专门的外层容器包裹canvas并实现尺寸调整
                -->
            <script type="text/javascript">
                var ctx = document.getElementById("myChart");
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                        datasets: [{
                            label: '# of Votes',
                            data: [12, 19, 3, 5, 2, 3],
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
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
            </script>
            <hr />
            <canvas id="chartSecond" width="3" height="2"></canvas>
            <!--若script内未定义函数，则其定义的变量是全局可见的 在不同的script中按照输入的先后顺序应该能够访问对应的变量
                由不同变量绘制的canvas可以同时存在且不会互相替代 长宽比设定仍然有效 但现在看来，好的布局方式仍旧应该是table或者div一一对应
                -->
            <script>
                var ctx2 = document.getElementById("chartSecond"); //获取要绘制图像的<canvas>元素
                var chart2 = new Chart(ctx2, {  //将图标绘制在第一个参数所代表的canvas中
                    //图表类型
                    type: 'line',

                    //数据集
                    data: {
                        labels: ["0", "3", "6", "9", "12", "15", "18"],
                        datasets: [{
                            label: "数据集",
                            backgroundColor: 'rgba(255,99,132,0.2)',
                            borderColor: 'rgb(255,99,132)',
                            data:[25,42,54,32,34,49,21],
                        }]
                    },

                    //配置选项
                    options: { }
                });
            </script>
        </div>

        <div style="float:right; width:60%; height:400px">
            <h4>这是用来学习chart.js的第二个div 合理利用一下空间 在右边</h4>
            <canvas id="chartThird" width="4" height="2" ></canvas>
            <script> refreshChart(); </script>
            <p> 可以在自建的js中调用chart.js画图通过 </p>
        </div>
    </form>
</body>
</html>

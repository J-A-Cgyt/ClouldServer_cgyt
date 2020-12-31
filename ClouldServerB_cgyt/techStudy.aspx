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
    </script> <!--看来写入的位置在form之前的body中,即body的最前端 注意 直接执行的script并没有放在某个函数中-->
    <script src="Scripts/selfJsCgyt.js"></script> <!--这一句导入了文件中写的script内容 所以里面可以啥都没-->
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
            <input id="Button3" type="button" value="弹出警告框" onclick="alertTry()" /> &nbsp <br />

        </div>
        <hr />
        <div> <!-- ScriptManager 的学习div-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> <!--这个标签似乎只需要声明一下-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
            <ContentTemplate> <!-- 这个标签里面的东西可以被局部更新，不触发回发 -->
                <asp:Label ID="Label1" runat="server" Text="这是一串字符" Font-Size="12px"></asp:Label>
                <br /> <br />
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
                字符的大小(px)
            </ContentTemplate>
        </asp:UpdatePanel>   
        </div>

    </form>
</body>
</html>

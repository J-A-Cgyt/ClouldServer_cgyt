<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="ClouldServerB_cgyt.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> 
        主页面的结构样本 
    </title> <!--title被显示在了浏览器的页面处-->
    <link rel="stylesheet" type="text/css" href="~/Content/StyleSheet_global.css"/>

    <script src="Scripts/selfJsCgyt.js"></script>
    <!--这一句导入了文件中写的script内容 所以里面可以啥都没-->

    <script src="Scripts/Chart.js"></script> <!--此句导入chart.js的库--> 
    <!--head部分似乎还没有绘制完html元素，在此处使用getelementById会找不到元素-->
</head>
<body>
    <div class="header">
        <!--这里是头-->
        <div style="float:left;width:30%;height:100%"><h2>工业云企业级监控平台</h2></div>
        <div style="float:right;width:70%;height:100%">
            <!--账号密码区-->
            <ul class="headList">
                <li>用户名</li>
                <li>信息管理</li>
                <li>头像</li>
                <li>注销</li>
                <li>注册</li>
            </ul>
        </div>
    </div> <br />
    <form id="form1" runat="server">
        <!--要实现后台代码的局部更新看来这个是必须要有的 即使有scriptmanager仍然出发了pageload 这就说明局部更新也没啥乱用了-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!--放在这里似乎实现了相关的功能，而且保证了CSS的稳定 局部刷新 updatePanel 暂时把这个东西撤回来吧-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate> </ContentTemplate></asp:UpdatePanel>
        <div class="mainbody">
            <div class="navigate">
                <!--这里是导航区-->
                <asp:TreeView ID="treeView_navigate" runat="server" BackColor="#CCCCCC" OnSelectedNodeChanged="treeView_navigate_SelectedNodeChanged" Width="100%" Height="100%" ImageSet="BulletedList2" ShowExpandCollapse="False" ExpandDepth="0">
                    <HoverNodeStyle Font-Underline="False" ForeColor="#CC9900" />
                    <LeafNodeStyle BackColor="Gray" Font-Size="12pt" HorizontalPadding="3px" VerticalPadding="3px" Width="100%" />
                    <Nodes>
                        <asp:TreeNode Text="商务" Value="1">
                            <asp:TreeNode Text="销售" Value="11"></asp:TreeNode>
                            <asp:TreeNode Text="订单" Value="12"></asp:TreeNode>
                            <asp:TreeNode Text="投标" Value="13"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="设计" Value="2">
                            <asp:TreeNode Text="CAD" Value="21"></asp:TreeNode>
                            <asp:TreeNode Text="CAE" Value="22"></asp:TreeNode>
                            <asp:TreeNode Text="CAM" Value="23"></asp:TreeNode>
                            <asp:TreeNode Text="Software Design" Value="24"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="监控" Value="3">
                            <asp:TreeNode Text="状态监控" Value="31"></asp:TreeNode>
                            <asp:TreeNode Text="计划监控" Value="32"></asp:TreeNode>
                            <asp:TreeNode Text="资源监控" Value="33"></asp:TreeNode>
                            <asp:TreeNode Text="异常监测" Value="34"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Tahoma" Font-Size="15pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="5px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <RootNodeStyle BackColor="#666666" BorderColor="#33CC33" Width="100%" Font-Bold="True"/>
                    <SelectedNodeStyle ForeColor="Yellow" HorizontalPadding="5px" VerticalPadding="5px" />
                </asp:TreeView>
            </div>
            <div class="contents">
                这里是主要内容  不知为何 无法执行在MultiView内的脚本(script)<br />
                <asp:MultiView ID="Contents" runat="server" ActiveViewIndex="0">
                    <asp:View ID="viewBis" runat="server">
                        <div class="viewdiv">
                            商务视图
                            <div class="contentLeft">
                                业务展示条目设计交互 需要有输入的文本框什么的 <br />
                                这个交互界面需要能与SQL交互
                            </div>
                            <div class="contentRight">
                                订单浏览 分为已接订单和未接的匹配订单
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="viewDesign" runat="server">
                        <div class="viewdiv">
                            设计视图 <br />
                            产品设计CAD CAE CAM三个主要部分 <br />
                            软件设计主要是虚拟环境搭建什么的 这暂时不会<br />
                        </div>
                    </asp:View>
                    <asp:View ID="viewControl" runat="server">
                        <div class="viewdiv">
                            监控视图 <br />
                            设计大头在此 <br />
                            监控内容分为：物料（资源）、设备（状态）、生产（计划）<br />
                            <div class="contentLeft"> <!--左侧div，纵向划分为三行1用于选择具体显示的车间与厂区 2用于显示厂区的静态信息 3用于显示 div无法实现局部更新 除非使用JS用后台就得回发数据-->
                                <div class="stateAndControl">                                
                                    全局状态监控<br />
                                    <div class="stateDisp">
                                        全局状态显示区<br />
                                        各种图表
                                        <div id ="state_global_chart" class="globalChart" runat="server" style="display:none">
                                            <h5>全局状态监控图表 设备状态</h5>
                                            <canvas id="cake_Global_State"></canvas> <!--饼图 设备状态总览-->
                                        </div>
                                        <div id ="plan_global_chart" class="globalChart" runat="server" style="display:none">
                                            <h5>全局计划监控图表 生产计划</h5>  <!--看来这个图的尺寸还是用专属DIV限制吧-->
                                            <div style="height:100%;width:65%;float:left"><canvas id="line_Global_Plan" width="110" height="75"></canvas> </div> <!--线图 产量与合格率-->
                                            <div style="height:100%;width:35%;float:right"><canvas id="progress_Global_Plan" width="48" height="48"></canvas> </div> <!--饼图 生产进度-->                                           
                                            <!--<script> loadChartFromXMLB(); </script>-->
                                        </div>
                                        <div id ="resource_global_chart" class="globalChart" runat="server" style="display:none">
                                            <h5>全局资源监控图表 资源状态</h5>
                                            <div style="height:50%;width:65%;"><canvas id="bar_Global_Resource"></canvas></div>
                                            <div style="height:50%;width:65%;"><canvas id="line_Global_Resource"></canvas></div>
                                        </div>
                                        <div id ="except_global_chart" class="globalChart" runat="server" style="display:none">
                                            全局异常监控图表 异常监控
                                            <ol id="expection" runat="server">
                                                <li><a href="techStudy.aspx">异常1 详细信息：……</a></li>
                                                <li><a href="techStudy.aspx">异常2 详细信息：……</a></li>
                                                <li><a href="techStudy.aspx">异常3 详细信息：……</a></li>
                                            </ol>
                                        </div>
                                    </div>
                                    <div class="ctrl">
                                        全局控制选项区<br />
                                        几个按钮
                                        <div id ="state_global_ctrl" runat="server" style="display:none"> <!--看来内部的控件排布还是得用table 具体控制选项的内容还是需要等实际内容-->
                                            全局状态控制区域 设备状态 <br />
                                            <ul>
                                                <li><asp:Button ID="Button1" runat="server" Text="控制选项1" /></li>
                                                <li><asp:Button ID="Button2" runat="server" Text="控制选项2" /></li>
                                                <li><asp:RadioButton ID="RadioButton1_1" runat="server" Text="模式A"/></li>
                                                <li><asp:RadioButton ID="RadioButton1_2" runat="server" Text="模式B"/></li>
                                                <li><asp:RadioButton ID="RadioButton1_3" runat="server" Text="模式C"/></li>                                            
                                                <li><asp:DropDownList ID="DropDownList1" runat="server">
                                                    <asp:ListItem Value="0">选项A</asp:ListItem>
                                                    <asp:ListItem Value="1">选项B</asp:ListItem>
                                                    <asp:ListItem Value="2">选项C</asp:ListItem>
                                                    <asp:ListItem Value="3">选项D</asp:ListItem>
                                                    </asp:DropDownList></li>
                                            </ul>
                                        </div>
                                        <div id ="plan_global_ctrl" runat="server" style="display:none">
                                            全局计划控制区域 生产计划
                                        </div>
                                        <div id ="resource_global_ctrl" runat="server" style="display:none">
                                            全局资源控制区域 资源状态
                                        </div>
                                        <div id ="except_global_ctrl" runat="server" style="display:none">
                                            全局异常控制区域 异常监控
                                        </div>
                                    </div>
                                </div>
                                <div class="stateAndControl">
                                    车间状态监控<br />
                                    <div class="stateDisp">
                                        车间状态显示区<br />
                                        各种图表
                                        <div id ="state_area_chart" runat="server" style="display:none">
                                            车间状态监控图表 设备状态 <br />
                                            <img src="Images/CNC.jpg" style="width:100%;height:90%"/>
                                        </div>
                                        <div id ="plan_area_chart" runat="server" style="display:none">
                                            车间计划监控图表 生产计划
                                        </div>
                                        <div id ="resource_area_chart" runat="server" style="display:none">
                                            车间资源监控图表 资源状态
                                        </div>
                                        <div id ="except_area_chart" runat="server" style="display:none">
                                            车间异常监控图表 异常监控
                                        </div>
                                    </div>
                                    <div class="ctrl">
                                        车间控制选项区<br />
                                        几个按钮
                                        <div id ="state_area_ctrl" runat="server" style="display:none">
                                            车间状态控制区域 设备状态
                                        </div>
                                        <div id ="plan_area_ctrl" runat="server" style="display:none">
                                            车间计划控制区域 生产计划
                                        </div>
                                        <div id ="resource_area_ctrl" runat="server" style="display:none">
                                            车间资源控制区域 资源状态
                                        </div>
                                        <div id ="except_area_ctrl" runat="server" style="display:none">
                                            车间异常控制区域 异常监控
                                        </div>
                                    </div>
                                </div>
                            </div>        
                            <div class="contentRight"> <!--右侧div，纵向划分为两行1用户权限下整个企业的生产状态 2选定车间状态-->
                                <div class="areaSel">  <!--监控区域选择（区域主控-现场主控选择）-->
                                    工厂选择 <br />
                                    <table class="factoryTable">
                                        <tr>
                                            <td onclick="onFactorySel(1)">工厂1</td>
                                            <td onclick="onFactorySel(2)">工厂2</td>
                                            <td onclick="onFactorySel(3)">工厂3</td>
                                            <td onclick="onFactorySel(4)">工厂4</td>
                                        </tr>
                                        <tr>
                                            <td onclick="onFactorySel(5)">工厂5</td>
                                            <td onclick="onFactorySel(6)">工厂6</td>
                                            <td onclick="onFactorySel(7)">工厂7</td>
                                            <td onclick="onFactorySel(8)">工厂8</td>
                                        </tr>
                                    </table> <br />
                                    车间选择
                                    <table class="factoryTable">
                                        <tr>
                                            <td onclick="onWorkshopSel(1)">车间1</td>
                                            <td onclick="onWorkshopSel(2)">车间2</td>
                                            <td onclick="onWorkshopSel(3)">车间3</td>
                                            <td onclick="onWorkshopSel(4)">车间4</td>
                                        </tr>
                                        <tr>
                                            <td onclick="onWorkshopSel(5)">车间5</td>
                                            <td onclick="onWorkshopSel(6)">车间6</td>
                                            <td onclick="onWorkshopSel(7)">车间7</td>
                                            <td onclick="onWorkshopSel(8)">车间8</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="areaSel">
                                    工厂信息：区域主控<br />                                   
                                    <textarea class="factoryInfo">此处记录单个工厂需要完成的任务，以区域主控中存储的信息为准</textarea>
                                </div>
                                <div class="areaSel">
                                    车间信息：现场主控 细化描述：现场主控的管辖范围最大为一个车间，最小为一条生产线 较大规模的车间可以按照任务分别使用多个现场主控进行配合管理
                                </div>
                            </div>
                        </div>                                  
                    </asp:View> 
                </asp:MultiView>  
            </div>
        </div>
         <!--放在这里似乎实现了相关的功能 局部刷新 updatePanel-->                                          
    </form>
    <div class="foot">
        这里是网页的尾部 powered by CGYT
    </div>
</body>
</html>

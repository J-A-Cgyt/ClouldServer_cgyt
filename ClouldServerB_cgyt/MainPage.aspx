<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="ClouldServerB_cgyt.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> 
        主页面的结构样本 
    </title> <!--title被显示在了浏览器的页面处-->
    <link rel="stylesheet" type="text/css" href="~/Content/StyleSheet_global.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            这里是头
        </div>
        <div class="mainbody">
            <div class="navigate">
                这里是导航区 <br />
                <asp:TreeView ID="treeView_navigate" runat="server" BackColor="#CCCCCC" OnSelectedNodeChanged="treeView_navigate_SelectedNodeChanged" Width="100%" Height="100%" ImageSet="BulletedList2" ShowExpandCollapse="False" ExpandDepth="0">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <LeafNodeStyle BackColor="Gray" Font-Size="12pt" HorizontalPadding="3px" VerticalPadding="3px" Width="100%" />
                    <Nodes>
                        <asp:TreeNode Text="商务" Value="1">
                            <asp:TreeNode Text="新建节点" Value="11"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="12"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="13"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="设计" Value="2">
                            <asp:TreeNode Text="新建节点" Value="21"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="22"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="23"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="监控" Value="3">
                            <asp:TreeNode Text="新建节点" Value="31"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="32"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="33"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Tahoma" Font-Size="15pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="5px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <RootNodeStyle BackColor="#666666" BorderColor="#33CC33" Width="100%" Font-Bold="True"/>
                    <SelectedNodeStyle ForeColor="#5555DD" HorizontalPadding="5px" VerticalPadding="5px" />
                </asp:TreeView>
            </div>
            <div class="contents">
                这里是主要内容 <br />
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
                            软件设计主要是虚拟环境搭建什么的 这暂时不会
                        </div>
                    </asp:View>
                    <asp:View ID="viewControl" runat="server">
                        <div class="viewdiv">
                            监控视图 <br />
                            设计大头在此 <br />
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
        <div class="foot">
            这里是网页的尾部
        </div>
    </form>
</body>
</html>

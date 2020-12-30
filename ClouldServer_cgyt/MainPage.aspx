<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="ClouldServer_cgyt.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> 
        主页面的结构样本 
    </title> <!--title被显示在了浏览器的页面处-->
    <link rel="stylesheet" type="text/css" href="~/StyleSheet_global.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            这里是头
        </div>
        <div class="mainbody">
            <div class="navigate">
                这里是导航区 <br />
                <asp:TreeView ID="TreeView1" runat="server" ShowLines="True">
                    <Nodes>
                        <asp:TreeNode Text="商务" Value="0">
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="设计" Value="1">
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="监控" Value="2">
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                            <asp:TreeNode Text="新建节点" Value="新建节点"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                </asp:TreeView>
            </div>
            <div class="contents">
                这里是主要内容 <br />
                <asp:MultiView ID="Contents" runat="server">
                    <asp:View ID="viewBis" runat="server"></asp:View>
                    <asp:View ID="viewDesign" runat="server"></asp:View>
                    <asp:View ID="viewControl" runat="server"></asp:View>
                </asp:MultiView>
            </div>
        </div>
        <div class="foot">
            这里是网页的尾部
        </div>
    </form>
</body>
</html>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClouldServerB_cgyt
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void treeView_navigate_SelectedNodeChanged(object sender, EventArgs e)
        {   //更改内容区域显示的内容
            int selectedIndex = int.Parse(treeView_navigate.SelectedValue);
            if (selectedIndex < 10) {
                Contents.ActiveViewIndex = selectedIndex - 1;
                treeView_navigate.CollapseAll();
                treeView_navigate.SelectedNode.Expand();
            }
            else{
                Contents.ActiveViewIndex = selectedIndex / 10 - 1;
            }
        }
    }
}
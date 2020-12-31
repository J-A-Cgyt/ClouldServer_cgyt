using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClouldServerB_cgyt
{
    public partial class techStudy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e) //在调用这种后台的时候似乎并未刷新整个网页
        {
            try {
                Label1.Font.Size = FontUnit.Point(Convert.ToInt32(TextBox1.Text)); //改变字体
            }
            catch {
                Response.Write("错误"); //抛出异常
            }
        }
    }
}
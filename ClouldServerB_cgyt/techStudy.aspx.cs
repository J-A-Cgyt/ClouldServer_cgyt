using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ClouldServerB_cgyt
{
    public partial class techStudy : System.Web.UI.Page
    {
        public int testData = 3;
        public XmlDocument dataForView;

        protected void Page_Load(object sender, EventArgs e)
        {
            testData = 10;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e) //对不起 这地方触发了pageload 这就没问题了重新实例化的时候刷新了testArray
        {
            //testArray[0] = Convert.ToInt32(TextBox1.Text);
            Label1.Font.Size = FontUnit.Point(Convert.ToInt32(TextBox1.Text)); //改变字体
            dataForView = new XmlDocument();
            dataForView.Load(Server.MapPath("/chartData/dataToShow.xml"));  //注意这个路径的转化 否则从IIS服务器的根目录找铁定找不见
            XmlNode root = dataForView.ChildNodes[1];
            XmlNodeList points = root.SelectNodes("P");  //这个选择只能选择下一级子标签 下两级的孙子标签不可见
            for(int k=points.Count-2; k>=0; k--)
            {
                points[k + 1].LastChild.InnerText = points[k].LastChild.InnerText;
            }
            points[0].LastChild.InnerText = TextBox1.Text;

            dataForView.Save(Server.MapPath("/chartData/dataToShow.xml"));  //这样能够实现XML文件的写入 实现使用AJAX的数据修改 

            //定时刷新两种方法 1、前台定时器 前台同时调用后台数据刷新和前台绘图函数 2、后台定时器 后台调用数据刷新和前台绘图

            int x = 0;
        }

    }
}
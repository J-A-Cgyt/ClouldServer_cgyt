﻿using System;
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
                if (Contents.ActiveViewIndex == 0) {
                }
                else if (Contents.ActiveViewIndex == 1) {
                }
                else if (Contents.ActiveViewIndex == 2) {
                    int leafIndex = selectedIndex % 10;
                    switch (leafIndex)
                    {
                        case 1:
                            state_global_chart.Style["display"] = "";
                            plan_global_chart.Style["display"] = "none";
                            resource_global_chart.Style["display"] = "none";
                            except_global_chart.Style["display"] = "none";

                            state_global_ctrl.Style["display"] = "";
                            plan_global_ctrl.Style["display"] = "none";
                            resource_global_ctrl.Style["display"] = "none";
                            except_global_ctrl.Style["display"] = "none";

                            state_area_chart.Style["display"] = "";
                            plan_area_chart.Style["display"] = "none";
                            resource_area_chart.Style["display"] = "none";
                            except_area_chart.Style["display"] = "none";

                            state_area_ctrl.Style["display"] = "";
                            plan_area_ctrl.Style["display"] = "none";
                            resource_area_ctrl.Style["display"] = "none";
                            except_area_ctrl.Style["display"] = "none";
                            break;
                        case 2:
                            state_global_chart.Style["display"] = "none";
                            plan_global_chart.Style["display"] = "";
                            resource_global_chart.Style["display"] = "none";
                            except_global_chart.Style["display"] = "none";

                            state_global_ctrl.Style["display"] = "none";
                            plan_global_ctrl.Style["display"] = "";
                            resource_global_ctrl.Style["display"] = "none";
                            except_global_ctrl.Style["display"] = "none";

                            state_area_chart.Style["display"] = "none";
                            plan_area_chart.Style["display"] = "";
                            resource_area_chart.Style["display"] = "none";
                            except_area_chart.Style["display"] = "none";

                            state_area_ctrl.Style["display"] = "none";
                            plan_area_ctrl.Style["display"] = "";
                            resource_area_ctrl.Style["display"] = "none";
                            except_area_ctrl.Style["display"] = "none";
                            break;
                        case 3:
                            state_global_chart.Style["display"] = "none";
                            plan_global_chart.Style["display"] = "none";
                            resource_global_chart.Style["display"] = "";
                            except_global_chart.Style["display"] = "none";

                            state_global_ctrl.Style["display"] = "none";
                            plan_global_ctrl.Style["display"] = "none";
                            resource_global_ctrl.Style["display"] = "";
                            except_global_ctrl.Style["display"] = "none";

                            state_area_chart.Style["display"] = "none";
                            plan_area_chart.Style["display"] = "none";
                            resource_area_chart.Style["display"] = "";
                            except_area_chart.Style["display"] = "none";

                            state_area_ctrl.Style["display"] = "none";
                            plan_area_ctrl.Style["display"] = "none";
                            resource_area_ctrl.Style["display"] = "";
                            except_area_ctrl.Style["display"] = "none";
                            break;
                        case 4:
                            state_global_chart.Style["display"] = "none";
                            plan_global_chart.Style["display"] = "none";
                            resource_global_chart.Style["display"] = "none";
                            except_global_chart.Style["display"] = "";

                            state_global_ctrl.Style["display"] = "none";
                            plan_global_ctrl.Style["display"] = "none";
                            resource_global_ctrl.Style["display"] = "none";
                            except_global_ctrl.Style["display"] = "";

                            state_area_chart.Style["display"] = "none";
                            plan_area_chart.Style["display"] = "none";
                            resource_area_chart.Style["display"] = "none";
                            except_area_chart.Style["display"] = "";

                            state_area_ctrl.Style["display"] = "none";
                            plan_area_ctrl.Style["display"] = "none";
                            resource_area_ctrl.Style["display"] = "none";
                            except_area_ctrl.Style["display"] = "";
                            break;
                        default:
                            break;
                    }
                }
            }
        }
    }
}
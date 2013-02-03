using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Common
{
    public static class Populate
    {
        static ColorManager CM = new ColorManager();
        static SizeManager SM = new SizeManager();
        static DepartmentManager DepartmentManager = new DepartmentManager();
        /// <summary>
        /// Load All Colors in CheckBox Collections.
        /// </summary>
        public static void AllColors(CheckBoxList ColorchkBx, List<StyleColor> colors= null)
        {
            List<Color> color_list = CM.Colors();
            if (colors == null)
            {
                ColorchkBx.DataSource = CM.Colors();
                ColorchkBx.DataValueField = "ColorCode";
                ColorchkBx.DataTextField = "ColorDescription";
                ColorchkBx.DataBind();
            }
            else
            {
                var results = (from color in color_list
                             join s_color in colors on color.ColorCode equals s_color.ColorCode
                             select color).ToList<Color>();

                ColorchkBx.DataSource = color_list.Except(results);
                ColorchkBx.DataValueField = "ColorCode";
                ColorchkBx.DataTextField = "ColorDescription";
                ColorchkBx.DataBind();
            }
        }

        /// <summary>
        /// Load All Sizes in CheckBox Collections.
        /// </summary>
        public static void AllSizes(CheckBoxList SizeschkBxs, List<StyleSize> sizes=null)
        {
            List<Size> sizes_list = SM.Sizes();
            if (sizes == null)
            {
                SizeschkBxs.DataSource = SM.Sizes();
                SizeschkBxs.DataValueField = "SizeCode";
                SizeschkBxs.DataTextField = "SizeDescription";
                SizeschkBxs.DataBind();
            }
            else
            {
                var results = (from size in sizes_list
                               join s_size in sizes on size.SizeCode  equals s_size.SizeCode
                               select size).ToList<Size>();
                SizeschkBxs.DataSource = sizes_list.Except(results);
                SizeschkBxs.DataValueField = "SizeCode";
                SizeschkBxs.DataTextField = "SizeDescription";
                SizeschkBxs.DataBind();
            }
        }

        /// <summary>
        /// Add Style in CheckBoxes Color Collection.
        /// </summary>
        public static void AddColorInColorCollections(CheckBoxList ColorchkBxs)
        {
            for (int i = 0; i < ColorchkBxs.Items.Count; i++)
            {
                ColorchkBxs.Items[i].Attributes.Add("style", "color:" + ColorchkBxs.Items[i].Text + ";");
            }
        }

        /// <summary>
        /// PopulateDepartment by WebControl
        /// </summary>
        public static void InitializeDepartments(WebControl control, SqlDataSource DepartmentDataSource=null)
        {
            object Departments = null;
            if (DepartmentDataSource != null)
            {
                Departments = DepartmentDataSource;
            }
            else
            {
               Departments =  DepartmentManager.Departments();
            }

           switch(control.GetType().Name)
           {
               case "DropDownList":
                   DropDownList DDList = (DropDownList)control;
                   DDList.Items.Clear();
                   DDList.DataSource = Departments;
                   DDList.DataTextField = "DepartmentName";
                   DDList.DataValueField = "Id";
                   DDList.DataBind();
                   break;
               case "GridView":
                   GridView gvDepartments = (GridView)control;
                   gvDepartments.DataSource = Departments;
                   gvDepartments.DataBind();
                   break;
               case "ListBox":
                   ListBox ListBoxDepartments = (ListBox)control;
                   ListBoxDepartments.DataSource = Departments;
                   ListBoxDepartments.DataTextField = "DepartmentName";
                   ListBoxDepartments.DataValueField = "Id";
                   ListBoxDepartments.DataBind();
                   break;
               case "CheckBoxList":
                   CheckBoxList chkBoxListDepartment = (CheckBoxList)control;
                   chkBoxListDepartment.DataSource = Departments;
                   chkBoxListDepartment.DataTextField = "DepartmentName";
                   chkBoxListDepartment.DataValueField = "Id";
                   chkBoxListDepartment.DataBind();
                   break;
           }
        }
      
    }
}
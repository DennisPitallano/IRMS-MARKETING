using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using System.Configuration;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class sample : System.Web.UI.Page
    {
        List<Person> p = new List<Person>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Session["person"] = p;
                Brand brand = new Brand();
                Label1.Text  = ConfigurationManager.AppSettings["UserImagePath"].ToString();
                //Session["person"] = p;
                // p.Add(new Person{ FirstName="Dennis", Id =1, LastName ="Pitallano", MiddleName ="Quibral"});
                // GridView1.DataSource = p;
                // GridView1.DataBind();
            }
            else {

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            p = (List<Person>)Session["person"];
            p.Add(new Person { FirstName = "Dexter", Id = 1, LastName = "Pitallano", MiddleName = "Quibral" });
          //  p.RemoveAt(0);
            GridView1.DataSource = p;
            GridView1.DataBind();
        }
    }

    public class Person
    {
        public  int Id {get;set;}
        public string  LastName { get; set; }
        public string  FirstName { get; set; }
        public string  MiddleName { get; set; }
    }
}
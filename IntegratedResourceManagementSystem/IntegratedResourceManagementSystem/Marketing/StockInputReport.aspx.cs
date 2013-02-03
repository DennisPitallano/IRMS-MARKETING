using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
namespace IntegratedResourceManagementSystem.Marketing
{
	public partial class StockInputReport : System.Web.UI.Page
	{
		#region variables
		GroupAreaManager areaGroupManager = new GroupAreaManager();
		SubGroupAreaManager subAreaGroupManager = new SubGroupAreaManager();
		BrandManager brandManager = new BrandManager();
		#endregion

		protected void Page_Init(object sender, EventArgs e)
		{
			InitializeAreaGroups();
			InitializeBrands();
			InitializeYearAndMonthList();
		}

		private void InitializeBrands()
		{
			DDLBrandsForArea.Items.Clear();
			DDLBrandsForArea.Items.Add(new ListItem("ALL", "ALL"));
			foreach (var item in brandManager.Brands())
			{
				DDLBrandsForArea.Items.Add(new ListItem(item.BrandDescription, item.BrandDescription));
			}
		}


		private void InitializeAreaGroups()
		{
			rdioAreaGroup.Items.Clear();			
			foreach (var item in areaGroupManager.AreaGroups())
			{
				rdioAreaGroup.Items.Add(new ListItem(item.GroupName, item.AreaGroupNo.ToString()));
			}
			rdioAreaGroup.SelectedIndex =0;
			InitializeSubAreaGroups(int.Parse(rdioAreaGroup.SelectedValue));
		}

		private void InitializeSubAreaGroups(int areaGroupNumber)
		{
			rdioSubAreaGroup.Items.Clear();
			foreach (var item in subAreaGroupManager.SubGroupArea(areaGroupNumber))
			{
				rdioSubAreaGroup.Items.Add(new ListItem(item.GroupName, item.SubAreaGroupNo.ToString()));
			}
		}

		private void InitializeYearAndMonthList()
		{
			DDLMonth.Items.Clear();
			for (int i = 0; i < 12; i++)
			{
				DDLMonth.Items.Add(new ListItem(DateTime.Now.AddMonths(i).ToString("MMMM"), DateTime.Now.AddMonths(i).ToString("MM")));
			}
			DDLMonthYear.Items.Clear();
			DDLYear.Items.Clear();
			for (int y = 2006; y <= DateTime.UtcNow.Year + 1; y++)
			{
				DDLMonthYear.Items.Add(new ListItem(y.ToString(), y.ToString()));
				DDLYear.Items.Add(new ListItem(y.ToString(), y.ToString()));
			}
			DDLMonthYear.SelectedValue = DateTime.UtcNow.Year.ToString();
			DDLYear.SelectedValue = DateTime.UtcNow.Year.ToString();
		}

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void rdioAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
		{
			InitializeSubAreaGroups(int.Parse(rdioAreaGroup.SelectedValue));
			CreateReportLink();
		}

		protected void rdioAreaType_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rdioAreaType.SelectedIndex ==0)
			{
				rdioSubAreaGroup.Enabled = false;
			}
			else
			{
				rdioSubAreaGroup.Enabled = true;
			}
			CreateReportLink();
		}

		protected void rdioDateTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			switch (rdioDateTypes.SelectedIndex)
			{
				case 0:
					mvDateParameters.SetActiveView(vRange);
					break;
				case 1:
					mvDateParameters.SetActiveView(vMonth);
					break;
				case 2:
					mvDateParameters.SetActiveView(vYear);
					break;
				default:
					mvDateParameters.SetActiveView(vRange);
					break;
			}
			CreateReportLink();
		}

		private void CreateReportLink()
		{
			hpLinkPrint.NavigateUrl = string.Empty;
			int areaGroup = 0,subAreaGroup=0;
			string brand = string.Empty;
			DateTime dateFrom = new DateTime();
			DateTime dateTo = new DateTime();

			if (rdioDateTypes.SelectedIndex==0)
			{
				if (string.IsNullOrEmpty(txtDateFrom.Text))
				{
					return;
				}

				if (string.IsNullOrEmpty(txtDateTo.Text))
				{
					return;
				}
			}
		   
			areaGroup = int.Parse(rdioAreaGroup.SelectedValue);

			if (rdioAreaType.SelectedIndex==1)
			{
				if (rdioSubAreaGroup.SelectedIndex >=0)
				{
					subAreaGroup = int.Parse(rdioSubAreaGroup.SelectedValue);
				}
				else
				{
					return;
				}
			}

			brand = DDLBrandsForArea.SelectedValue;
			dateFrom = DateParameters(rdioDateTypes.SelectedIndex)[0];
			dateTo = DateParameters(rdioDateTypes.SelectedIndex)[1];

			hpLinkPrint.NavigateUrl = "~/Reports/ReportForms/StockInputReportPreview.aspx?Area="+areaGroup+"&SubArea="+subAreaGroup
				+ "&DateFrom=" + dateFrom.ToShortDateString() + "&DateTo=" + dateTo.ToShortDateString() 
				+ "&Brand=" + brand + "&PriceStatus=" + rdioPriceStatus.SelectedValue;
		}

		private DateTime[] DateParameters(int dateType)
		{
			DateTime[] dates = new DateTime[2];
		  
			int year=0;
			int month=0;
			switch (dateType)
			{
				case 0:
					dates[0] = DateTime.Parse(txtDateFrom.Text);
					dates[1] = DateTime.Parse(txtDateTo.Text);
					break;
				case 1:
					 year=int.Parse(DDLMonthYear.SelectedValue);
					 month=int.Parse(DDLMonth.SelectedValue);
					dates[0] = new DateTime(year,month, 1);
					dates[1] = new DateTime(year,month,DateTime.DaysInMonth(year,month));
					break;
				case 2:
					year =int.Parse(DDLYear.SelectedValue);
					dates[0] = new DateTime(year,1,1);
					dates[1] = new DateTime(year, 12, 31);
					break;
				default:
					dates[0] = new DateTime();
					dates[1] = new DateTime();
					break;
			}
			return dates;
		}

		protected void rdioSubAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void txtDateFrom_TextChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void txtDateTo_TextChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void DDLMonth_SelectedIndexChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void DDLMonthYear_SelectedIndexChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void DDLYear_SelectedIndexChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void DDLBrandsForArea_SelectedIndexChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}

		protected void rdioPriceStatus_SelectedIndexChanged(object sender, EventArgs e)
		{
			CreateReportLink();
		}
	   
	}
}
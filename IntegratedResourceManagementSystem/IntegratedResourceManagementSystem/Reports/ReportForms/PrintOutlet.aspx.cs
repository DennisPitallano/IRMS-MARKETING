using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;


namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PrintOutlet : System.Web.UI.Page
    {
        CustomerInfoManager CustomerInfoMgr = new CustomerInfoManager();
        OutletManager OutletManager = new OutletManager();
        PriceGroupManager PriceGroupManager = new PriceGroupManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitializePrintPreview();
            }
        }
        public void InitializePrintPreview()
        {
            try
            {
                string CUSTOMER_CODE = (string)Request.QueryString["OutletCode"];
                string AREA = (string)Request.QueryString["Area"];
                string SUB_AREA = (string)Request.QueryString["SubArea"];

                var customer = GetOutlet(CUSTOMER_CODE);

                lblAreaGroup.Text = AREA;
                lblContractDate.Text = customer.ContractDate.ToString("MMMM dd, yyyy");
                lblCustomerCode.Text = CUSTOMER_CODE;
                lblOutletName.Text = customer.CompanyName;
                lblSubAreaGroup.Text = SUB_AREA;
                lblAreaCoordinator.Text = customer.AgentName;

                var company = GetCompany(customer);

                lblUnderCompany.Text = company.CompanyName;

                var pricegroupregular = PriceGroup(customer.PriceGroupNo);

                var prigroupmarkdown = PriceGroup(customer.PriceGroupMarkdownNo);
                lblPriceGroupRegular.Text = pricegroupregular.GroupName;
                lblPriceGroupMarkDown.Text = prigroupmarkdown.GroupName;

                var OutletLinkReference = OutletManager.GetOutletLinkReference(customer.CustomerCode);

                lblCollectionAddress.Text = OutletLinkReference.CollectionAddress;
                lblCustomerCode.Text = OutletLinkReference.DepartmentCode;
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }

        private CompanyClass GetCompany(CustomerInfo customer)
        {
            var company = (from comp in OutletManager.AllCompany()
                           where comp.CompanyNumber == customer.CompanyNo
                           select comp).FirstOrDefault();
            return company;
        }

        private CustomerInfo GetOutlet(string CUSTOMER_CODE)
        {
            var customer = (from custinfo in CustomerInfoMgr.GetAllCustomer()
                            where custinfo.CustomerCode == CUSTOMER_CODE
                            select custinfo).FirstOrDefault();
            return customer;
        }

        
        private PriceGroup PriceGroup(int PGNo)
        {
            var pricegroupregular = (from pgr in PriceGroupManager.PriceGroupRegular()
                                     where pgr.PGNo == PGNo
                                     select pgr).FirstOrDefault();
            return pricegroupregular;
        }
    }
}
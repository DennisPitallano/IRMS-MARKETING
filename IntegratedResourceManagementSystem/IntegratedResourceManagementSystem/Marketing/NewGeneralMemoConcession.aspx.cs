using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using AjaxControlToolkit;
using IRMS.Components;



namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewGeneralMemoConcession : System.Web.UI.Page
    {
        private GeneralMemoConcessionManager GMCM = new GeneralMemoConcessionManager();
        #region variables
        private GroupAreaManager GroupAreaManager = new GroupAreaManager();
        private GroupAreaMemoManager _GroupAreaMemoManager = new GroupAreaMemoManager();
        private PriceGroupManager _PGManager = new PriceGroupManager();

        private string _sAreaMemoCode = string.Empty;
        private string _sBrandCode = string.Empty;
        private List<GroupAreaMemoClass> _GroupAreaMemoList = new List<GroupAreaMemoClass>();

        DataTable dt = new DataTable(); 
        DataTable dt1 = new DataTable();
        DataTable dtMarkdownList = new DataTable();
        DataTable dtNewMarkdownList = new DataTable();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["MDStateEdit"] == "YES")
            {
                
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                SetDataGridColumns();
                LoadBrandList();
                rdioApplyPricePointTo_SelectedIndexChanged(null, null);
                CreateMemoFormat();

                DDLAreaGroup.SelectedIndex = 0; //DEFAULT SELECTION
            }
            else
            {              

            }
            SetDelicateControls(!(gvMarkdownList.Rows.Count > 0));
        }

        private void SetDataGridColumns()
        {
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();

            dtMarkdownList.Clear();
            dtNewMarkdownList.Clear();
            
            dtMarkdownList.Columns.Add(new DataColumn("STYLE #"));
            dtMarkdownList.Columns.Add(new DataColumn("DESCRIPTION"));
            dtMarkdownList.Columns.Add(new DataColumn("CURRENT PRICE"));
            dtMarkdownList.Columns.Add(new DataColumn("MARKDOWN PRICE"));
            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                dtMarkdownList.Columns.Add(pgroupItem.GroupField.ToString());
            }

            Session["LIST"] = dtMarkdownList;
            this.gvMarkdownList.DataSource = dtMarkdownList;
            gvMarkdownList.DataBind();


            int iPos=0;
            foreach (DataControlField dgCol in gvMarkdownList.Columns)
            {
                if (iPos>=5)
                    dgCol.HeaderStyle.HorizontalAlign = HorizontalAlign.Right;
                iPos++;
            }

            dtNewMarkdownList.Columns.Add(new DataColumn("STYLE #"));
            dtNewMarkdownList.Columns.Add(new DataColumn("DESCRIPTION"));
            dtNewMarkdownList.Columns.Add(new DataColumn("CURRENT PRICE"));
            dtNewMarkdownList.Columns.Add(new DataColumn("MARKDOWN PRICE"));

            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                dtNewMarkdownList.Columns.Add(pgroupItem.GroupField.ToString());
            }

            Session["NEWLIST"] = dtNewMarkdownList;
            this.gvNewMarkdown.DataSource = dtNewMarkdownList;
            gvNewMarkdown.DataBind();

            iPos = 0;
            foreach (DataControlField dgCol in gvNewMarkdown.Columns)
            {
                if (iPos >= 5)
                    dgCol.HeaderStyle.HorizontalAlign = HorizontalAlign.Right;
                iPos++;
            }
        }

        private void LoadBrandList()
        {
            BrandManager _BrandManager = new BrandManager();
            DDLBrand.Items.Clear();
            foreach (Brand brandItem in _BrandManager.Brands())
            {
                DDLBrand.Items.Add(new ListItem(brandItem.BrandDescription, brandItem.MemoCode));
            }

            hfBrandName.Value = DDLBrand.SelectedItem.Text;
        }

        private void LoadAreaList()
        {
            _GroupAreaMemoManager.GroupAreaMemo();
            _GroupAreaMemoList = _GroupAreaMemoManager.GroupAreaMemoList;
            foreach (GroupAreaMemoClass GroupArea in _GroupAreaMemoList)
            {
                DDLAreaGroup.Items.Add(new ListItem(GroupArea.GroupName.ToUpper(), GroupArea.AreaGroupNo.ToString()));
            }
        }

        private void LoadSubAreaList()
        {
            int iSelectedIndex = 0;
            iSelectedIndex = DDLAreaGroup.SelectedIndex;
            _GroupAreaMemoManager.GroupAreaMemo();

            SubGroupAreaManager _SubGroupAreaManager = new SubGroupAreaManager();
            List<SubGroupAreaClass> _SubGroupAreaList = new List<SubGroupAreaClass>();

            DDLSubArea.Items.Clear();
            _SubGroupAreaList = _SubGroupAreaManager.SubGroupArea(_GroupAreaMemoManager.GroupAreaMemoList[iSelectedIndex].AreaGroupNo);

            if (_SubGroupAreaList.Count == 0)
            {
                _SubGroupAreaList = _SubGroupAreaManager.SubGroupAreaByCustomerArea(_GroupAreaMemoManager.GroupAreaMemoList[iSelectedIndex].AreaGroupNo);
            }

            foreach (SubGroupAreaClass subGroupItem in _SubGroupAreaList)
            {
                DDLSubArea.Items.Add(new ListItem(subGroupItem.GroupName.ToString().ToUpper(), subGroupItem.SubAreaGroupNo.ToString()));
            }
            CreateMemoFormat(); 
        }

        private void InitializeData()
        {
            DDLAreaGroup.Items.Clear();
            _GroupAreaMemoManager.GroupAreaMemo();
            _GroupAreaMemoList = _GroupAreaMemoManager.GroupAreaMemoList;
            foreach (GroupAreaMemoClass GroupArea in _GroupAreaMemoList)
            {
                DDLAreaGroup.Items.Add(new ListItem(GroupArea.GroupName.ToUpper(), GroupArea.MemoCode));
            }
        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            Image imgCustomer = (Image)gvCustomers.SelectedRow.FindControl("imgCustomer");
            hfCustomerId.Value = imgCustomer.AlternateText;
            txtCustomer.Text = gvCustomers.SelectedRow.Cells[3].Text;
            Session["CUSTOMER MD"] = gvCustomers.SelectedRow.Cells[2].Text;
            gvCustomers.SelectedIndex = -1;
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSelectCustomer.Enabled = true;
        }

        protected void gvItems_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //if (string.IsNullOrEmpty(txtSearchItem.Text) == false)
            //{
            //    SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + DDLBrand.SelectedItem.Text +
            //        "') and ([StyleNo] = '" + txtSearchItem.Text + "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            //}
            //else
            //{
            //    SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + DDLBrand.SelectedItem.Text +
            //       "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            //}
            //SqlDataSourceItems.DataBind();
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {            
             btnAddNewItem_ModalPopupExtender.Show();            
        }

        protected void gvItems_Sorting(object sender, GridViewSortEventArgs e)
        {
             btnAddNewItem_ModalPopupExtender.Show();
        }


        protected void gvItems_SelectedIndexChangedEx(object sender, EventArgs e)
        {            
            PriceManager pM = new PriceManager();
            PricePointManager ppM = new PricePointManager();
            GeneralMemoConcessionDetailManager gMCDM = new GeneralMemoConcessionDetailManager();

            bool bResult = false;

            dtMarkdownList = (DataTable)Session["LIST"];
            var ItemFoundResult = (from myRow in dtMarkdownList.AsEnumerable()
                                   where myRow.Field<string>("STYLE #") == gvItems.SelectedRow.Cells[1].Text
                                   select myRow);

            if (ItemFoundResult.Count() > 0)
                bResult = true;
            else
            {
                dtNewMarkdownList = (DataTable)Session["NEWLIST"];
                ItemFoundResult = (from myRow in dtNewMarkdownList.AsEnumerable()
                                   where myRow.Field<string>("STYLE #") == gvItems.SelectedRow.Cells[1].Text
                                   select myRow);

                bResult = (ItemFoundResult.Count() > 0);
            }


            if (bResult == true)
            {
                this.lblDuplicateCount.Text = "{0} items found!";
                lblDuplicateCount.Text = string.Format(lblDuplicateCount.Text, 1);
                hfDuplicateStylePopupExtender.Show();
                txtCurrentPrice.Text = "";
                txtMarkDownPrice.Text = "0.00";
                return;
            }


            Double dResult = 0;
            //GET REGULAR PRICE
            dResult = Convert.ToDouble(pM.GetSRPByStyle(gvItems.SelectedRow.Cells[1].Text, DDLBrand.SelectedItem.Text).Price_2);
            lblPriceStatus.Text = "NEW";



            //GET MARKDOWN PRICE IF ANY
            PricePoint pPoint = new PricePoint();

            int GroupNo = -1;

            switch (rdioApplyPricePointTo.SelectedIndex)
            {
                case 0:
                    {
                        _GroupAreaMemoManager.GroupAreaMemo();
                        GroupNo = _GroupAreaMemoManager.GroupAreaMemoList[DDLAreaGroup.SelectedIndex].GroupNo;
                        if (GroupNo == 0)
                            GroupNo = 1;
                        else
                        {
                            if (GroupNo == 99)
                                GroupNo = 2;
                        }
                        break;
                    }
                case 1:
                    {
                        GroupNo = Convert.ToInt32(DDLSubArea.SelectedItem.Value);
                        break;
                    }
                case 2:
                    {
                        GroupNo = Convert.ToInt32(Session["CUSTOMER MD"]);
                        break;
                    }
            }


            pPoint = ppM.GetStyleCurrentPrice1(gvItems.SelectedRow.Cells[1].Text, DDLBrand.SelectedItem.Text,rdioApplyPricePointTo.SelectedValue.ToUpperInvariant(),GroupNo);
            if (pPoint != null)
            {
                dResult =  Convert.ToDouble(pPoint.Price);
                lblPriceStatus.Text = "MARKDOWN";
            }

            
            txtCurrentPrice.Text = string.Format("{0:0.00}",dResult);
            btnAddNewItem_ModalPopupExtender.Show();          
        }
  
        protected void gvItems_PageIndexChanged(object sender, EventArgs e)
        {          
            btnAddNewItem_ModalPopupExtender.Show();            
        }

        protected void btnRemoveItem_ClickEx(object sender, EventArgs e)
        {
            dtMarkdownList = (DataTable)Session["LIST"];
            int iRow = 0;
            CheckBox chkItem;
            foreach (GridViewRow row in gvMarkdownList.Rows)
            {
                chkItem = (CheckBox)row.FindControl("chkStyleNumber");

                if (chkItem.Checked)
                    dtMarkdownList.Rows[iRow].Delete();
                else
                    iRow++;
            }
            Session["LIST"] = dtMarkdownList;
            gvMarkdownList.DataSource = dtMarkdownList;
            gvMarkdownList.DataBind();


            dtNewMarkdownList = (DataTable)Session["NEWLIST"];
            iRow = 0;
            foreach (GridViewRow row in gvNewMarkdown.Rows)
            {
                chkItem = (CheckBox)row.FindControl("chkStyleNumber");

                if (chkItem.Checked)
                    dtNewMarkdownList.Rows[iRow].Delete();
                else
                    iRow++;
            }
            Session["NEWLIST"] = dtNewMarkdownList;
            gvNewMarkdown.DataSource = dtNewMarkdownList;
            gvNewMarkdown.DataBind();
        }

        protected void gvAddMemo_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();          
        }

        protected void gvAddMemo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_PageIndexChanged(object sender, EventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void btnAddMemoOk_ClickEx(object sender, EventArgs e)
        {
            List<IRMS.Entities.GeneralMemoConcessionDetail> DuplicateGenMemoDetailList = new List<IRMS.Entities.GeneralMemoConcessionDetail>();

            GeneralMemoConcessionDetailManager GMCDManager = new GeneralMemoConcessionDetailManager();
            List<IRMS.Entities.GeneralMemoConcessionDetail> GenMemoDetailsList = new List<IRMS.Entities.GeneralMemoConcessionDetail>();

            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();

            _PriceGroupList = _PGManager.PriceGroupConcession();

            dtMarkdownList = (DataTable)Session["LIST"];
            dtNewMarkdownList = (DataTable)Session["NEWLIST"];

            //DataRow dtRow;
            GenMemoDetailsList = GMCDManager.GetGeneralMemoConcessionDetailByID(Convert.ToInt64(gvAddMemo.SelectedValue));
            bool bResult = false;
            foreach (IRMS.Entities.GeneralMemoConcessionDetail genMemoConcessionItem in GenMemoDetailsList)
            {
                var ItemFoundResult = (from myRow in dtMarkdownList.AsEnumerable()
                                       where myRow.Field<string>("STYLE #") == genMemoConcessionItem.StyleNumber
                                       select myRow);

                if (ItemFoundResult.Count() > 0)
                    bResult = true;
                else
                {
                    dtNewMarkdownList = (DataTable)Session["NEWLIST"];
                    ItemFoundResult = (from myRow in dtNewMarkdownList.AsEnumerable()
                                       where myRow.Field<string>("STYLE #") == genMemoConcessionItem.StyleNumber
                                       select myRow);

                    bResult = (ItemFoundResult.Count() > 0);
                }


                if (bResult == true)
                    DuplicateGenMemoDetailList.Add(genMemoConcessionItem);
                else
                {
                    if (genMemoConcessionItem.ynFurther == true)
                        AddMemoDetail(genMemoConcessionItem, ref dtMarkdownList);
                    else
                        AddMemoDetail(genMemoConcessionItem, ref dtNewMarkdownList);
                }
            }
            Session["LIST"] = dtMarkdownList;
            Session["NEWLIST"] = dtNewMarkdownList;

            gvMarkdownList.DataSource = (DataTable)Session["LIST"];
            gvMarkdownList.DataBind();

            gvNewMarkdown.DataSource = (DataTable)Session["NEWLIST"];
            gvNewMarkdown.DataBind();

            gvItems.SelectedIndex = -1;
            this.lblDuplicateCount.Text = "{0} items found!";

            if (DuplicateGenMemoDetailList.Count > 0)
            {
                lblDuplicateCount.Text = string.Format(lblDuplicateCount.Text, DuplicateGenMemoDetailList.Count);
                HiddenField2_ModalPopupExtender.Show();
            }
        }

        private void AddMemoDetail(IRMS.Entities.GeneralMemoConcessionDetail gmcd, ref DataTable dt)
        {
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();
            DataRow dtRow;
            dtRow = dt.NewRow();

            dtRow["STYLE #"] = gmcd.StyleNumber;
            dtRow["DESCRIPTION"] = gmcd.StyleDescription;
            dtRow["CURRENT PRICE"] = string.Format("{0:0.00}", gmcd.CurrentPrice);
            dtRow["MARKDOWN PRICE"] = string.Format("{0:0.00}", gmcd.MDPrice);

            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                dtRow[pgroupItem.GroupField.ToString()] = string.Format("{0:0.00}", (Convert.ToDouble(gmcd.MDPrice) + Convert.ToDouble(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo))));
            }
            dt.Rows.Add(dtRow);
        }

        protected void btnAddNewMarkDown_Click(object sender, EventArgs e)
        {
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();


            DataRow dtRow = dtMarkdownList.NewRow();
            foreach (PriceGroup pgItem in _PriceGroupList)
            {
                _PGManager.AddValueToRegularPrice(pgItem.PGNo);
            }
        }

        protected void txtAddMemoSearch_TextChanged(object sender, EventArgs e)
        {
            GMCM.SearchGeneralMemoByMemoNoAndBrand(SqlDataSourceAddMemo, DDLBrand.SelectedItem.Text, txtAddMemoSearch.Text);
            gvAddMemo.DataBind();
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            GMCM.SearchGeneralMemoByMemoNoAndBrand(SqlDataSourceAddMemo, DDLBrand.SelectedItem.Text, txtAddMemoSearch.Text);
            gvAddMemo.DataBind();
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            txtCurrentPrice.Text = "";
            txtMarkDownPrice.Text = "0.00";
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void txtMemoDate_TextChanged(object sender, EventArgs e)
        {

        }

        private void CreateMemoFormat()
        {
            _GroupAreaMemoManager.GroupAreaMemo();
            IRMS.BusinessLogic.DataAccess.ISERVELibrary library = new IRMS.BusinessLogic.DataAccess.ISERVELibrary();

            if (rdioApplyPricePointTo.SelectedIndex == 2)
                _sAreaMemoCode = "MMDS";
            else
            {
                _sAreaMemoCode = _GroupAreaMemoManager.GroupAreaMemoList[DDLAreaGroup.SelectedIndex].MemoCode;
            }                
            txtMemoNo.Text = string.Format("{0}{1}{2}", _sAreaMemoCode, DDLBrand.SelectedItem.Value, library.GetServerDate().Year);
        }

        protected void DDLBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfBrandName.Value = DDLBrand.SelectedItem.Text;
            CreateMemoFormat();
        }

        protected void DDLAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLSubArea.Visible == true)
                LoadSubAreaList();
            CreateMemoFormat();
        }

        protected void rdioApplyPricePointTo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDLAreaGroup.Items.Clear();
            if (rdioApplyPricePointTo.SelectedIndex == 0)
            {
                LoadAreaList();
                pnlAreaGroup.Visible = true;
                pnlSubAreaGroup.Visible = false;
                mvApplyPricePoint.SetActiveView(vAreaGroup);
                DDLSubArea.Visible = false;
                lblSubArea.Visible = false;
            }
            else if (rdioApplyPricePointTo.SelectedIndex == 1)
            {
                LoadAreaList();
                DDLAreaGroup.Items.Remove(DDLAreaGroup.Items.FindByText("ALL"));
                DDLAreaGroup.Items.Remove(DDLAreaGroup.Items.FindByText("ALL PROVINCES"));
                LoadSubAreaList();

                pnlSubAreaGroup.Visible = true;
                pnlAreaGroup.Visible = false;
                DDLSubArea.Visible = true;
                lblSubArea.Visible = true;
                mvApplyPricePoint.SetActiveView(vAreaGroup);
            }
            else
            {
                mvApplyPricePoint.SetActiveView(vCustomer);
            }
            CreateMemoFormat();
        }

        private void SetDelicateControls(bool bResult)
        {
            DDLBrand.Enabled = bResult;
            rdioApplyPricePointTo.Enabled = bResult;
            DDLAreaGroup.Enabled = bResult;
        }

        protected void btnSelectItemOk_ClickEx(object sender, EventArgs e)
        {

            try
            {
                Double dCurrent = Convert.ToDouble(txtCurrentPrice.Text);
                Double dPrice = Convert.ToDouble(txtMarkDownPrice.Text);

                if (dPrice > dCurrent)
                {
                    hfMarkupAnswer.Value = "N";
                    btnAddNewItem_ModalPopupExtender.Show();
                    hfMarkupAnswerModalPopupExtender.Show();
                    return;
                }
            }
            catch (Exception except)
            {
                ResponseMessage("Invalid entry!");
                return;
            }


            if (lblPriceStatus.Text == "NEW")
            {
                AddToMarkdownList(Session["NEWLIST"],ref dtNewMarkdownList,ref gvNewMarkdown);
                Session.Remove("NEWLIST");
                Session["NEWLIST"] = dtNewMarkdownList;
            }
            else
            {
                AddToMarkdownList(Session["LIST"],ref dtMarkdownList, ref gvMarkdownList);
                Session.Remove("LIST");
                Session["LIST"] = dtMarkdownList;
            }
        }

        private void AddToMarkdownList(Object Session,ref DataTable dt,ref GridView gvObject)
        {
            Double dPrice = 0;
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();

            dt = (DataTable)Session;

            DataRow dtRow = dt.NewRow();
            dtRow["STYLE #"] = gvItems.SelectedRow.Cells[1].Text;
            dtRow["DESCRIPTION"] = HttpUtility.HtmlDecode(gvItems.SelectedRow.Cells[3].Text);
            dtRow["CURRENT PRICE"] = txtCurrentPrice.Text;
            dtRow["MARKDOWN PRICE"] = string.Format("{0:0.00}",Convert.ToDouble(txtMarkDownPrice.Text));

            dPrice = Convert.ToDouble(txtMarkDownPrice.Text);
            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                dtRow[pgroupItem.GroupField.ToString()] = string.Format("{0:0.00}", (dPrice + Convert.ToDouble(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo))));
            }

            dt.Rows.Add(dtRow);
            gvObject.DataSource = dt;
            gvObject.DataBind();

            txtCurrentPrice.Text = string.Empty;
            txtMarkDownPrice.Text = string.Empty;
            gvItems.SelectedIndex = -1;

            int iPos = 0;
            foreach (DataControlField dgCol in gvObject.Columns)
            {
                if (iPos >= 4)
                    //dgCol.HeaderStyle.HorizontalAlign = HorizontalAlign.Right;
                    dgCol.ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                iPos++;
            }

            SetDelicateControls(!(gvObject.Rows.Count > 0));

            SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + DDLBrand.SelectedItem.Text +
               "') and StyleNo in (select StyleNo from STS where BrandName = '" + DDLBrand.SelectedItem.Text + "') order by [StyleNo] desc";
            SqlDataSourceItems.DataBind();
            gvItems.DataBind();
        }

        protected void btnSaveGeneralMemo_ClickEx(object sender, EventArgs e)
        {
            if (rdioApplyPricePointTo.SelectedIndex == 0)
                SaveMemoByArea();

            if (rdioApplyPricePointTo.SelectedIndex == 1)
                SaveMemoBySubArea();

            if (rdioApplyPricePointTo.SelectedIndex == 2)
                SaveMemoByCustomer();

            //Response.Write("<script langauge=\"javascript\"> alert(\"Markdown Memo Saved!" + txtMemoNo.Text + "\");</script>");
            lblNewMemoNo.Text = string.Format(lblNewMemoNo.Text,txtMemoNo.Text);
            hfMemoNoPopupExtender.Show();           
        }

        private void SaveMemoByArea()
        {
            GeneralMemoConcessionDetailManager GMCDM = new GeneralMemoConcessionDetailManager();
            PricePointManager PPM = new PricePointManager();
            IRMS.Entities.GeneralMemoConcession genMemoObj = new IRMS.Entities.GeneralMemoConcession();

            genMemoObj.MemoDate = new IRMS.BusinessLogic.DataAccess.ISERVELibrary().GetServerDate();
            _GroupAreaMemoManager.GroupAreaMemo();

            genMemoObj.Header = txtMemoHeader.Text;
            genMemoObj.Intro = txtIntroduction.Text;
            genMemoObj.BrandName = DDLBrand.SelectedItem.Text;

            genMemoObj.GroupNumber = _GroupAreaMemoManager.GroupAreaMemoList[DDLAreaGroup.SelectedIndex].GroupNo;
            genMemoObj.PriceType = rdioApplyPricePointTo.SelectedValue.ToUpperInvariant();
            genMemoObj.FromDate = Convert.ToDateTime(txtEffectivityDate.Text);
            genMemoObj.Message = txtMessage.Text;
            genMemoObj.Footer = txtFooter.Text;
            //genMemoObj.Status = rdioStatus.SelectedValue;
            genMemoObj.Status = "Pending";
            genMemoObj.Remark = txtRemarks.Text;

            genMemoObj.MemoNumber = txtMemoNo.Text;
            GMCM.Save(ref genMemoObj, true);
            SaveGenMemoDetail(genMemoObj);
            SavePricePointByArea(genMemoObj);
            txtMemoNo.Text = genMemoObj.MemoNumber;
        }
        private void SavePricePointByArea(IRMS.Entities.GeneralMemoConcession genMemoObj)
        {
            PricePointManager PPointManager = new PricePointManager();
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();


            switch (genMemoObj.GroupNumber)
            {
                case 0: 
                    {
                        _GroupAreaMemoManager.GroupAreaMemoByAllAreas();
                    }
                    break;
                case 99:
                    {
                        _GroupAreaMemoManager.GroupAreaMemoByAllProvinces();
                    }
                    break;
                default:
                    {
                        _GroupAreaMemoManager.GroupAreaMemoByAreaNumber(genMemoObj.GroupNumber);
                    }
                    break;
            }

            _GroupAreaMemoList = _GroupAreaMemoManager.GroupAreaMemoList;

            PricePoint pricePointObj;
            int iTotalRow = gvMarkdownList.Rows.Count;
            int iRow = 0;
            

            foreach (GroupAreaMemoClass gAreaMemo in _GroupAreaMemoList)
            {
                foreach (PriceGroup pgroupItem in _PriceGroupList)
                {
                    for (iRow = 0; iRow < iTotalRow; iRow++)
                    {
                        pricePointObj = new PricePoint();
                        pricePointObj.StyleNo = gvMarkdownList.Rows[iRow].Cells[2].Text;
                        pricePointObj.BrandName = genMemoObj.BrandName;
                        pricePointObj.PGNo = pgroupItem.PGNo;
                        pricePointObj.Price = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                        pricePointObj.Price_Type = genMemoObj.PriceType;
                        pricePointObj.Date_Posted = genMemoObj.MemoDate;
                        pricePointObj.f_Date = genMemoObj.FromDate;
                        pricePointObj.Group_No = gAreaMemo.AreaGroupNo;
                        pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                        pricePointObj.Memo_No = genMemoObj.MemoNumber;
                        PPointManager.Save(pricePointObj);
                    }                 
                }
            }


            iTotalRow = gvNewMarkdown.Rows.Count;
            foreach (GroupAreaMemoClass gAreaMemo in _GroupAreaMemoList)
            {
                foreach (PriceGroup pgroupItem in _PriceGroupList)
                {
                    for (iRow = 0; iRow < iTotalRow; iRow++)
                    {
                        pricePointObj = new PricePoint();
                        pricePointObj.StyleNo = gvNewMarkdown.Rows[iRow].Cells[2].Text;
                        pricePointObj.BrandName = genMemoObj.BrandName;
                        pricePointObj.PGNo = pgroupItem.PGNo;
                        pricePointObj.Price = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                        pricePointObj.Price_Type = genMemoObj.PriceType;
                        pricePointObj.Date_Posted = genMemoObj.MemoDate;
                        pricePointObj.f_Date = genMemoObj.FromDate;
                        pricePointObj.Group_No = gAreaMemo.AreaGroupNo;
                        pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                        pricePointObj.Memo_No = genMemoObj.MemoNumber;
                        PPointManager.Save(pricePointObj);
                    }
                }
            }
        }

        private void SaveMemoBySubArea()
        {
            GeneralMemoConcessionDetailManager GMCDM = new GeneralMemoConcessionDetailManager();
            PricePointManager PPM = new PricePointManager();
            IRMS.Entities.GeneralMemoConcession genMemoObj = new IRMS.Entities.GeneralMemoConcession();

            SubGroupAreaManager _SubGroupAreaManager = new SubGroupAreaManager();
            List<SubGroupAreaClass> _SubGroupAreaList = new List<SubGroupAreaClass>();

            genMemoObj.MemoDate = new IRMS.BusinessLogic.DataAccess.ISERVELibrary().GetServerDate();

            genMemoObj.Header = txtMemoHeader.Text;
            genMemoObj.Intro = txtIntroduction.Text;
            genMemoObj.BrandName = DDLBrand.SelectedItem.Text;

            genMemoObj.GroupNumber = Convert.ToInt32(DDLAreaGroup.SelectedItem.Value);
            genMemoObj.PriceType = rdioApplyPricePointTo.SelectedValue.ToUpperInvariant();

            genMemoObj.FromDate = new IRMS.BusinessLogic.DataAccess.ISERVELibrary().GetServerDate();
            genMemoObj.ToDate = Convert.ToDateTime(txtPromoPeriodTo.Text);
            genMemoObj.Message = txtMessage.Text;
            genMemoObj.Footer = txtFooter.Text;
            //genMemoObj.Status = rdioStatus.SelectedValue;
            genMemoObj.Status = "Pending";
            genMemoObj.Remark = txtRemarks.Text;

            genMemoObj.MemoNumber = txtMemoNo.Text;
            GMCM.Save(ref genMemoObj, true);
            SaveGenMemoDetail(genMemoObj);
            SavePricePointBySubArea(genMemoObj);
            txtMemoNo.Text = genMemoObj.MemoNumber; 
        }
        private void SavePricePointBySubArea(IRMS.Entities.GeneralMemoConcession genMemoObj)
        {
            PricePointManager PPointManager = new PricePointManager();
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();

            PricePoint pricePointObj;
            int iTotalRow = gvMarkdownList.Rows.Count;
            int iRow = 0;

            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                for (iRow = 0; iRow < iTotalRow; iRow++)
                {
                    pricePointObj = new PricePoint();
                    pricePointObj.StyleNo = gvMarkdownList.Rows[iRow].Cells[2].Text;
                    pricePointObj.BrandName = DDLBrand.SelectedValue;
                    pricePointObj.PGNo = pgroupItem.PGNo;
                    pricePointObj.Price_Type = genMemoObj.PriceType;
                    pricePointObj.Price = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                    pricePointObj.Date_Posted = genMemoObj.MemoDate;
                    pricePointObj.f_Date = genMemoObj.FromDate;
                    pricePointObj.t_Date = genMemoObj.ToDate;
                    pricePointObj.Group_No = Convert.ToInt32(DDLSubArea.SelectedItem.Value);
                    //pricePointObj.Group_No = genMemoObj.GroupNumber;
                    pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                    pricePointObj.Memo_No = genMemoObj.MemoNumber;
                    PPointManager.Save(pricePointObj);
                }
            }


            iTotalRow = gvNewMarkdown.Rows.Count;
            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                for (iRow = 0; iRow < iTotalRow; iRow++)
                {
                    pricePointObj = new PricePoint();
                    pricePointObj.StyleNo = gvNewMarkdown.Rows[iRow].Cells[2].Text;
                    pricePointObj.BrandName = DDLBrand.SelectedValue;
                    pricePointObj.PGNo = pgroupItem.PGNo;
                    pricePointObj.Price_Type = genMemoObj.PriceType;
                    pricePointObj.Price = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                    pricePointObj.Date_Posted = genMemoObj.MemoDate;
                    pricePointObj.f_Date = genMemoObj.FromDate;
                    pricePointObj.t_Date = genMemoObj.ToDate;
                    pricePointObj.Group_No = Convert.ToInt32(DDLSubArea.SelectedItem.Value);
                    //pricePointObj.Group_No = genMemoObj.GroupNumber;
                    pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                    pricePointObj.Memo_No = genMemoObj.MemoNumber;
                    PPointManager.Save(pricePointObj);
                }
            }
        }

        private void SaveMemoByCustomer()
        {
            GeneralMemoConcessionDetailManager GMCDM = new GeneralMemoConcessionDetailManager();
            PricePointManager PPM = new PricePointManager();
            IRMS.Entities.GeneralMemoConcession genMemoObj = new IRMS.Entities.GeneralMemoConcession();

            SubGroupAreaManager _SubGroupAreaManager = new SubGroupAreaManager();
            List<SubGroupAreaClass> _SubGroupAreaList = new List<SubGroupAreaClass>();

            genMemoObj.MemoDate = new IRMS.BusinessLogic.DataAccess.ISERVELibrary().GetServerDate();

            genMemoObj.Header = txtMemoHeader.Text;
            genMemoObj.Intro = txtIntroduction.Text;
            genMemoObj.BrandName = DDLBrand.SelectedItem.Text;

            genMemoObj.GroupNumber = Convert.ToInt32(Session["CUSTOMER MD"]);
            genMemoObj.PriceType = rdioApplyPricePointTo.SelectedValue.ToUpperInvariant();

            genMemoObj.FromDate = Convert.ToDateTime(txtPromoPeriodFromCustomer.Text);
            genMemoObj.ToDate = Convert.ToDateTime(txtPromoPeriodToCustomer.Text);
            genMemoObj.Message = txtMessage.Text;
            genMemoObj.Footer = txtFooter.Text;
            //genMemoObj.Status = rdioStatus.SelectedValue;
            genMemoObj.Status = "Pending";
            genMemoObj.Remark = txtRemarks.Text;

            genMemoObj.MemoNumber = txtMemoNo.Text;
            GMCM.Save(ref genMemoObj, true);
            SaveGenMemoDetail(genMemoObj);
            SavePricePointByCustomer(genMemoObj);
            txtMemoNo.Text = genMemoObj.MemoNumber;
        }
        private void SavePricePointByCustomer(IRMS.Entities.GeneralMemoConcession genMemoObj)
        {
            PricePointManager PPointManager = new PricePointManager();
            CustomerInfoManager custInfoManager = new CustomerInfoManager();

            //List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            //_PriceGroupList = _PGManager.PriceGroupConcession();

            PricePoint pricePointObj;
            int iTotalRow = gvMarkdownList.Rows.Count;
            int iRow = 0;
            
            for (iRow = 0; iRow < iTotalRow; iRow++)
            {
                pricePointObj = new PricePoint();
                pricePointObj.StyleNo = gvMarkdownList.Rows[iRow].Cells[2].Text;
                pricePointObj.BrandName = DDLBrand.SelectedValue;
                pricePointObj.Price_Type = genMemoObj.PriceType;
                pricePointObj.PGNo = custInfoManager.GetCustomerByKey(genMemoObj.GroupNumber).PriceGroupNo;
                pricePointObj.Price = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pricePointObj.PGNo));
                pricePointObj.Date_Posted = genMemoObj.MemoDate;
                pricePointObj.f_Date = genMemoObj.FromDate;
                pricePointObj.t_Date = genMemoObj.ToDate;
                pricePointObj.Group_No = genMemoObj.GroupNumber;
                pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                pricePointObj.Memo_No = genMemoObj.MemoNumber;
                PPointManager.Save(pricePointObj);
            }

            iTotalRow = gvNewMarkdown.Rows.Count;
            for (iRow = 0; iRow < iTotalRow; iRow++)
            {
                pricePointObj = new PricePoint();
                pricePointObj.StyleNo = gvNewMarkdown.Rows[iRow].Cells[2].Text;
                pricePointObj.BrandName = DDLBrand.SelectedValue;
                pricePointObj.Price_Type = genMemoObj.PriceType;
                pricePointObj.PGNo = custInfoManager.GetCustomerByKey(genMemoObj.GroupNumber).PriceGroupNo;
                pricePointObj.Price = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pricePointObj.PGNo));
                pricePointObj.Date_Posted = genMemoObj.MemoDate;
                pricePointObj.f_Date = genMemoObj.FromDate;
                pricePointObj.t_Date = genMemoObj.ToDate;
                pricePointObj.Group_No = genMemoObj.GroupNumber;
                pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                pricePointObj.Memo_No = genMemoObj.MemoNumber;
                PPointManager.Save(pricePointObj);
            }

        }

        private void SaveGenMemoDetail(IRMS.Entities.GeneralMemoConcession genMemoObj)
        {
            GeneralMemoConcessionDetailManager GMCDManager = new GeneralMemoConcessionDetailManager();
            IRMS.Entities.GeneralMemoConcessionDetail genMemoDetailObj;
            int iTotal = gvMarkdownList.Rows.Count;

            for (int iRow = 0; iRow < iTotal; iRow++)
            {
                genMemoDetailObj = new IRMS.Entities.GeneralMemoConcessionDetail();
                genMemoDetailObj.GeneralMemoID = genMemoObj.RecordNumber;
                genMemoDetailObj.MemoNumber = genMemoObj.MemoNumber;
                genMemoDetailObj.StyleNumber = gvMarkdownList.Rows[iRow].Cells[2].Text;
                genMemoDetailObj.BrandName = DDLBrand.SelectedItem.Text;
                genMemoDetailObj.StyleDescription = gvMarkdownList.Rows[iRow].Cells[3].Text;
                genMemoDetailObj.MDPrice = Convert.ToInt32(Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[5].Text));
                genMemoDetailObj.CurrentPrice = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[4].Text);


                genMemoDetailObj.Price1 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[6].Text);
                genMemoDetailObj.Price2 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[7].Text);
                genMemoDetailObj.Price3 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[8].Text);
                genMemoDetailObj.Price4 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[9].Text);
                genMemoDetailObj.Price5 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[10].Text);
                genMemoDetailObj.Price6 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[11].Text);
                genMemoDetailObj.Price7 = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[12].Text);

                genMemoDetailObj.ynFurther = true;

                GMCDManager.Save(genMemoDetailObj);
            }


            iTotal = gvNewMarkdown.Rows.Count;
            for (int iRow = 0; iRow < iTotal; iRow++)
            {
                genMemoDetailObj = new IRMS.Entities.GeneralMemoConcessionDetail();
                genMemoDetailObj.GeneralMemoID = genMemoObj.RecordNumber;
                genMemoDetailObj.MemoNumber = genMemoObj.MemoNumber;
                genMemoDetailObj.StyleNumber = gvNewMarkdown.Rows[iRow].Cells[2].Text;
                genMemoDetailObj.BrandName = DDLBrand.SelectedItem.Text;
                genMemoDetailObj.StyleDescription = gvNewMarkdown.Rows[iRow].Cells[3].Text;
                genMemoDetailObj.MDPrice = Convert.ToInt32(Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[5].Text));
                genMemoDetailObj.CurrentPrice = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[4].Text);

                genMemoDetailObj.Price1 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[6].Text);
                genMemoDetailObj.Price2 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[7].Text);
                genMemoDetailObj.Price3 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[8].Text);
                genMemoDetailObj.Price4 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[9].Text);
                genMemoDetailObj.Price5 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[10].Text);
                genMemoDetailObj.Price6 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[11].Text);
                genMemoDetailObj.Price7 = Convert.ToDecimal(gvNewMarkdown.Rows[iRow].Cells[12].Text);

                genMemoDetailObj.ynFurther = false;
                GMCDManager.Save(genMemoDetailObj);
            }

        }

        protected void btnCloseMemoNoNotifier_Click(object sender, EventArgs e)
        {
            Redirector.Redirect("~/Marketing/GeneralMemoConcession.aspx");
        }
        protected void iBtnSearchItems_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearchItem.Text) == false)
            {
                SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + DDLBrand.SelectedItem.Text +
                    "') and ([StyleNo] like '" + txtSearchItem.Text + "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            }
            else
            {
                SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + DDLBrand.SelectedItem.Text +
                   "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            }
            SqlDataSourceItems.DataBind();
            btnAddNewItem_ModalPopupExtender.Show();
        }
        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            CustomerManager customerManager = new CustomerManager();
            customerManager.FilterCustomerByBrandName(this.SqlDataSourceCustomers, DDLBrand.SelectedItem.Text, txtSearchCustomer.Text);
            gvCustomers.DataBind();
            btnBrowseCustomer_ModalPopupExtender.Show();
        }
        protected void btnBrowseCustomer_Click(object sender, EventArgs e)
        {
            CustomerManager customerManager = new CustomerManager();
            customerManager.FilterCustomerByBrandName(this.SqlDataSourceCustomers, DDLBrand.SelectedItem.Text, txtSearchCustomer.Text);
            gvCustomers.DataBind();
            btnBrowseCustomer_ModalPopupExtender.Show();
        }
        protected void btnSelectItemNo_Click(object sender, EventArgs e)
        {
            SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + DDLBrand.SelectedItem.Text +
               "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            SqlDataSourceItems.DataBind();
            //gvItems.DataBind();
        }

        private void ResponseMessage(string sMess)
        {       
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + sMess + "');", true);
        }

        protected void btnMarkUpYes_Click(object sender, EventArgs e)
        {

            if (lblPriceStatus.Text == "NEW")
            {
                AddToMarkdownList(Session["NEWLIST"], ref dtNewMarkdownList, ref gvNewMarkdown);
                Session.Remove("NEWLIST");
                Session["NEWLIST"] = dtNewMarkdownList;
            }
            else
            {
                AddToMarkdownList(Session["LIST"], ref dtMarkdownList, ref gvMarkdownList);
                Session.Remove("LIST");
                Session["LIST"] = dtMarkdownList;
            }
        }
    }    
}
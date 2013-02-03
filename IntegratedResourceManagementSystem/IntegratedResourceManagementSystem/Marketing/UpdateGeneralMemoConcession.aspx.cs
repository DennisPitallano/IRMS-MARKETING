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
using System.Reflection;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class UpdateGeneralMemoConcession : System.Web.UI.Page
    {
        private GeneralMemoConcessionManager GMCM = new GeneralMemoConcessionManager();
        private PriceGroupManager _PGManager = new PriceGroupManager();
        private IRMS.Entities.GeneralMemoConcession _GenMemoObj = new IRMS.Entities.GeneralMemoConcession();

        DataTable dtMarkdownList = new DataTable();
        DataTable dtNewMarkdownList = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                SetDataGridColumns();
                LoadMDMemoInfo();
            }
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

            int iPos = 0;
            foreach (DataControlField dgCol in gvMarkdownList.Columns)
            {
                if (iPos >= 5)
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
            this.gvNewMarkdownList.DataSource = dtNewMarkdownList;
            gvNewMarkdownList.DataBind();
        }
        private void LoadMDMemoInfo()
        {
            GroupAreaMemoManager gAMM = new GroupAreaMemoManager();
            PricePointManager ppM = new PricePointManager();

            _GenMemoObj = GMCM.GetGeneralMemoConcessionByKey(Convert.ToInt64(Session["MemoID"]));
            _GenMemoObj.RecordNumber = Convert.ToInt32(Session["MemoID"]);
            Session["GenMemoObject"] = _GenMemoObj;

            txtMemoNumber.Text = _GenMemoObj.MemoNumber;
            txtMemoDate.Text = _GenMemoObj.MemoDate.ToShortDateString();
            txtBrandName.Text = _GenMemoObj.BrandName;

            txtApplyPricePoint.Text = _GenMemoObj.PriceType;
            txtEffectivityDate.Text = _GenMemoObj.FromDate.ToShortDateString();

            
            if (_GenMemoObj.PriceType.ToUpper() == "AREA")
            {
                pnlAreaGroup.Visible = true;
                pnlSubAreaGroup.Visible = false;
                mvApplyPricePoint.SetActiveView(vAreaGroup);
                lblSubArea.Visible = false;
                txtSubAreaGroup.Visible = false;
                txtAreaGroup.Text = gAMM.GetAreaGroupMemoByKey(_GenMemoObj.GroupNumber).GroupName.ToUpper();
            }
            else if (_GenMemoObj.PriceType.ToUpper() == "SUB-AREA")
            {
                pnlSubAreaGroup.Visible = true;
                pnlAreaGroup.Visible = false;                
                //lblSubArea.Visible = true;
                mvApplyPricePoint.SetActiveView(vAreaGroup);
                lblSubArea.Visible = true;
                txtSubAreaGroup.Visible = true;
                txtAreaGroup.Text = gAMM.GetAreaGroupMemoByKey(_GenMemoObj.GroupNumber).GroupName.ToUpper();
                List<int> GroupNoList = ppM.GetDistinctGroupNoByMemoNo(_GenMemoObj.MemoNumber);

                if (GroupNoList.Count > 1)
                    txtSubAreaGroup.Text = "ALL";
                else
                    txtSubAreaGroup.Text = new SubGroupAreaManager().GetSubGroupArea(GroupNoList[0]).GroupName.ToUpper();

                txtPromoPeriodTo.Text = _GenMemoObj.ToDate.ToShortDateString();              
            }
            else
            {
                mvApplyPricePoint.SetActiveView(vCustomer);
            }


            switch (_GenMemoObj.GroupNumber)
            {
                case 0:
                    {
                        txtAreaGroup.Text = "ALL";
                    }
                    break;
                case 99:
                    {
                        txtAreaGroup.Text = "ALL PROVINCES"; 
                    }
                    break;
            }
            LoadMDMemoList();
        }
        private void LoadMDMemoList()
        {
            List<IRMS.Entities.GeneralMemoConcessionDetail> DuplicateGenMemoDetailList = new List<IRMS.Entities.GeneralMemoConcessionDetail>();

            GeneralMemoConcessionDetailManager GMCDManager = new GeneralMemoConcessionDetailManager();
            List<IRMS.Entities.GeneralMemoConcessionDetail> GenMemoDetailsList = new List<IRMS.Entities.GeneralMemoConcessionDetail>();

            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();

            DataRow dtRow;
            DataRow dtNewRow;
            GenMemoDetailsList = GMCDManager.GetGeneralMemoConcessionDetailByID(Convert.ToInt64(Session["MemoID"]));
            foreach (IRMS.Entities.GeneralMemoConcessionDetail genMemoConcessionItem in GenMemoDetailsList)
            {
                if (genMemoConcessionItem.ynFurther == true)
                {
                    dtRow = dtMarkdownList.NewRow();
                    dtRow["STYLE #"] = genMemoConcessionItem.StyleNumber;
                    dtRow["DESCRIPTION"] = genMemoConcessionItem.StyleDescription;
                    dtRow["CURRENT PRICE"] = string.Format("{0:0.00}",genMemoConcessionItem.CurrentPrice);
                    dtRow["MARKDOWN PRICE"] = string.Format("{0:0.00}",genMemoConcessionItem.MDPrice);

                    foreach (PriceGroup pgroupItem in _PriceGroupList)
                    {
                        dtRow[pgroupItem.GroupField.ToString()] = string.Format("{0:0.00}", (Convert.ToDouble(genMemoConcessionItem.MDPrice) + Convert.ToDouble(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo))));
                    }

                    dtMarkdownList.Rows.Add(dtRow);
                }
                else
                {
                    dtNewRow = dtNewMarkdownList.NewRow();
                    dtNewRow["STYLE #"] = genMemoConcessionItem.StyleNumber;
                    dtNewRow["DESCRIPTION"] = genMemoConcessionItem.StyleDescription;
                    dtNewRow["CURRENT PRICE"] = string.Format("{0:0.00}", genMemoConcessionItem.CurrentPrice);
                    dtNewRow["MARKDOWN PRICE"] = string.Format("{0:0.00}", genMemoConcessionItem.MDPrice);

                    foreach (PriceGroup pgroupItem in _PriceGroupList)
                    {
                        dtNewRow[pgroupItem.GroupField.ToString()] = string.Format("{0:0.00}", (Convert.ToDouble(genMemoConcessionItem.MDPrice) + Convert.ToDouble(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo))));
                    }
                    dtNewMarkdownList.Rows.Add(dtNewRow);
                }

            }
            Session["LIST"] = dtMarkdownList;
            Session["NEWLIST"] = dtNewMarkdownList;

            gvMarkdownList.DataSource = (DataTable)Session["LIST"];
            gvMarkdownList.DataBind();

            gvNewMarkdownList.DataSource = (DataTable)Session["NEWLIST"];
            gvNewMarkdownList.DataBind();
        }

        protected void rdioApplyPricePointTo_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_PageIndexChanged(object sender, EventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_SelectedIndexChangedEx(object sender, EventArgs e)
        {
            _GenMemoObj = (IRMS.Entities.GeneralMemoConcession)Session["GenMemoObject"];
            PriceManager pM = new PriceManager();
            PricePointManager ppM = new PricePointManager();

            dtMarkdownList = (DataTable)Session["LIST"]; ;
            var ItemFoundResult = (from myRow in dtMarkdownList.AsEnumerable()
                                   where myRow.Field<string>("STYLE #") == gvItems.SelectedRow.Cells[1].Text
                                   select myRow);

            if (ItemFoundResult.Count() > 0)
            {
                this.lblDuplicateCount.Text = "{0} items found!";
                lblDuplicateCount.Text = string.Format(lblDuplicateCount.Text, 1);
                hfDuplicateStylePopupExtender.Show();
                return;
            }


            Double dResult = 0;
            //GET REGULAR PRICE
            dResult = Convert.ToDouble(pM.GetSRPByStyle(gvItems.SelectedRow.Cells[1].Text, txtBrandName.Text).Price_2);
            lblPriceStatus.Text = "NEW";


            //GET MARKDOWN PRICE IF ANY
            PricePoint pPoint = new PricePoint();

            int GroupNo = -1;

            GroupNo = _GenMemoObj.GroupNumber;
            if (_GenMemoObj.PriceType == "AREA")
            {
                if (GroupNo == 0)
                    GroupNo = 1;
                else
                {
                    if (GroupNo == 99)
                        GroupNo = 2;
                }
            }

                
            pPoint = ppM.GetStyleCurrentPrice1(gvItems.SelectedRow.Cells[1].Text, txtBrandName.Text, _GenMemoObj.PriceType, GroupNo);

            //GET MARKDOWN PRICE IF ANY
            if (pPoint != null)
            {
                dResult = Convert.ToDouble(pPoint.Price);
                lblPriceStatus.Text = "MARKDOWN";
            }


            txtCurrentPrice.Text = string.Format("{0:0.00}", dResult);
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_PageIndexChanged(object sender, EventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void gvAddMemo_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void btnUpdateGeneralMemo_ClickEx(object sender, EventArgs e)
        {
            DateTime ApprovedDate;
            _GenMemoObj = GMCM.GetGeneralMemoConcessionByKey(Convert.ToInt64(Session["MemoID"]));

            PricePointManager PPM = new PricePointManager();
            ApprovedDate = PPM.GetApprovedDate(_GenMemoObj.MemoNumber);

            PPM.DeleteByMemoNo(_GenMemoObj.MemoNumber);

            GeneralMemoConcessionDetailManager GMCDManager = new GeneralMemoConcessionDetailManager();
            GMCDManager.DeleteByMemoID(_GenMemoObj.RecordNumber);
            
            
             if (_GenMemoObj.PriceType.ToUpper() == "AREA")
                SavePricePointByArea(_GenMemoObj,ApprovedDate);

            if (_GenMemoObj.PriceType.ToUpper() == "SUB-AREA")
                SavePricePointBySubArea(_GenMemoObj,ApprovedDate);

            if (_GenMemoObj.PriceType.ToUpper() == "CUSTOMER")
                SavePricePointByCustomer(_GenMemoObj,ApprovedDate);
             
            SaveGenMemoDetail(_GenMemoObj);


            lblNewMemoNo.Text = string.Format(lblNewMemoNo.Text, txtMemoNumber.Text);
            hfMemoNoPopupExtender.Show();
        }


        private void SavePricePointByArea(IRMS.Entities.GeneralMemoConcession genMemoObj, DateTime ApprovedDate)
        {
            GroupAreaMemoManager _GroupAreaMemoManager = new GroupAreaMemoManager();
            List<GroupAreaMemoClass> _GroupAreaMemoList = new List<GroupAreaMemoClass>();

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
                        pricePointObj.Date_Approved = ApprovedDate;
                        PPointManager.Save(pricePointObj);
                    }
                }
            }


            iTotalRow = gvNewMarkdownList.Rows.Count;
            foreach (GroupAreaMemoClass gAreaMemo in _GroupAreaMemoList)
            {
                foreach (PriceGroup pgroupItem in _PriceGroupList)
                {
                    for (iRow = 0; iRow < iTotalRow; iRow++)
                    {
                        pricePointObj = new PricePoint();
                        pricePointObj.StyleNo = gvNewMarkdownList.Rows[iRow].Cells[2].Text;
                        pricePointObj.BrandName = genMemoObj.BrandName;
                        pricePointObj.PGNo = pgroupItem.PGNo;
                        pricePointObj.Price = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                        pricePointObj.Price_Type = genMemoObj.PriceType;
                        pricePointObj.Date_Posted = genMemoObj.MemoDate;
                        pricePointObj.f_Date = genMemoObj.FromDate;
                        pricePointObj.Group_No = gAreaMemo.AreaGroupNo;
                        pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                        pricePointObj.Memo_No = genMemoObj.MemoNumber;
                        pricePointObj.Date_Approved = ApprovedDate;
                        PPointManager.Save(pricePointObj);
                    }
                }
            }
        }
        private void SavePricePointBySubArea(IRMS.Entities.GeneralMemoConcession genMemoObj, DateTime ApprovedDate)
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
                    pricePointObj.BrandName = genMemoObj.BrandName;
                    pricePointObj.PGNo = pgroupItem.PGNo;
                    pricePointObj.Price_Type = genMemoObj.PriceType;
                    pricePointObj.Price = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                    pricePointObj.Date_Posted = genMemoObj.MemoDate;
                    pricePointObj.f_Date = genMemoObj.FromDate;
                    pricePointObj.t_Date = genMemoObj.ToDate;
                    pricePointObj.Group_No = genMemoObj.GroupNumber;
                    pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                    pricePointObj.Memo_No = genMemoObj.MemoNumber;
                    pricePointObj.Date_Approved = ApprovedDate;
                    PPointManager.Save(pricePointObj);
                }
            }


            iTotalRow = gvNewMarkdownList.Rows.Count;
            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                for (iRow = 0; iRow < iTotalRow; iRow++)
                {
                    pricePointObj = new PricePoint();
                    pricePointObj.StyleNo = gvNewMarkdownList.Rows[iRow].Cells[2].Text;
                    pricePointObj.BrandName = genMemoObj.BrandName;
                    pricePointObj.PGNo = pgroupItem.PGNo;
                    pricePointObj.Price = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[6].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                    pricePointObj.Date_Posted = genMemoObj.MemoDate;
                    pricePointObj.f_Date = genMemoObj.FromDate;
                    pricePointObj.t_Date = genMemoObj.ToDate;
                    pricePointObj.Group_No = genMemoObj.GroupNumber;
                    pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                    pricePointObj.Memo_No = genMemoObj.MemoNumber;
                    pricePointObj.Date_Approved = ApprovedDate;
                    PPointManager.Save(pricePointObj);
                }
            }
        }
        private void SavePricePointByCustomer(IRMS.Entities.GeneralMemoConcession genMemoObj, DateTime ApprovedDate)
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
                    pricePointObj.BrandName = genMemoObj.BrandName;
                    pricePointObj.Price_Type = genMemoObj.PriceType;
                    pricePointObj.PGNo = pgroupItem.PGNo;
                    pricePointObj.Price = Convert.ToDecimal(gvMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                    pricePointObj.Date_Posted = genMemoObj.MemoDate;
                    pricePointObj.f_Date = genMemoObj.FromDate;
                    pricePointObj.t_Date = genMemoObj.ToDate;
                    pricePointObj.Group_No = genMemoObj.GroupNumber;
                    pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                    pricePointObj.Memo_No = genMemoObj.MemoNumber;
                    pricePointObj.Date_Approved = ApprovedDate;
                    PPointManager.Save(pricePointObj);
                }
            }


            iTotalRow = gvNewMarkdownList.Rows.Count;
            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                for (iRow = 0; iRow < iTotalRow; iRow++)
                {
                    pricePointObj = new PricePoint();
                    pricePointObj.StyleNo = gvNewMarkdownList.Rows[iRow].Cells[2].Text;
                    pricePointObj.BrandName = genMemoObj.BrandName;
                    pricePointObj.Price_Type = genMemoObj.PriceType;
                    pricePointObj.PGNo = pgroupItem.PGNo;
                    pricePointObj.Price = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[5].Text) + Convert.ToDecimal(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo));
                    pricePointObj.Date_Posted = genMemoObj.MemoDate;
                    pricePointObj.f_Date = genMemoObj.FromDate;
                    pricePointObj.t_Date = genMemoObj.ToDate;
                    pricePointObj.Group_No = genMemoObj.GroupNumber;
                    pricePointObj.Memo_ID = genMemoObj.RecordNumber;
                    pricePointObj.Memo_No = genMemoObj.MemoNumber;
                    pricePointObj.Date_Approved = ApprovedDate;
                    PPointManager.Save(pricePointObj);
                }
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
                genMemoDetailObj.BrandName = txtBrandName.Text;
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


            iTotal = gvNewMarkdownList.Rows.Count;
            for (int iRow = 0; iRow < iTotal; iRow++)
            {
                genMemoDetailObj = new IRMS.Entities.GeneralMemoConcessionDetail();
                genMemoDetailObj.GeneralMemoID = genMemoObj.RecordNumber;
                genMemoDetailObj.MemoNumber = genMemoObj.MemoNumber;
                genMemoDetailObj.StyleNumber = gvNewMarkdownList.Rows[iRow].Cells[2].Text;
                genMemoDetailObj.BrandName = txtBrandName.Text;
                genMemoDetailObj.StyleDescription = gvNewMarkdownList.Rows[iRow].Cells[3].Text;
                genMemoDetailObj.MDPrice = Convert.ToInt32(Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[5].Text));
                genMemoDetailObj.CurrentPrice = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[4].Text);

                genMemoDetailObj.Price1 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[6].Text);
                genMemoDetailObj.Price2 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[7].Text);
                genMemoDetailObj.Price3 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[8].Text);
                genMemoDetailObj.Price4 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[9].Text);
                genMemoDetailObj.Price5 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[10].Text);
                genMemoDetailObj.Price6 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[11].Text);
                genMemoDetailObj.Price7 = Convert.ToDecimal(gvNewMarkdownList.Rows[iRow].Cells[12].Text);

                genMemoDetailObj.ynFurther = false;
                GMCDManager.Save(genMemoDetailObj);
            }
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
                AddToMarkdownList(Session["NEWLIST"], ref dtNewMarkdownList, ref gvNewMarkdownList);
                Session["NEWLIST"] = dtNewMarkdownList;
            }
            else
            {
                AddToMarkdownList(Session["LIST"], ref dtMarkdownList, ref gvMarkdownList);
                Session["LIST"] = dtMarkdownList;
            }
        }

        private void AddToMarkdownList(Object Session, ref DataTable dt, ref GridView gvObject)
        {
            Double dPrice = 0;
            List<PriceGroup> _PriceGroupList = new List<PriceGroup>();
            _PriceGroupList = _PGManager.PriceGroupConcession();

            dt = (DataTable)Session;

            DataRow dtRow = dt.NewRow();
            //dtRow["MD STAT"] = lblPriceStatus.Text;
            dtRow["STYLE #"] = gvItems.SelectedRow.Cells[1].Text;
            dtRow["DESCRIPTION"] =HttpUtility.HtmlDecode(gvItems.SelectedRow.Cells[3].Text);
            dtRow["CURRENT PRICE"] = txtCurrentPrice.Text;
            dtRow["MARKDOWN PRICE"] = string.Format("{0:0.00}", Convert.ToDouble(txtMarkDownPrice.Text));

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
                    dgCol.ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                iPos++;
            }


            SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + txtBrandName.Text +
               "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
 
            SqlDataSourceItems.DataBind();
            //gvItems.DataBind();
        }

        protected void btnSelectItemNo_Click(object sender, EventArgs e)
        {

        }

        protected void btnCloseMemoNoNotifier_Click(object sender, EventArgs e)
        {
            Redirector.Redirect("~/Marketing/GeneralMemoConcession.aspx");
        }

        protected void btnMemoSearch_Click(object sender, ImageClickEventArgs e)
        {
            GMCM.SearchGeneralMemoByMemoNoAndBrand(SqlDataSourceAddMemo, txtBrandName.Text, txtAddMemoSearch.Text);
            gvAddMemo.DataBind();
            btnAddMemo_ModalPopupExtender.Show();
        }

        protected void btnAddMemoOk_Click(object sender, EventArgs e)
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

            gvNewMarkdownList.DataSource = (DataTable)Session["NEWLIST"];
            gvNewMarkdownList.DataBind();

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
            dtRow["CURRENT PRICE"] = string.Format("{0:0.00}",gmcd.CurrentPrice);
            dtRow["MARKDOWN PRICE"] = string.Format("{0:0.00}",gmcd.MDPrice);

            foreach (PriceGroup pgroupItem in _PriceGroupList)
            {
                dtRow[pgroupItem.GroupField.ToString()] = string.Format("{0:0.00}", (Convert.ToDouble(gmcd.MDPrice) + Convert.ToDouble(_PGManager.AddValueToRegularPrice(pgroupItem.PGNo))));
            }
            dt.Rows.Add(dtRow); 
        }

        protected void iBtnSearchItems_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearchItem.Text) == false)
            {
                SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + txtBrandName.Text +
                    "') and ([StyleNo] like '" + txtSearchItem.Text + "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            }
            else
            {
                SqlDataSourceItems.SelectCommand = @"SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = '" + txtBrandName.Text +
                   "') and StyleNo in (select StyleNo from STS) order by [StyleNo] desc";
            }
            SqlDataSourceItems.DataBind();
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
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
            foreach (GridViewRow row in gvNewMarkdownList.Rows)
            {
                chkItem = (CheckBox)row.FindControl("chkStyleNumber");

                if (chkItem.Checked)
                    dtNewMarkdownList.Rows[iRow].Delete();
                else
                    iRow++;
            }
            Session["NEWLIST"] = dtNewMarkdownList;
            gvNewMarkdownList.DataSource = dtNewMarkdownList;
            gvNewMarkdownList.DataBind();
        }

        private void ResponseMessage(string sMess)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + sMess + "');", true);
        }

        protected void btnMarkUpYes_Click(object sender, EventArgs e)
        {
            if (lblPriceStatus.Text == "NEW")
            {
                AddToMarkdownList(Session["NEWLIST"], ref dtNewMarkdownList, ref gvNewMarkdownList);
                Session["NEWLIST"] = dtNewMarkdownList;
            }
            else
            {
                AddToMarkdownList(Session["LIST"], ref dtMarkdownList, ref gvMarkdownList);
                Session["LIST"] = dtMarkdownList;
            }
        }
    }
}
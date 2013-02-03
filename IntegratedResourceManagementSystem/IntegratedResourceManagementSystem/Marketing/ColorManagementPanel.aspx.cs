using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using System.Text;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class ColorManagementPanel : System.Web.UI.Page
    {
        #region variables
        ColorManager CM = new ColorManager();
        Color color = new Color();
        #endregion

        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/Stylepanel.aspx");
            }

            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
            if (Permission.CanInsert() == false)
            {
                btnNewColor.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Color.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                btnUpdateColor.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Color.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Color.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        private void LoadAllColors(string search_parameters="")
        {
            if (string.IsNullOrEmpty(search_parameters))
            {
                gvColorsList.DataBind();
                return;
            }
            CM.LoadColors(SqlDataSourceColors, search_parameters);
        }

        protected void btnSaveColor_Click(object sender, EventArgs e)
        {
            var color = new Color
            {
                ColorCode = txtColorCode.Text.ToUpper(),
                ColorDescription = txtColorDescription.Text,
                DateCreated = DateTime.UtcNow,
                IsActive ="Yes"
            };
            CM.Save(color);
            #region log
            CM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            txtColorCode.Text = null;
            txtColorDescription.Text = null;
            LoadAllColors();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            var colorToUpdate = new Color
            {
                ColorCode = txtColorCodeUpdate.Text.ToUpper(),
                ColorDescription = txtColorDescriptionUpdate.Text,
                RecordNo = long.Parse(gvColorsList.SelectedRow.Cells[2].Text),
                DateCreated  = DateTime.UtcNow,
                IsActive = "Yes"
            };
            CM.Save(colorToUpdate);
            #region log
            CM.Identity =(int)colorToUpdate.RecordNo;
            CM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            LoadAllColors();
        }

        protected void gvColorsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtColorCodeUpdate.Text = gvColorsList.SelectedRow.Cells[3].Text;
            txtColorDescriptionUpdate.Text = gvColorsList.SelectedRow.Cells[4].Text;
            updateErrorMessage.Visible = false;
            lblColorToDelete.Text = "Delete color " + txtColorCodeUpdate.Text + "?";
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            color.RecordNo= long.Parse(gvColorsList.SelectedRow.Cells[2].Text);
            CM.Delete(color);
            #region log
            CM.Identity = (int)color.RecordNo;
            CM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            LoadAllColors();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }

       private void Search()
        {
            LoadAllColors(txtSearch.Text);
        }


       protected void btnAliceBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ALB";
           txtColorDescription.Text = "AliceBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnAntiqueWhite_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ANW";
           txtColorDescription.Text = "AntiqueWhite";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnAqua_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ACQ";
           txtColorDescription.Text = "Acqua";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnAquaMarine_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ACQM";
           txtColorDescription.Text = "AcquaMarine";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnAzure_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "AZU";
           txtColorDescription.Text = "Azure";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBeige_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BEI";
           txtColorDescription.Text = "Beige";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBisque_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BES";
           txtColorDescription.Text = "Bisque";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBlack_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BLK";
           txtColorDescription.Text = "Black";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBlanchedAlmond_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BLK";
           txtColorDescription.Text = "Black";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BLU";
           txtColorDescription.Text = "Blue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBlueViolet_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BLUV";
           txtColorDescription.Text = "BlueViolet";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBrown_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BRW";
           txtColorDescription.Text = "Brown";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnBurlyWood_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "BURW";
           txtColorDescription.Text = "BurlyWood";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnCadetBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CBLU";
           txtColorDescription.Text = "CadetBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnChartreuse_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CHA";
           txtColorDescription.Text = "Chartreuse";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnChocolate_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CHO";
           txtColorDescription.Text = "Chocolate";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnCoral_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "COR";
           txtColorDescription.Text = "Coral";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnCornflowerBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CRNFB";
           txtColorDescription.Text = "CornFlowerBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnCornsilk_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CRNSL";
           txtColorDescription.Text = "CornSilk";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnCrimson_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CRM";
           txtColorDescription.Text = "Crimson";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnCyan_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "CYN";
           txtColorDescription.Text = "Cyan";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKB";
           txtColorDescription.Text = "DarkBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkCyan_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKC";
           txtColorDescription.Text = "DarkCyan";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkGoldenrod_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKGR";
           txtColorDescription.Text = "DarkGoldenrod";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKG";
           txtColorDescription.Text = "DarkGray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKGR";
           txtColorDescription.Text = "GarkGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkKhaki_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKKH";
           txtColorDescription.Text = "DarkKhaki";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkMagenta_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKM";
           txtColorDescription.Text = "DarkMagenta";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkOliveGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKOG";
           txtColorDescription.Text = "DarkOliveGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkOrange_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKOR";
           txtColorDescription.Text = "DarkOrange";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkOrchid_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKORC";
           txtColorDescription.Text = "DarkOrchid";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkRed_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKR";
           txtColorDescription.Text = "DarkRed";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkSalmon_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKSAL";
           txtColorDescription.Text = "DarkSalmon";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkSeaGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKSG";
           txtColorDescription.Text = "DarkSeaGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkSlateBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKSLB";
           txtColorDescription.Text = "DarkSlateBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkSlateGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKSLG";
           txtColorDescription.Text = "DarkSlateGray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkTurquoise_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKTUR";
           txtColorDescription.Text = "DarkTurquoise";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDarkViolet_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DRKVIO";
           txtColorDescription.Text = "DarkViolet";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDeepPink_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DPNK";
           txtColorDescription.Text = "DeepPink";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDeepSkyBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DSBLU";
           txtColorDescription.Text = "DarkSkyBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDimGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DGRY";
           txtColorDescription.Text = "DimGray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnDodgerBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "DODBLU";
           txtColorDescription.Text = "DodgeBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnFirebrick_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "FRBRK";
           txtColorDescription.Text = "FireBreak";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnFloralWhite_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "FLWHI";
           txtColorDescription.Text = "FloralWhite";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnForestGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "FORGRN";
           txtColorDescription.Text = "ForestGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnFuchsia_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "FUCH";
           txtColorDescription.Text = "Fuchsia";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGainsboro_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GAIN";
           txtColorDescription.Text = "Gainsboro";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGhostWhite_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GHOWHT";
           txtColorDescription.Text = "GhostWhite";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGold_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GLD";
           txtColorDescription.Text = "Gold";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGoldenrod_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GLDNRD";
           txtColorDescription.Text = "Goldenrod";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GRY";
           txtColorDescription.Text = "Gray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GRN";
           txtColorDescription.Text = "Green";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnGreenYellow_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "GRNYLW";
           txtColorDescription.Text = "GreenYellow";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnHoneydew_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "HNYDEW";
           txtColorDescription.Text = "Honeydew";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnHotPink_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "HTPNK";
           txtColorDescription.Text = "HotPink";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnIndianRed_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "IDNRD";
           txtColorDescription.Text = "IdianRed";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnIndigo_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "INDG";
           txtColorDescription.Text = "Indigo";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnIvory_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "IVRY";
           txtColorDescription.Text = "Ivory";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnKhaki_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "KHK";
           txtColorDescription.Text = "Khaki";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLavender_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LVNDR";
           txtColorDescription.Text = "Lavender";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLavenderBlush_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LVNDRB";
           txtColorDescription.Text = "LavenderBlush";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLawnGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LWNGRN";
           txtColorDescription.Text = "LawnGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLemonChiffon_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LMNCHF";
           txtColorDescription.Text = "LemonChiffon";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LBLU";
           txtColorDescription.Text = "LightBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightCoral_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LCRL";
           txtColorDescription.Text = "LightCoral";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightCyan_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LCYN";
           txtColorDescription.Text = "LightCyan";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightGoldenrodYellow_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LGRYLW";
           txtColorDescription.Text = "LightGoldenrodYellow";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightLightGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LGRY";
           txtColorDescription.Text = "LightGray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LGRN";
           txtColorDescription.Text = "LightGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightPink_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LPNK";
           txtColorDescription.Text = "LightPink";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightSalmon_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LSLMN";
           txtColorDescription.Text = "LightSalmon";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightSeaGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LSGRN";
           txtColorDescription.Text = "LightSeaGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightSkyBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LSBLU";
           txtColorDescription.Text = "LightSkyBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightSlateGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LSGRY";
           txtColorDescription.Text = "LightSlateGray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightSteelBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LSTLB";
           txtColorDescription.Text = "LightSteelBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLightYellow_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LYLW";
           txtColorDescription.Text = "LightYellow";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLime_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LME";
           txtColorDescription.Text = "Lime";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLimeGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LMEGRN";
           txtColorDescription.Text = "LimeGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnLinen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "LNN";
           txtColorDescription.Text = "Linen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMagenta_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MGNT";
           txtColorDescription.Text = "Magenta";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMaroon_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MRN";
           txtColorDescription.Text = "Maroon";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumAquamarine_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MAQUM";
           txtColorDescription.Text = "MediumAquamarine";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MBLU";
           txtColorDescription.Text = "MediumBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumOrchid_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MORCH";
           txtColorDescription.Text = "MediumOrchid";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumPurple_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MPRPL";
           txtColorDescription.Text = "MediumPurple";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumSeaGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MSEGRN";
           txtColorDescription.Text = "MediumSeaGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumSlateBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MSBLU";
           txtColorDescription.Text = "MediumSlateBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumSpringGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MSBLU";
           txtColorDescription.Text = "MediumSlateBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumTurquoise_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MTURQS";
           txtColorDescription.Text = "MediumTurquoise";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMediumVioletRed_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MVLTRD";
           txtColorDescription.Text = "MediumVioletRed";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMidnightBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MIDBLU";
           txtColorDescription.Text = "MidnightBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMintCream_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MNTCRM";
           txtColorDescription.Text = "MintCream";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMistyRose_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MTRSE";
           txtColorDescription.Text = "MistyRose";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnMoccasin_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "MOCC";
           txtColorDescription.Text = "Moccasin";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnNavajoWhite_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "NVJWHT";
           txtColorDescription.Text = "NavajoWhite";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnNavy_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "NVY";
           txtColorDescription.Text = "Navy";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnOldLace_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "OLDLCE";
           txtColorDescription.Text = "OldLace";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnOlive_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "OLV";
           txtColorDescription.Text = "Olive";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnOliveDrab_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "OLVDRD";
           txtColorDescription.Text = "OliveDrab";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnOrange_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ORA";
           txtColorDescription.Text = "Orange";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnOrangeRed_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ORARD";
           txtColorDescription.Text = "OrangeRed";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnOrchid_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "ORCH";
           txtColorDescription.Text = "Orchid";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPaleGoldenrod_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "OLDLCE";
           txtColorDescription.Text = "OldLace";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPaleGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PLGRN";
           txtColorDescription.Text = "PaleGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPaleTurquoise_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PLTURQ";
           txtColorDescription.Text = "PaleTurquoise";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPaleVioletRed_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PLVLT";
           txtColorDescription.Text = "PaleViolet";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPapayaWhip_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PPYWHP";
           txtColorDescription.Text = "PapayaWhip";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPeachPuff_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PCHPF";
           txtColorDescription.Text = "PeachPuff";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPeru_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PRU";
           txtColorDescription.Text = "Peru";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPink_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PNK";
           txtColorDescription.Text = "Pink";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPlum_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PLM";
           txtColorDescription.Text = "Plum";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPowderBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PWDBLU";
           txtColorDescription.Text = "PowderBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnPurple_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "PRPL";
           txtColorDescription.Text = "Purple";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnRed_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "RD";
           txtColorDescription.Text = "Red";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnRosyBrown_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "RSYBRN";
           txtColorDescription.Text = "RosyBrown";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnRoyalBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "RYLBLU";
           txtColorDescription.Text = "RoylBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSaddleBrown_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SDLBRN";
           txtColorDescription.Text = "SaddleBrown";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSalmon_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SLMN";
           txtColorDescription.Text = "Salmon";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSandyBrown_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SNDBRN";
           txtColorDescription.Text = "SandyBrown";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSeaGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SEGRN";
           txtColorDescription.Text = "SeaGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSeaShell_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SESHLL";
           txtColorDescription.Text = "SeaShell";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSienna_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SINN";
           txtColorDescription.Text = "Sienna";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSilver_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SLVR";
           txtColorDescription.Text = "Silver";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSkyBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SKYBLU";
           txtColorDescription.Text = "SkyBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSlateBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SLBLU";
           txtColorDescription.Text = "SlateBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSlateGray_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SLGRY";
           txtColorDescription.Text = "SlateGray";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSnow_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SNW";
           txtColorDescription.Text = "Snow";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSpringGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "SPRGRN";
           txtColorDescription.Text = "SpringGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnSteelBlue_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "STLBLU";
           txtColorDescription.Text = "SteelBlue";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnTan_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "TN";
           txtColorDescription.Text = "Tan";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnTeal_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "TEL";
           txtColorDescription.Text = "Teal";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnThistle_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "THSTL";
           txtColorDescription.Text = "Thistle";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnTomato_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "TMT";
           txtColorDescription.Text = "Tomato";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnTransparent_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "TPRNT";
           txtColorDescription.Text = "Transparent";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnTurquoise_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "TRQUO";
           txtColorDescription.Text = "Turquoise";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnViolet_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "VLT";
           txtColorDescription.Text = "Violet";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnWheat_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "WEHT";
           txtColorDescription.Text = "Wheat";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnWhite_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "WHT";
           txtColorDescription.Text = "White";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnWhiteSmoke_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "WHTSMK";
           txtColorDescription.Text = "WhiteSmoke";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnYellow_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "YLW";
           txtColorDescription.Text = "Yellow";
           this.btnNewSize_ModalPopupExtender.Show();
       }

       protected void btnYellowGreen_Click(object sender, EventArgs e)
       {
           txtColorCode.Text = "YLWGRN";
           txtColorDescription.Text = "YellowGreen";
           this.btnNewSize_ModalPopupExtender.Show();
       }


     
    }
}
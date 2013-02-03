using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using IRMS.ObjectModel;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class CompanyManagementPanel : System.Web.UI.Page
    {
        #region variables
        CompanyManager CompanyManager = new CompanyManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/DashBoardPanel.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            fCompany.CompanyLogo = hfAvatarFileName.Value;
            CompanyManager.Save(fCompany.Company);
            #region log
            CompanyManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            gvCompanyList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            fCompany_Update.CompanyLogo = hfLogoUpdate.Value;
            CompanyManager.Save(fCompany_Update.Company);
            #region log
            CompanyManager.Identity = fCompany_Update.CompanyId;
            CompanyManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            imgLogoUpdate.ImageUrl = @"company-logos/" + hfLogoUpdate.Value;
            gvCompanyList.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            CompanyManager.Delete(fCompany_Update.Company);
            #region log
            CompanyManager.Identity = fCompany_Update.CompanyId;
            CompanyManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvCompanyList.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            CompanyManager.LoadCompanies(SqlDataSourceCompany, txtSearch.Text);
            gvCompanyList.DataBind();
        }

        protected void gvCompanyList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fCompany_Update.CompanyId = int.Parse(gvCompanyList.SelectedRow.Cells[2].Text);
            fCompany_Update.CompanyName = gvCompanyList.SelectedRow.Cells[3].Text;
            hfLogoUpdate.Value = gvCompanyList.SelectedDataKey[1].ToString();
            imgLogoUpdate.ImageUrl = @"company-logos/" + hfLogoUpdate.Value;
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            btnYes.Enabled = true;
            lblTermToDelete.Text = "Delete Company: " + fCompany_Update.CompanyName + "?";
            btnSaveUpdate.Enabled = true;
        }

        protected void btnpload_Click(object sender, EventArgs e)
        {
            ResizeImage(fUploadAvatar, label, hfAvatarFileName);
            btnNewBrand_ModalPopupExtender.Show();
        }
        private void ResizeImage(FileUpload fileUpload, Label lblMessage, HiddenField logoFileName)
        {
            // First we check to see if the user has selected a file
            if (fileUpload.HasFile)
            {
                // Find the fileUpload control
                string filename = fileUpload.FileName;

                // Check if the directory we want the image uploaded to actually exists or not
                if (!Directory.Exists(MapPath(@"company-logos")))
                {
                    // If it doesn't then we just create it before going any further
                    Directory.CreateDirectory(MapPath(@"company-logos"));
                }
                // Specify the upload directory
                string directory = Server.MapPath(@"company-logos\");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(fileUpload.FileContent);

                // Calculate the new image dimensions
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;
                int sngRatio = origWidth / origHeight;
                int newWidth = 100;
                if (sngRatio <= 0)
                {
                    sngRatio = 1;
                }
                int newHeight = newWidth / sngRatio;

                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, origWidth, origHeight);

                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);
                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias;
                oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, origWidth, origHeight);
                // Save the new graphic file to the server
                newBMP.Save(directory + "user_" + filename);

                // Once finished with the bitmap objects, we deallocate them.
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();

                // Write a message to inform the user all is OK
                lblMessage.Text = "Logo Uploaded!";

                // Display the image to the user
                imgAvatar.Visible = true;
                imgAvatar.ImageUrl = @"company-logos/user_" + filename;
                logoFileName.Value = "user_" + filename;
            }
            else
            {
                lblMessage.Text = "No image uploaded!";
            }
        }

        protected void btnUploadUpdate_Click(object sender, EventArgs e)
        {
            ResizeImage(FileUploadUpdate, lblLogoUpdate,hfLogoUpdate);
            imgLogoUpdate.ImageUrl = @"company-logos/" + hfLogoUpdate.Value;
            btnUpdateBrand_ModalPopupExtender.Show();
        }
    }
}
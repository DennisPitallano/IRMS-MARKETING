using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Web.UI.WebControls;
using IntegratedResourceManagementSystem.Common;
using IRMS.BusinessLogic.Manager;
using IRMS.Components;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class UpdateUserAccount : System.Web.UI.Page
    {
        #region variables 
        UserManager UserManager = new UserManager();
        UserRoleManager UserRoleManager = new UserRoleManager();
        UsersClass USER { get { return UserManager.GetUserAccountByKey(long.Parse(Request.QueryString["UserID"])); } }
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/DashBoardPanel.aspx");
            }
            GetUserInformation();
            Populate.InitializeDepartments(DDLDepartments);
        }

        private bool IsValidEncryptedPassword(string encryptedPassword)
        {
            bool result = false;
            try
            {
                Security.DecryptStringAES(encryptedPassword, Security.SECURITY_PASSWORD);
                result = true;
            }
            catch (Exception)
            {
                result = false;
            }
            return result;
        }

        private void  GetUserInformation()
        {
            //369 3 2
            hfUserID.Value = Request.QueryString["UserID"];
            txtFullName.Text = USER.FullName;
            txtContactNumber.Text = USER.ContactNumber;
            txtEmailAddress.Text = USER.Email;
            txtUserName.Text = USER.Username;

            DDLDepartments.SelectedValue = USER.DeptID.ToString();
            
            rdioGender.SelectedValue = USER.Gender;

            lboxUserLevel.SelectedValue = USER.UserLevelID.ToString();

            List<UserRole> UserRoles = UserRoleManager.GetUserRolesByUserId((int)USER.ID);

            for (int i = 0; i < chkBoxAccessGrant.Items.Count; i++)
            {
                foreach (UserRole user_role in UserRoles)
                {
                    if (chkBoxAccessGrant.Items[i].Value == user_role.Role)
                    {
                        chkBoxAccessGrant.Items[i].Selected = true;
                    }
                }
               
            }

            imgAvatar.ImageUrl = @"user-images/" + USER.Avatar;
            if (IsValidEncryptedPassword(USER.UserPass) == false)
            {
                lblMessageText.Text = "Warning: Encrypted Password is not valid! <br /> Please Update Account Password.";
                lblSuccessFull_ModalPopupExtender.Show();
                return;
            }
            else
            {
                txtPassword.Text = Security.DecryptStringAES(USER.UserPass, Security.SECURITY_PASSWORD);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lboxUserLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitializeAccessGrant(lboxUserLevel.SelectedItem.Text);
        }

        private void InitializeAccessGrant(string AccessLevel)
        {

            switch (AccessLevel)
            {
                case "Admin":
                    for (int i = 0; i < chkBoxAccessGrant.Items.Count; i++)
                    {
                        chkBoxAccessGrant.Items[i].Selected = true;
                    }
                    break;
                case "Manager":
                    for (int i = 0; i < chkBoxAccessGrant.Items.Count; i++)
                    {
                        chkBoxAccessGrant.Items[i].Selected = true;
                    }
                    break;
                case "Supervisor":
                    for (int i = 0; i < chkBoxAccessGrant.Items.Count; i++)
                    {
                        chkBoxAccessGrant.Items[i].Selected = true;
                    }
                    break;
                case "Staff":
                    for (int i = 0; i < chkBoxAccessGrant.Items.Count; i++)
                    {
                        chkBoxAccessGrant.Items[i].Selected = false;
                        if (chkBoxAccessGrant.Items[i].Text != "CAN DELETE" && chkBoxAccessGrant.Items[i].Text != "CAN APPROVE")
                        {
                            chkBoxAccessGrant.Items[i].Selected = true;
                        }
                    }
                    break;

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(rdioGender.SelectedValue))
            {
                lblMessageText.Text = "Please Select user gender!";
                lblSuccessFull_ModalPopupExtender.Show();
                return;
            }
            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                lblMessageText.Text = "Please input valid password!";
                lblSuccessFull_ModalPopupExtender.Show();
                txtPassword.Focus();
                return;
            }
            UsersClass UpdatedUserAccount = USER;
            UpdatedUserAccount.FullName = txtFullName.Text;
            UpdatedUserAccount.ContactNumber = txtContactNumber.Text;
            UpdatedUserAccount.Email = txtEmailAddress.Text;
            UpdatedUserAccount.Gender = rdioGender.SelectedValue;
            UpdatedUserAccount.UserPass = Security.EncryptStringAES(txtPassword.Text,Security.SECURITY_PASSWORD);
            UpdatedUserAccount.DeptID = int.Parse(DDLDepartments.SelectedValue);
            UpdatedUserAccount.UserLevelID = int.Parse(lboxUserLevel.SelectedValue);
                if (string.IsNullOrEmpty(hfAvatarFileName.Value))
                {
                    if (string.IsNullOrEmpty(UpdatedUserAccount.Avatar))
                    {
                        if (rdioGender.SelectedValue == "Male")
                        {
                            hfAvatarFileName.Value = "maleicon.png";
                        }
                        else
                        {
                            hfAvatarFileName.Value = "femaleicon.png";
                        }
                    }
                    else
                    {
                        hfAvatarFileName.Value = UpdatedUserAccount.Avatar;
                    }
                }
          
          
            UpdatedUserAccount.Avatar = hfAvatarFileName.Value;
            UpdatedUserAccount.IsActive = true;
            UserManager.Save(UpdatedUserAccount);
            #region log
            UserManager.Identity =(int)UpdatedUserAccount.ID;
            UserManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            SaveUserRoles();
        }

        private void SaveUserRoles()
        {
            try
            {
                ResetUserRoles();
                UserRoleManager.SaveUserRoles(GetAllUserRolesToSave());
                lblMessageText.Text = "User Account updated!";
                lblSuccessFull_ModalPopupExtender.Show();
            }
            catch (Exception)
            {
                return;
            }
        }
        private List<UserRole> GetAllUserRolesToSave()
        {
            List<UserRole> UserRoles = new List<UserRole>();
            for (int i = 0; i < this.chkBoxAccessGrant.Items.Count; i++)
            {
                if (chkBoxAccessGrant.Items[i].Selected)
                {
                    UserRole ur = new UserRole();
                    ur.Role = chkBoxAccessGrant.Items[i].Value;
                    ur.UserId = int.Parse(hfUserID.Value);
                    ur.DateRecorded = DateTime.UtcNow;
                    UserRoles.Add(ur);
                }
            }
            if (UserRoles.Count < 1)
            {
                return new List<UserRole>();
            }
            return UserRoles;
        }
        private void ResetUserRoles()
        {
            List<UserRole> USER_ROLES = new List<UserRole>();
            USER_ROLES = UserRoleManager.GetUserRolesByUserId(int.Parse(hfUserID.Value));
            UserRoleManager.DeleteUserRoles(USER_ROLES);
        }

        private void ResizeImage(FileUpload fileUpload)
        {
            // First we check to see if the user has selected a file
            if (fileUpload.HasFile)
            {
                // Find the fileUpload control
                string filename = fileUpload.FileName;

                // Check if the directory we want the image uploaded to actually exists or not
                if (!Directory.Exists(MapPath(@"user-images")))
                {
                    // If it doesn't then we just create it before going any further
                    Directory.CreateDirectory(MapPath(@"user-images"));
                }
                // Specify the upload directory
                string directory = Server.MapPath(@"user-images\");

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
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);

                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);
                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias;
                oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
                // Save the new graphic file to the server
                newBMP.Save(directory + "user_" + filename);

                // Once finished with the bitmap objects, we deallocate them.
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();

                // Write a message to inform the user all is OK
                label.Text = "File Name: <b style='color: red;'>" + filename + "</b><br>";
                label.Text += "Content Type: <b style='color: red;'>" + fileUpload.PostedFile.ContentType + "</b><br>";
                label.Text += "File Size: <b style='color: red;'>" + fileUpload.PostedFile.ContentLength.ToString() + "</b>";

                // Display the image to the user
                imgAvatar.Visible = true;
                imgAvatar.ImageUrl = @"user-images/user_" + filename;
                hfAvatarFileName.Value = "user_" + filename;
            }
            else
            {
                label.Text = "No image uploaded!";
            }
        }

        protected void btnpload_Click(object sender, EventArgs e)
        {
            ResizeImage(fUploadAvatar);
        }
    }
}
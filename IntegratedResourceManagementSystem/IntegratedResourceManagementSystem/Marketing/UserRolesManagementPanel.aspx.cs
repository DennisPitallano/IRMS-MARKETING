using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class UserRolesManagementPanel : System.Web.UI.Page
    {
        UserRoleManager UserRoleManger = new UserRoleManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvGarmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image User = (Image)gvGarmentList.SelectedRow.FindControl("imgUser");
            hfUserId.Value = User.AlternateText;
            lblUserFullName.Text ="NAME: "+ gvGarmentList.SelectedRow.Cells[3].Text;
            lblUserUserName.Text ="USER NAME: " + gvGarmentList.SelectedRow.Cells[4].Text;
            lblPassWord.Text = "PASSWORD: ##########";
            lblGrantText.Text = "Save Selected Grant for User:" + gvGarmentList.SelectedRow.Cells[4].Text;
            lblDeleteGrant.Text = "Delete All Grant in user: " + gvGarmentList.SelectedRow.Cells[4].Text;
            GetAllGrants();
        }

        public void InitializeRoles()
        {
            List<UserRole> USER_ROLES = new List<UserRole>();
            var can_insert_role = new UserRole
            {
                 Role = "CAN INSERT",
                 UserId = int.Parse(hfUserId.Value)
            };
            var can_delete_role = new UserRole
            {
                Role = "CAN DELETE",
                UserId = int.Parse(hfUserId.Value)
            };
            var can_update_role = new UserRole
            {
                Role = "CAN UPDATE",
                UserId = int.Parse(hfUserId.Value)
            };
            USER_ROLES.Add(can_insert_role);
            USER_ROLES.Add(can_delete_role);
            USER_ROLES.Add(can_update_role);

            chkUserRoles.DataSource = USER_ROLES;
            chkUserRoles.DataTextField = "Role";
            chkUserRoles.DataValueField = "Role";
            chkUserRoles.DataBind();
        }

        private void GetAllGrants()
        {
            List<UserRole> USER_ROLES = new List<UserRole>();

            USER_ROLES= UserRoleManger.GetUserRolesByUserId(int.Parse(hfUserId.Value));

            if (USER_ROLES.Count >0)
            {
                InitializeRoles();
                foreach (UserRole user_role in USER_ROLES)
                {
                    for (int i = 0; i < this.chkUserRoles.Items.Count; i++)
                    {
                        if (chkUserRoles.Items[i].Value == user_role.Role)
                        {
                            chkUserRoles.Items[i].Selected = true;
                        }
                    }
                }
               
            }
            else
            {
                InitializeRoles();
            }
            
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            try
            {
                ResetUserRoles();
                UserRoleManger.SaveUserRoles(GetAllUserRolesToSave());
                lblSuccessFull_ModalPopupExtender.Show();
            }
            catch (Exception)
            {
                return;
            }
        }

        private void ResetUserRoles()
        {
            List<UserRole> USER_ROLES = new List<UserRole>();
            USER_ROLES = UserRoleManger.GetUserRolesByUserId(int.Parse(hfUserId.Value));
            UserRoleManger.DeleteUserRoles(USER_ROLES);
        }

        private List<UserRole> GetAllUserRolesToSave()
        {
            List<UserRole> UserRoles = new List<UserRole>();
            for (int i = 0; i < this.chkUserRoles.Items.Count; i++)
            {
                if (chkUserRoles.Items[i].Selected)
                {
                    UserRole ur = new UserRole();
                    ur.Role = chkUserRoles.Items[i].Value;
                    ur.UserId = int.Parse(hfUserId.Value);
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

        protected void btnYesDeleteGrant_Click(object sender, EventArgs e)
        {
            ResetUserRoles();
            InitializeRoles();
        }
             
    }
}
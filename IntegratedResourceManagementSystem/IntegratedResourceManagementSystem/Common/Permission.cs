using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IRMS.ObjectModel;
using System.Web.UI;
using IRMS.BusinessLogic.Manager;
namespace IntegratedResourceManagementSystem.Common
{
    public static class Permission
    {
        #region variables
         public static UsersClass PERMITTED_USER { get; set; }
         public static List<UserRole> ROLES { get; set; }
         static UserLevelManager UserLevelManger = new UserLevelManager();
         static UserRoleManager UserRolesManager = new UserRoleManager();
        #endregion
        public static bool IsAdmin()
        {
            if (GetUserLevel() == "Admin")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool CanInsert()
        {
            return CheckRole("CAN INSERT");
        }

        public static bool CanUpdate()
        {
            return CheckRole("CAN UPDATE");
        }

        public static bool CanDelete()
        {
            return CheckRole("CAN DELETE");
        }

        public static bool CanApprove()
        {
            return CheckRole("CAN APPROVE");
        }

        private static bool CheckRole(string role)
        {
            bool result = false;
            foreach (var item in ROLES)
            {
                if (item.Role == role)
                {
                    result = true;
                    break;
                }
            }
            return result;
        }
        private static string GetUserLevel()
        {
            return UserLevelManger.GetUserLevelByKey(PERMITTED_USER.UserLevelID).UserLevelDescription;
        }

    }
}
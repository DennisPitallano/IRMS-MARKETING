using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class GroupAreaManager:LogManager<GroupAreaClass>
    {
        #region Accessor
        GroupAreaAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return GroupAreaAccessor.CreateInstance(); }
        }
        #endregion

        public List<GroupAreaClass> GroupArea()
        {
            return Accessor.AllGroupArea();
        }
        public GroupAreaClass GroupAreaByAreaNo(int AreaNo)
        {
            return Accessor.GroupAreaByAreaNo(AreaNo)[0];
        }

        public GroupAreaClass GetAreaGroupByKey(int id)
        {
            return Accessor.Query.SelectByKey<GroupAreaClass>(id) ?? new GroupAreaClass();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<GroupAreaClass> AreaGroups()
        {
            return Accessor.Query.SelectAll<GroupAreaClass>();
        }


        public void Save(GroupAreaClass GroupAreaClass)
        {
            using (DbManager db = new DbManager())
            {
                if (GroupAreaClass.AreaGroupNo != 0)
                {
                    Accessor.Query.Update(db, GroupAreaClass);
                }
                else
                {
                   Identity = Accessor.Query.InsertAndGetIdentity(db, GroupAreaClass);
                }
            }
        }


        public void Delete(GroupAreaClass GroupAreaClass)
        {
            using (DbManager db = new DbManager())
            {
               Accessor.Query.Delete(db, GroupAreaClass);
            }
        }


        public void LoadAreaGroups(SqlDataSource AreaGroupDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT [AGNo], [GroupName] FROM [GrpArea] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE GroupName LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY [AGNo] DESC";
            AreaGroupDataSource.SelectCommand = CommandText;
            AreaGroupDataSource.DataBind();
        }

    }

    public class SubGroupAreaManager : LogManager<SubGroupAreaClass>
    {
        #region Accessor
        SubGroupAreaAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return SubGroupAreaAccessor.CreateInstance(); }
        }
        #endregion

        public List<SubGroupAreaClass> SubGroupArea(int AreaNo)
        {
            return Accessor.SubGroupAreaByAreaNo(AreaNo);
        }

        public SubGroupAreaClass GetSubAreaGroupByKey(int id)
        {
            return Accessor.Query.SelectByKey<SubGroupAreaClass>(id) ?? new SubGroupAreaClass();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<SubGroupAreaClass> SubAreaGroups()
        {
            return Accessor.Query.SelectAll<SubGroupAreaClass>();
        }


        public void Save(SubGroupAreaClass SubGroupAreaClass)
        {
            using (DbManager db = new DbManager())
            {
                if (SubGroupAreaClass.SubAreaGroupNo != 0)
                {
                    Accessor.Query.Update(db, SubGroupAreaClass);
                }
                else
                {
                  Identity =  Accessor.Query.InsertAndGetIdentity(db, SubGroupAreaClass);
                }
            }
        }


        public void Delete(SubGroupAreaClass SubGroupAreaClass)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, SubGroupAreaClass);
            }
        }


        public void LoadSubAreaGroups(SqlDataSource SubAreaGroupDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT GrpSubArea.SAGNo, GrpSubArea.GroupName, GrpArea.GroupName AS GroupArea FROM GrpArea INNER JOIN GrpSubArea ON GrpArea.AGNo = GrpSubArea.AGNo  ";
            if (search_parameter != "")
            {
                CommandText += " WHERE  GrpSubArea.GroupName LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY GrpSubArea.SAGNo DESC";
            SubAreaGroupDataSource.SelectCommand = CommandText;
            SubAreaGroupDataSource.DataBind();
        }

        public List<SubGroupAreaClass> SubGroupAreaByCustomerArea(int AreaNo)
        {
            return Accessor.SubGroupAreaByCustomerAreaNo(AreaNo);
        }

        public SubGroupAreaClass GetSubGroupArea(int SubGroupNo)
        {
            return Accessor.GetSubGroupArea(SubGroupNo) ?? new SubGroupAreaClass();
        }
    }

    public class GroupAreaMemoManager
    {
        private List<GroupAreaMemoClass> _GroupAreaMemoList = new List<GroupAreaMemoClass>();
        #region Accessor
        GroupAreaMemoAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return GroupAreaMemoAccessor.CreateInstance(); }
        }
        #endregion


        public List<GroupAreaMemoClass> GroupAreaMemoList
        {
            get { return _GroupAreaMemoList; }
        }


        public List<GroupAreaMemoClass> GroupAreaMemo()
        {
            _GroupAreaMemoList = Accessor.AllGroupArea();
            return _GroupAreaMemoList;
            //return Accessor.AllGroupArea();
        }
        public List<GroupAreaMemoClass> GroupAreaMemoByAreaNumber(int AreaNo)
        {
            _GroupAreaMemoList = Accessor.GroupAreaMemoByAreaNo(AreaNo);
            return _GroupAreaMemoList;
            //return Accessor.AllGroupArea();
        }
        public List<GroupAreaMemoClass> GroupAreaMemoByAllAreas()
        {
            _GroupAreaMemoList = Accessor.GroupAreaMemoByAllAreas();
            return _GroupAreaMemoList;
        }
        public List<GroupAreaMemoClass> GroupAreaMemoByAllProvinces()
        {
            _GroupAreaMemoList = Accessor.GroupAreaMemoByAllProvinces();
            return _GroupAreaMemoList;
        }

        public GroupAreaMemoClass GroupAreaMemoByAreaNo(int AreaNo)
        {
            return Accessor.GroupAreaMemoByAreaNo(AreaNo)[0];
        }

        public GroupAreaMemoClass GetAreaGroupMemoByKey(int id)
        {
            return Accessor.Query.SelectByKey<GroupAreaMemoClass>(id) ?? new GroupAreaMemoClass();
        }

        public GroupAreaMemoClass GetGroupName(int GroupNo)
        {
            return Accessor.GetGroupName(GroupNo) ?? new GroupAreaMemoClass();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<GroupAreaMemoClass> AreaGroups()
        {
            if (Accessor.Query.SelectAll<GroupAreaMemoClass>().Count > 0)
                _GroupAreaMemoList = Accessor.Query.SelectAll<GroupAreaMemoClass>();

            return Accessor.Query.SelectAll<GroupAreaMemoClass>();
        }


        public void Save(GroupAreaMemoClass GroupAreaClass)
        {
            using (DbManager db = new DbManager())
            {
                if (GroupAreaClass.AreaGroupNo != 0)
                {
                    Accessor.Query.Update(db, GroupAreaClass);
                }
                else
                {
                    Accessor.Query.Insert(db, GroupAreaClass);
                }
            }
        }


        public void Delete(GroupAreaMemoClass GroupAreaClass)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, GroupAreaClass);
            }
        }


        public void LoadAreaMemoGroups(SqlDataSource AreaGroupDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT [AGNo], [GroupName], FROM [GrpAreaMemo] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE GroupName LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY [AGNo] DESC";
            AreaGroupDataSource.SelectCommand = CommandText;
            AreaGroupDataSource.DataBind();
        }

    }
}

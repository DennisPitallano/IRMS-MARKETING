using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class SizeGroupManager:LogManager<SizeGroup>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        SizeGroupAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return SizeGroupAccessor.CreateInstance();
            }
        }

        #endregion
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public SizeGroup GetSizeByKey(long id)
        {
            return Accessor.Query.SelectByKey<SizeGroup>(id) ?? new SizeGroup();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<SizeGroup> SizeGroups()
        {
            return Accessor.Query.SelectAll<SizeGroup>();
        }

      
        /// <summary>
        /// 
        /// </summary>
        /// <param name="size_group"></param>
        public void Save(SizeGroup size_group)
        {
            using (DbManager db = new DbManager())
            {
                if (size_group.RecordNumber != 0)
                {
                    Accessor.Query.Update(db, size_group);
                }
                else
                {
                  Identity=Accessor.Query.InsertAndGetIdentity(db, size_group);
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="size_group"></param>
        public void Delete(SizeGroup size_group)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, size_group);
            }
        }

        public void Delete(int SizeGroupId)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.DeleteByKey<SizeGroup>(SizeGroupId);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public List<SizeGroup> SearchSizeGroup(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "SIZE_CODE";
            columns[1] = "SIZE_DESCRIPTION";
            return Accessor.Query.SelectByKeyWords<SizeGroup>(search_parameter, columns);
        }
    }
}

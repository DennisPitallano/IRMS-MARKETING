using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.ObjectModel;
using BLToolkit;
using BLToolkit.Data;
using IRMS.BusinessLogic.DataAccess;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Size Data Accessor Manager Class
    /// </summary>
    public class SizeManager:LogManager<Size>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        SizeAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return SizeAccessor.CreateInstance();
            }
        }

        #endregion
        /// <summary>
        /// Get Size By Key
        /// </summary>
        /// <param name="id">Primary Key</param>
        /// <returns></returns>
        public Size GetSizeByKey(long id)
        {
            return Accessor.Query.SelectByKey<Size>(id) ?? new Size();
        }
        /// <summary>
        /// Fetch All Sizes
        /// </summary>
        /// <returns>All Sizes</returns>
        public List<Size> Sizes()
        {
            return Accessor.Query.SelectAll<Size>();
        }

        /// <summary>
        /// Fetch All Sizes by Size Group
        /// </summary>
        /// <param name="groups">Collection of Size Group</param>
        /// <returns>All Sizes By Group</returns>
        public List<Size> SizesByGroup(List<int> groups)
        {
            try
            {
                var newList = new List<Size>();
                string Command = string.Empty;
                int iterator = 0;
                Command = "SELECT * FROM SIZES WHERE ";
                foreach (int i in groups)
                {
                    iterator++;
                    Command += " SIZE_GROUP =" + i + " ";
                    if (iterator < groups.Count)
                    {
                        Command += " OR";
                    }
                }
                Command += " ORDER BY SIZE_GROUP,DISPLAY_INDEX ASC";
                using (DbManager db = new DbManager())
                {
                    db.Command.CommandText = Command;
                    newList = db.ExecuteList<Size>();
                }

                return newList;
            }
            catch (Exception)
            {
                return new List<Size>();
            }
        }

        /// <summary>
        /// Fetch Size By SizeCode
        /// </summary>
        /// <param name="Code">Size Code</param>
        /// <returns>Size</returns>
        public Size GetSizeByCode(string Code)
        {
            var results = (from _size in Sizes()
                          where _size.SizeCode == Code
                          select _size).FirstOrDefault();
           
            return results;
        }

        /// <summary>
        /// Insert or Update Size into Sizes Table
        /// </summary>
        /// <param name="size">Size Object</param>
        public void Save(Size size)
        {
            using (DbManager db = new DbManager())
            {
                if (size.RecordNo != 0)
                {
                    Accessor.Query.Update(db, size); 
                }
                else
                {
                   Identity =Accessor.Query.InsertAndGetIdentity(db, size); 
                }
            }
        }

        /// <summary>
        /// Delete Size From Sizes Table
        /// </summary>
        /// <param name="size">Size</param>
        public void Delete(Size size)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, size);
            }
        }

        /// <summary>
        /// Search Size From Sizes Table By Criteria
        /// </summary>
        /// <param name="search_parameter">Criteria</param>
        /// <returns>List of Sizes</returns>
        public List<Size> SearchSizes(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "SIZE_CODE";
            columns[1] = "SIZE_DESCRIPTION";
            return Accessor.Query.SelectByKeyWords<Size>(search_parameter, columns);
        }

        /// <summary>
        /// Get Last DisplayIndex in SizeGroup Collection.
        /// </summary>
        /// <param name="size_group">Size Group</param>
        /// <returns>Last Display Index</returns>
        public int GetSizeLastDisplayIndexInGroup(long size_group)
        {
            int DisplayIndex = 0;
            var result = 0;
            try
            {
                result = (from size in Sizes()
                              where size.SizeGroup == size_group
                              select size.DisplayIndex).Max();
                if (result > 0)
                {
                    DisplayIndex = result + 1;
                }
                else
                {
                    DisplayIndex = 1;
                }
            }
            catch (Exception)
            {
                DisplayIndex = 1;
              //  throw;
            }
            
            return DisplayIndex;
        }

        /// <summary>
        /// Get First DisplayIndex in SizeGroup Collection.
        /// </summary>
        /// <param name="size_group">Size Group</param>
        /// <returns>First Display Index</returns>
        public int GetSizeFirstDisplayIndexInGroup(long size_group)
        {
            int DisplayIndex = 0;
            var result = (from size in Sizes()
                          where size.SizeGroup == size_group
                          select size.DisplayIndex).Min();
            if (result > 0)
            {
                DisplayIndex = result;
            }
            else
            {
                DisplayIndex = 1;
            }
            return DisplayIndex;
        }

        /// <summary>
        /// Set Display Index for new Size to be added.
        /// </summary>
        /// <param name="size_group"></param>
        /// <returns></returns>
        public int SetSizeDisplayIndex(long size_group)
        {
            int DisplayIndex=GetSizeLastDisplayIndexInGroup(size_group);
            
            return DisplayIndex;
        }

        /// <summary>
        /// Update Sizes display Indexes.
        /// </summary>
        /// <param name="SizeGroup">Size Group</param>
        /// <param name="DisplayIndex">Optional Display Index</param>
        /// <param name="DeleteUpdate">Update Mode</param>
        public void UpdateSizesDisplayIndex(long SizeGroup, int DisplayIndex=0,bool DeleteUpdate= false)
        {
            if (DisplayIndex != 0)
            {
                    SaveSizesForInsertBefore(SizeGroup, DisplayIndex,DeleteUpdate);
            }
            else
            {
                SaveSizesForInsertBeginning(SizeGroup);
            }
           
        }

        /// <summary>
        /// save and Update Sizes fter Insert to Beginning.
        /// </summary>
        /// <param name="SizeGroup">Size Group</param>
        private void SaveSizesForInsertBeginning(long SizeGroup)
        {
            var sizes_to_be_update = (from size_ in Sizes()
                                      where size_.SizeGroup == SizeGroup
                                      select size_).OrderBy(e => e.DisplayIndex).ToList();
            foreach (Size size in sizes_to_be_update)
            {
                size.DisplayIndex += 1;
                Save(size);
            }
        }

        private void SaveSizesForInsertBefore(long SizeGroup, int DisplayIndex,bool IsDelete = false)
        {
            var sizes_to_be_update = (from size_ in Sizes()
                                      where size_.SizeGroup == SizeGroup && size_.DisplayIndex >= DisplayIndex
                                      select size_).OrderBy(e => e.DisplayIndex).ToList();
            foreach (Size size in sizes_to_be_update)
            {
                if (IsDelete != false)
                {
                    size.DisplayIndex -= 1;
                }
                else
                {
                  size.DisplayIndex += 1;
                }
                
                Save(size);
            }
        }


        /// <summary>
        /// Get Size Display Index.
        /// </summary>
        /// <param name="SizeKey">Size Key</param>
        /// <returns>Size Display Index</returns>
        public int GetSizeDisplayIndex(long SizeKey)
        {
            int DisplayIndex = 0;
            var result = (from size in Sizes()
                         where size.RecordNo == SizeKey
                          select size.DisplayIndex).FirstOrDefault();
            DisplayIndex = result;
            return DisplayIndex;
        }

        public Size GetSizeByDisplayIndex(long SizeGroup, int DisplayIndex)
        {
            var result =(from size in Sizes()
                         where size.SizeGroup == SizeGroup && size.DisplayIndex == DisplayIndex
                         select size).FirstOrDefault();
            return result;
        }

        #region filter_queries
        /// <summary>
        /// Filter Sizes By Search Parameter
        /// Needed for Sizes Search function
        /// </summary>
        /// <param name="SizesDataSource">Size DataSource</param>
        /// <param name="search_parameter">Search Parameter</param>
        public void LoadSizes(SqlDataSource SizesDataSource, string search_parameter="")
        {
            string CommandText = "SELECT SIZES.RECORD_NO, SIZES.SIZE_CODE, SIZES.SIZE_DESCRIPTION, SIZES.DATE_RECORDED, SIZE_GROUP.SIZE_GROUP,[DISPLAY_INDEX],                        SIZES.[SIZE_GROUP] AS SIZE_GROUP_ID FROM SIZES INNER JOIN SIZE_GROUP ON SIZES.SIZE_GROUP = SIZE_GROUP.RECORD_NO ";
            if (search_parameter != "")
            {
                CommandText += " WHERE SIZE_CODE LIKE '%" + search_parameter + "%' OR SIZE_DESCRIPTION LIKE '%" + search_parameter + "%' ORDER BY SIZES.SIZE_GROUP,SIZES.DISPLAY_INDEX ASC";
            }
            SizesDataSource.SelectCommand = CommandText;
            SizesDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            SizesDataSource.DataBind();
        }
        #endregion
    }
}

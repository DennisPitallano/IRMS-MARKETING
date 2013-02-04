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
    public class PriceGroupManager:LogManager<PriceGroup>
    {
        #region PriceGroupAccessor
        PriceGroupAccessor PriceGrpAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return PriceGroupAccessor.CreateInstance(); }
        }
        #endregion

        public List<PriceGroup> PriceGroupRegular()
        {
            return PriceGrpAccessor.AllPriceGroup();
        }
        public List<PriceGroup> PriceGroupMarkdown()
        {
            return PriceGrpAccessor.AllPriceGroup();
        }


        public PriceGroup GetPriceGroupByKey(int id)
        {
            return PriceGrpAccessor.Query.SelectByKey<PriceGroup>(id) ?? new PriceGroup();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<PriceGroup> PriceGroups()
        {
            return PriceGrpAccessor.Query.SelectAll<PriceGroup>();
        }

        
        public void Save(PriceGroup PriceGroup)
        {
            using (DbManager db = new DbManager())
            {
                if (PriceGroup.PGNo != 0)
                {
                    PriceGrpAccessor.Query.Update(db, PriceGroup);
                }
                else
                {
                 Identity=PriceGrpAccessor.Query.InsertAndGetIdentity(db, PriceGroup);
                }
            }
        }

        
        public void Delete(PriceGroup PriceGroup)
        {
            using (DbManager db = new DbManager())
            {
                PriceGrpAccessor.Query.Delete(db, PriceGroup);
            }
        }


        public void LoadPriceGroups(SqlDataSource PriceGroupDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT [PGNo], [GroupName], [GroupField], [PriceID], [ynConcession], [ynOutright] FROM [GrpPrice] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE GroupName LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY [PGNo] DESC";
            PriceGroupDataSource.SelectCommand = CommandText;
            PriceGroupDataSource.DataBind();
        }

        public List<PriceGroup> PriceGroupConcession()
        {
            return PriceGrpAccessor.GetPriceGroupByConcession();
        }

        public float AddValueToRegularPrice(int PriceGroupNo)
        {
            float fResult = 0;
            string sQuery = string.Format("select * from GrpPriceAddValue where PGno = {0}", PriceGroupNo);
            DbManager db = PriceGrpAccessor.GetDbManager();
            db.SelectCommand.CommandText = sQuery;
            using (System.Data.IDataReader idReader = db.ExecuteReader())
            {
                if (idReader.Read() == true)
                {
                    fResult = (float)Convert.ToDecimal(idReader.GetValue(idReader.GetOrdinal("ADD_TOPRICE_VALUE")));
                }
                idReader.Close();
            }
            return fResult;
        }
    }
}

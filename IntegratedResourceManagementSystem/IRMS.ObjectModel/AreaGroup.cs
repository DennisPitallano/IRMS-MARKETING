using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("GRPAREA")]
    public class GroupAreaClass
    {
        [MapField("AGNo"), PrimaryKey,NonUpdatable]
        public int AreaGroupNo { get; set; }

        [MapField("GROUPNAME")]
        public string GroupName { get; set; }
    }

    [TableName("GRPSUBAREA")]
    public class SubGroupAreaClass
    {
        [MapField("SAGNo"),PrimaryKey,NonUpdatable ]
        public int SubAreaGroupNo { get; set; }

        [MapField("GROUPNAME")]
        public string GroupName { get; set; }

        [MapField("AGNo")]
        public int AreaGroupNo { get; set; }
    }

    [TableName("GRPAREAMEMO")]
    public class GroupAreaMemoClass
    {
        [MapField("AGNo"), PrimaryKey, NonUpdatable]
        public int AreaGroupNo { get; set; }

        [MapField("GROUPNAME")]
        public string GroupName { get; set; }

        [MapField("MEMOCODE")]
        public string MemoCode { get; set; }

        [MapField("GrpNo")]
        public int GroupNo { get; set; }
    }
}
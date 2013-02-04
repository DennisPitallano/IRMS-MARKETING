using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using BLToolkit.Mapping;
using BLToolkit.Common;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Size Class Model
    /// </summary>
    [TableName("Sizes")]
    public class Size 
    {
        /// <summary>
        /// Size Primary Key
        /// </summary>
        [MapField("RECORD_NO"), PrimaryKey , NonUpdatable]
        public long RecordNo { get; set; }
      
        /// <summary>
        /// Size Code
        /// </summary>
        [MapField("SIZE_CODE")]
        public string SizeCode { get; set; }

        /// <summary>
        /// Size Description
        /// </summary>
        [MapField("SIZE_DESCRIPTION")]
        public string SizeDescription { get; set; }

        /// <summary>
        /// Date Created or Recorded
        /// </summary>
        [MapField("DATE_RECORDED")]
        public DateTime DateCreated { get; set; }

        /// <summary>
        /// Size Active Status
        /// </summary>
        [MapField("IS_ACTIVE")]
        public string IsActive { get; set; }

        /// <summary>
        /// Size Group
        /// </summary>
        [MapField("SIZE_GROUP")]
        public long SizeGroup { get; set; }

        [MapField("DISPLAY_INDEX")]
        public int DisplayIndex { get; set; }
    }
}

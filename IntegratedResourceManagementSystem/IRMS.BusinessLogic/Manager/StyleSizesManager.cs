using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class StyleSizesManager
    {
         #region Accessor
        /// <summary>
        /// Initialize Style Accessor
        /// </summary>
        StyleSizesAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return StyleSizesAccessor.CreateInstance();
            }
        }

        #endregion

        /// <summary>
        /// Save Style Sizes.
        /// </summary>
        /// <param name="Style"></param>                  
        /// <param name="Colors"></param>
        public void Save(ItemStyle Style, List<Size> Sizes)
        {
            using (DbManager db = new DbManager())
            {
                foreach (Size size in Sizes)
                {
                    var style_size = new StyleSize{
                        SizeCode = size.SizeCode,
                        StyleNumber = Style.StyleNumber,
                        DateCreated = DateTime.Now
                    };
                    Accessor.Query.Insert(db, style_size);
                }
            }
        }

        public List<StyleSize> StyleSizes()
        {
            return Accessor.Query.SelectAll<StyleSize>();
        }

        public List<StyleSize> GetStyleSizesByStyleNumber(string StyleNumber)
        {
            var results = (from style_size in StyleSizes()
                           where style_size.StyleNumber == StyleNumber
                           select style_size).ToList<StyleSize>();
            return results;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class StyleColorsManager
    {
        #region Accessor
        /// <summary>
        /// Initialize Style Accessor
        /// </summary>
        StyleColorsAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return StyleColorsAccessor.CreateInstance();
            }
        }

        #endregion

        /// <summary>
        /// Save Style Colors.
        /// </summary>
        /// <param name="Style"></param>                  
        /// <param name="Colors"></param>
        public void Save(ItemStyle Style, List<Color> Colors)
        {
            using (DbManager db = new DbManager())
            {
                foreach (Color color in Colors)
                {
                    var style_color = new StyleColor{
                        ColorCode = color.ColorCode,
                        StyleNumber = Style.StyleNumber,
                        DateCreated = DateTime.Now,
                    };
                    Accessor.Query.Insert(db, style_color);
                }
            }
        }

        public List<StyleColor> StyleColors()
        {
            return   Accessor.Query.SelectAll<StyleColor>();
        }
      
        public List <StyleColor> GetStyleColorsByStyleNumber(string StyleNumber)
        {
            var results = (from style_color in StyleColors()
                          where style_color.StyleNumber == StyleNumber
                          select style_color).ToList<StyleColor>();
            return results;
        }
    }
}

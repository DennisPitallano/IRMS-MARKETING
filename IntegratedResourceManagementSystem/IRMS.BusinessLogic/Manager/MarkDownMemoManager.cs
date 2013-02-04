using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.Entities;

namespace IRMS.BusinessLogic.Manager
{
    public class MarkDownMemoManager
    {
        #region Accessor
        /// <summary>
        /// Create Instance of Accessor
        /// </summary>
        MarkDownMemoAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return MarkDownMemoAccessor.CreateInstance(); }
        }
        #endregion

        /// <summary>
        /// Get MarkDown Memo By Record Number
        /// </summary>
        /// <param name="RecordNumber">Record or Identity Number</param>
        /// <returns>Mark Down Memo</returns>
        public MarkDownMemo GetMarkDownMemo(int RecordNumber)
        {
            return Accessor.GetMarkDownMemoByIdNumber(RecordNumber);
        }

        /// <summary>
        /// Delete List of MarkDownMemo
        /// </summary>
        /// <param name="mark_down_memos">List Of MarkDown Memo</param>
        public void Delete(List<MarkDownMemo> mark_down_memos)
        {
            foreach (MarkDownMemo mark_down_memo in mark_down_memos)
            {
                Delete(mark_down_memo);
            }
        }

        /// <summary>
        /// Delete Mark Down Memo Individually
        /// </summary>
        /// <param name="mark_down_memo">Mark Down Memo</param>
        private void Delete(MarkDownMemo mark_down_memo)
        {
            Accessor.Query.Delete(mark_down_memo);
        }
    }
}

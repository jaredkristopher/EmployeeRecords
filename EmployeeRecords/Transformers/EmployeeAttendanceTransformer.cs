using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class EmployeeAttendanceTransformer : Transformer<EmployeeAttendanceInfo>
    {
        protected override EmployeeAttendanceInfo Parse()
        {
            return new EmployeeAttendanceInfo
            {
                ID = ToInt(ID),
                EmployeeID = ToInt(EmployeeID),
                LoggedStatusID = ToInt(LoggedStatusID),
                LogStatus = LogStatus.ToString(),
                Time = Time.ToString(),
                Date = Date.ToString(),
                Meridian = Meridian.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeID { get; set; }
        private object LoggedStatusID { get; set; }
        private object LogStatus { get; set; }
        private object Time { get; set; }
        private object Date { get; set; }
        private object Meridian { get; set; }
        #endregion
    }
}
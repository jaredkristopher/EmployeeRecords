using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class LoggedStatusTransformer : Transformer<LoggedStatusInfo>
    {
        protected override LoggedStatusInfo Parse()
        {
            return new LoggedStatusInfo
            {
                ID = ToInt(ID),
                LogStatus = LogStatus.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object LogStatus { get; set; }
        #endregion
    }
}
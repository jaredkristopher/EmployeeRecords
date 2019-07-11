using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class EmployeeStatusTransformer : Transformer<EmployeeStatusInfo>
    {
        protected override EmployeeStatusInfo Parse()
        {
            return new EmployeeStatusInfo
            {
                ID = ToInt(ID),
                EmployeeStatus = EmployeeStatus.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeStatus { get; set; }
        #endregion
    }
}
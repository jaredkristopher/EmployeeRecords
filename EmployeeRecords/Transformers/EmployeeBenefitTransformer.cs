using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class EmployeeBenefitTransformer : Transformer<EmployeeBenefitInfo>
    {
        protected override EmployeeBenefitInfo Parse()
        {
            return new EmployeeBenefitInfo
            {
                ID = ToInt(ID),
                EmployeeID = ToInt(EmployeeID),
                BenefitID = ToInt(BenefitID),
                Benefit = Benefit.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeID { get; set; }
        private object BenefitID { get; set; }
        private object Benefit { get; set; }
        #endregion
    }
}
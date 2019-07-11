using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class EmployeeRequirementTransformer : Transformer<EmployeeRequirementInfo>
    {
        protected override EmployeeRequirementInfo Parse()
        {
            return new EmployeeRequirementInfo
            {
                ID = ToInt(ID),
                EmployeeID = ToInt(EmployeeID),
                RequirementID = ToInt(RequirementID),
                Requirement = Requirement.ToString(),
                RequirementPath = RequirementPath.ToString(),
                Note = Note.ToString(),
                Status = ToInt(Status)
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeID { get; set; }
        private object RequirementID { get; set; }
        private object Requirement { get; set; }
        private object RequirementPath { get; set; }
        private object Note { get; set; }
        private object Status { get; set; }
        #endregion
    }
}
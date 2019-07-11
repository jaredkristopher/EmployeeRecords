using EmployeeRecords.Info;
using System;

namespace EmployeeRecords.Transformers
{
    public class EmployeeJobExperienceTransformer : Transformer<EmployeeJobExperienceInfo>
    {
        protected override EmployeeJobExperienceInfo Parse()
        {
            return new EmployeeJobExperienceInfo
            {
                ID = ToInt(ID),
                EmployeeID = ToInt(EmployeeID),
                CompanyName = CompanyName.ToString(),
                YearStarted = YearStarted.ToString(),
                YearEnded = YearEnded.ToString(),
                JobPosition = JobPosition.ToString(),
                Status = ToInt(Status),
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeID { get; set; }
        private object CompanyName { get; set; }
        private object YearStarted { get; set; }
        private object YearEnded { get; set; }
        private object JobPosition { get; set; }
        private object Status { get; set; }
        #endregion
    }
}
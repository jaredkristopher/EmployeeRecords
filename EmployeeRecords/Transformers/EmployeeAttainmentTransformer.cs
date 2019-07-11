using System;
using EmployeeRecords.Info;


namespace EmployeeRecords.Transformers
{
    public class EmployeeAttainmentTransformer : Transformer<EmployeeAttainmentInfo>
    {
        protected override EmployeeAttainmentInfo Parse()
        {
            return new EmployeeAttainmentInfo
            {
                ID = ToInt(ID),
                EmployeeID = ToInt(ID),
                AttainmentID = ToInt(ID),
                YearAttended = YearAttended.ToString(),
                YearEnded = YearEnded.ToString(),
                Status = ToInt(Status),
                School = School.ToString(),
                Attainment = Attainment.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeID { get; set; }
        private object AttainmentID { get; set; }
        private object YearAttended { get; set; }
        private object YearEnded { get; set; }
        private object Status { get; set; }
        private object School { get; set; }
        private object Attainment { get; set; }
        #endregion
    }
}
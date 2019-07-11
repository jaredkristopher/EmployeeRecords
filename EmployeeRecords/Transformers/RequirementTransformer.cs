using EmployeeRecords.Info;

namespace EmployeeRecords.Transformers
{
    public class RequirementTransformer : Transformer<RequirementInfo>
    {
        protected override RequirementInfo Parse()
        {
            return new RequirementInfo
            {
                ID = ToInt(ID),
                Requirement = Requirement.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object Requirement { get; set; }
        #endregion
    }
}
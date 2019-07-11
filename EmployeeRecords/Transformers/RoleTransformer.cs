using EmployeeRecords.Info;

namespace EmployeeRecords.Transformers
{
    public class RoleTransformer : Transformer<RoleInfo>
    {
        protected override RoleInfo Parse()
        {
            return new RoleInfo
            {
                ID = ToInt(ID),
                RoleStatus = RoleStatus.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object RoleStatus { get; set; }
        #endregion
    }
}
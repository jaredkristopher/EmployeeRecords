using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class RoleServices
    {
        #region Constructors and Destructors
        public RoleServices()
        {
            _transformer = new RoleTransformer();
        }
        #endregion

        #region Private Properties

        private readonly RoleTransformer _transformer;
        #endregion
    }
}
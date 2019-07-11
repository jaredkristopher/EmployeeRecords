using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class EmployeeStatusServices
    {
        #region Constructors and Destructors
        public EmployeeStatusServices()
        {
            _transformer = new EmployeeStatusTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeStatusTransformer _transformer;
        #endregion
    }
}
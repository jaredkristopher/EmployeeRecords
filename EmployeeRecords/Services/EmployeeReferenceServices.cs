using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class EmployeeReferenceServices
    {
        #region Constructors and Destructors
        public EmployeeReferenceServices()
        {
            _transformer = new EmployeeReferenceTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeReferenceTransformer _transformer;
        #endregion
    }
}

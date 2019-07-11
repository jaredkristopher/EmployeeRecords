using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class LoggedStatusServices
    {
        #region Constructors and Destructors
        public LoggedStatusServices()
        {
            _transformer = new LoggedStatusTransformer();
        }
        #endregion

        #region Private Properties

        private readonly LoggedStatusTransformer _transformer;
        #endregion
    }
}
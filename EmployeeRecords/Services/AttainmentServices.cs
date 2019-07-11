using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class AttainmentServices
    {
        #region Constructors and Destructors
        public AttainmentServices()
        {
            _transformer = new AttainmentTransformer();
        }
        #endregion

        #region Private Properties

        private readonly AttainmentTransformer _transformer;
        #endregion
    }
}
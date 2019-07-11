using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class EmployeeAttendanceServices 
    {
        #region Constructors and Destructors
        public EmployeeAttendanceServices()
        {
            _transformer = new EmployeeAttendanceTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeAttendanceTransformer _transformer;
        #endregion
    }
}
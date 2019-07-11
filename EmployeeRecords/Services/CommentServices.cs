using EmployeeRecords.Transformers;

namespace EmployeeRecords.Services
{
    public class CommentServices
    {
        #region Constructors and Destructors
        public CommentServices()
        {
            _transformer = new CommentTransformer();
        }
        #endregion

        #region Private Properties

        private readonly CommentTransformer _transformer;
        #endregion
    }
}
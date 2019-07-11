using EmployeeRecords.Info;

namespace EmployeeRecords.Transformers
{
    public class CommentTransformer : Transformer<CommentInfo>
    {
        protected override CommentInfo Parse()
        {
            return new CommentInfo
            {
                ID = ToInt(ID),
                fromEmployeeID = ToInt(fromEmployeeID),
                toEmployeeID = ToInt(toEmployeeID),
                FirstName = FirstName.ToString(),
                MI = MI.ToString(),
                LastName = LastName.ToString(),
                Comment = Comment.ToString(),
                DateCreated = DateCreated.ToString(),
                DateUpdated = DateUpdated.ToString(),
                DatedDeleted = DatedDeleted.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object fromEmployeeID { get; set; }
        private object toEmployeeID { get; set; }
        private object FirstName { get; set; }
        private object MI { get; set; }
        private object LastName { get; set; }
        private object Comment { get; set; }
        private object DateCreated { get; set; }
        private object DateUpdated { get; set; }
        private object DatedDeleted { get; set; }
        #endregion
    }
}
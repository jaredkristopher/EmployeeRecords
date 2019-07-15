using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class EmployeeCommentTransformer : Transformer<EmployeeCommentInfo>
    {
        protected override EmployeeCommentInfo Parse()
        {
            return new EmployeeCommentInfo
            {
                ID = ToInt(ID),
                fromEmployeeID = ToInt(fromEmployeeID),
                toEmployeeID = ToInt(toEmployeeID),
                Comment = Comment.ToString(),
                Status = ToInt(Status),
                DateCreated = DateCreated.ToString(),
                DateUpdated = DateUpdated.ToString(),
                DatedDeleted = DatedDeleted.ToString(),
                FirstName = FirstName.ToString(),
                LastName = LastName.ToString(),
                MI = MI.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object fromEmployeeID { get; set; }
        private object toEmployeeID { get; set; }
        private object Comment { get; set; }
        private object Status { get; set; }
        private object DateCreated { get; set; }
        private object DateUpdated { get; set; }
        private object DatedDeleted { get; set; }
        private object FirstName { get; set; }
        private object LastName { get; set; }
        private object MI { get; set; }
        #endregion
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class CommentModel
    {
        public int ID { get; set; }
        public int fromEmployeeID { get; set; }
        public int toEmployeeID { get; set; }
        public string FirstName { get; set; }
        public string MI { get; set; }
        public string LastName { get; set; }
        public string Comment { get; set; }
        public string DateCreated { get; set; }
        public string DateUpdated { get; set; }
        public string DatedDeleted { get; set; }
    }
}
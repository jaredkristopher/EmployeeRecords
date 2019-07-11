using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeAttainmentModel
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int AttainmentID { get; set; }
        public string YearAttended { get; set; }
        public string YearEnded { get; set; }
        public int Status { get; set; }
        public string School { get; set; }
        public string Attainment { get; set; }
    }
}
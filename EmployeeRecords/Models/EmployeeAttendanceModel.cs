using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeAttendanceModel
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int LoggedStatusID { get; set; }
        public string LogStatus { get; set; }
        public string Time { get; set; }
        public string Date { get; set; }
        public string Meridian { get; set; }
    }
}
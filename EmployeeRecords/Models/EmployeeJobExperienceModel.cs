using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeJobExperienceModel
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public string CompanyName { get; set; }
        public string YearStarted { get; set; }
        public string YearEnded { get; set; }
        public string JobPosition { get; set; }
        public int Status { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeRequirementModel
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int RequirementID { get; set; }
        public string Requirement { get; set; }
        public string RequirementPath { get; set; }
        public string Note { get; set; }
        public int Status { get; set; }
    }
}
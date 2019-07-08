using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeBenefitModel
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int BenefitID { get; set; }
        public string Benefit { get; set; }
    }
}
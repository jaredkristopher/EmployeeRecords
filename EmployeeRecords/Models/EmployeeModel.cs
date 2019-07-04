using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeModel
    {
        public int ID { get; set; }
        public string EmployeeNumber { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MI { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Contact { get; set; }
        public string Address { get; set; }
        public string Birthday { get; set; }
        public string Gender { get; set; }
        public string Religion { get; set; }
        public string Nationality { get; set; }
        public string Birthplace { get; set; }
        public string CivilStatus { get; set; }
        public int EmployeeStatusID { get; set; }
        public string DateHired { get; set; }
        public string DateCreated { get; set; }
        public string DatedUpdated { get; set; }
        public string DatedDeleted { get; set; }
        public int RoleID { get; set; }
        public string RoleStatus { get; set; }
        public string EmployeeStatus { get; set; }
    }
}
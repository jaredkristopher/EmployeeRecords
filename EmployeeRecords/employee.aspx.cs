using System;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using EmployeeRecords.Info;
using System.Collections.Generic;
using EmployeeRecords.Services;

namespace EmployeeRecords
{
    public partial class employee : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<EmployeeInfo> get()
        {
            var service = new EmployeeServices();

            var employees = service.get();

            return employees;
        }

        [WebMethod]
        public static List<EmployeeInfo> find(int id)
        {
            var service = new EmployeeServices();

            var employees = service.find(id);

            return employees;
        }

        //Get Employee Benefits
        [WebMethod]
        public static List<EmployeeRequirementInfo> getEmployeeReq(int id)
        {
            var service = new EmployeeRequirementServices();

            var employees = service.findEmpRequirements(id);

            return employees;
        }

        [WebMethod]
        public static int insert(string lname, string fname, string mname, string contact,
        string email, string password, string address, string birthday, string gender,
        string religion, string nationality, string birthplace, string civilstatus,
        string employeestatus, string role)
        {
            var item = 0;

            item = EmployeeServices.insert(lname, fname, mname, contact,
        email, password, address, birthday, gender,
        religion, nationality, birthplace, civilstatus,
        employeestatus, role);


            return item;
        }


        [WebMethod]
        public static int insertEmployeeRequirements(int employeeID, int requirementID, string requirementPath, string note)
        {
            var item = 0;

            item = EmployeeRequirementServices.insertEmployeeRequirements(employeeID, requirementID, requirementPath, note);


            return item;
        }

        [WebMethod]
        public static int update(int id, string fname, string lname, string mname,
            string contact, string email, string address, string birthday, string gender, string religion, string nationality,
            string birthplace, string civilstatus, int employeestatus, int role)
        {
            var item = 0;

            item = EmployeeServices.update(id, fname, lname, mname, contact, email, address, birthday, gender, religion,
                                            nationality, birthplace, civilstatus, employeestatus, role);

            return item;
        }

        [WebMethod]
        public static int deactivate(int id)
        {
            var item = 0;

            item = EmployeeServices.deactivate(id);

            return item;
        }

        [WebMethod]
        public static int activate(int id)
        {
            var item = 0;

            item = EmployeeServices.activate(id);

            return item;
        }
    }
}
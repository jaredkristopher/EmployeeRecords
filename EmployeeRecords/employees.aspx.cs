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
    public partial class employees : System.Web.UI.Page
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

    }
}
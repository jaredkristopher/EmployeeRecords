using System;
using System.Web.Services;
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

        //
        //Employee Methods
        //


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

        //
        //Employee Requirements Method
        //

        //Get Employee Requirements
        [WebMethod]
        public static List<EmployeeRequirementInfo> getEmployeeReq(int id)
        {
            var service = new EmployeeRequirementServices();

            var requirements = service.getEmpRequirements(id);

            return requirements;
        }

        //Find Employee Requirement
        [WebMethod]
        public static List<EmployeeRequirementInfo> findEmployeeReq(int id)
        {
            var service = new EmployeeRequirementServices();

            var requirement = service.findEmpRequirement(id);

            return requirement;
        }

        //Add Employee Requirements
        [WebMethod]
        public static int insertEmployeeRequirements(int employeeID, int requirementID, string requirementPath, string note)
        {
            var item = 0;

            item = EmployeeRequirementServices.insertEmployeeRequirements(employeeID, requirementID, requirementPath, note);

            return item;
        }

        //Update Employee Requirements
        [WebMethod]
        public static int updateEmpReq(int id, int reqId, string reqPath, string note)
        {
            var item = 0;

            item = EmployeeRequirementServices.updateEmpRequirement(id, reqId, reqPath, note);

            return item;
        }

        //Deactivate Employee Requirement
        [WebMethod]
        public static int deactivateEmpReq(int id)
        {
            var item = 0;

            item = EmployeeRequirementServices.deactivateEmpRequirement(id);

            return item;
        }

        //
        //Requirements Web Method
        //

        //Get Requirements
        [WebMethod]
        public static List<RequirementInfo> getReq()
        {
            var service = new RequirementServices();

            var requirements = service.getRequirements();

            return requirements;
        }

        //
        //Employee Attainments Web Method
        //

        //Get Employee Attainments
        [WebMethod]
        public static List<EmployeeAttainmentInfo> getEmployeeAtt(int id)
        {
            var service = new EmployeeAttainmentServices();

            var attainments = service.getEmpAttainments(id);

            return attainments;
        }


        //Add Employee Attainments
        [WebMethod]
        public static int insertEmployeeAttainments(int employeeID, int attainmentID, string yearAttended, string yearEnded, string school)
        {
            var item = 0;

            item = EmployeeAttainmentServices.insertEmployeeAttainments(employeeID, attainmentID, yearAttended, yearEnded, school);

            return item;
        }

        //Get Employee Experiences
        [WebMethod]
        public static List<EmployeeJobExperienceInfo> getEmployeeJobExp(int id)
        {
            var service = new EmployeeJobExperienceServices();

            var experiences = service.getEmpJobExperiences(id);

            return experiences;
        }

        //Add Employee Experiences
        [WebMethod]
        public static int insertEmployeeJobExperiences(int employeeID, string companyName, string jobPosition, string yearStarted, string yearEnded)
        {
            var item = 0;

            item = EmployeeJobExperienceServices.insertEmployeeJobExperiences(employeeID, companyName, jobPosition, yearStarted, yearEnded);

            return item;
        }


        //Deactivate Employee Experiences
        [WebMethod]
        public static int deactivateEmpExp(int id)
        {
            var item = 0;

            item = EmployeeJobExperienceServices.deactivateEmpExperience(id);

            return item;
        }


    }
}
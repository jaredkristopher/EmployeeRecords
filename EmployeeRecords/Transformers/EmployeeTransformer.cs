using EmployeeRecords.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public class EmployeeTransformer : Transformer<EmployeeInfo>
    {
        protected override EmployeeInfo Parse()
        {
            return new EmployeeInfo
            {
                ID = ToInt(ID),
                EmployeeNumber = EmployeeNumber.ToString(),
                FirstName = FirstName.ToString(),
                LastName = LastName.ToString(),
                MI = MI.ToString(),
                Email = Email.ToString(),
                Password = Password.ToString(),
                Contact = Contact.ToString(),
                Address = Address.ToString(),
                Birthday = Birthday.ToString(),
                Gender = Gender.ToString(),
                Religion = Religion.ToString(),
                Nationality = Nationality.ToString(),
                Birthplace = Birthplace.ToString(),
                CivilStatus = CivilStatus.ToString(),
                EmployeeStatusID = ToInt(EmployeeStatusID),
                DateHired = DateHired.ToString(),
                DateCreated = DateCreated.ToString(),
                DatedUpdated = DatedUpdated.ToString(),
                DatedDeleted = DatedDeleted.ToString(),
                RoleID = ToInt(RoleID),
                EmployeeStatus = EmployeeStatus.ToString(),
                RoleStatus = RoleStatus.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeNumber { get; set; }
        private object FirstName { get; set; }
        private object LastName { get; set; }
        private object MI { get; set; }
        private object Email { get; set; }
        private object Password { get; set; }
        private object Contact { get; set; }
        private object Address { get; set; }
        private object Birthday { get; set; }
        private object Gender { get; set; }
        private object Religion { get; set; }
        private object Nationality { get; set; }
        private object Birthplace { get; set; }
        private object CivilStatus { get; set; }
        private object EmployeeStatusID { get; set; }
        private object DateHired { get; set; }
        private object DateCreated { get; set; }
        private object DatedUpdated { get; set; }
        private object DatedDeleted { get; set; }
        private object RoleID { get; set; }
        private object EmployeeStatus { get; set; }
        private object RoleStatus { get; set; }
        #endregion
    }
}
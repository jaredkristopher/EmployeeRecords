using System;
using EmployeeRecords.Info;

namespace EmployeeRecords.Transformers
{
    public class EmployeeReferenceTransformer : Transformer<EmployeeReferenceInfo>
    {
        protected override EmployeeReferenceInfo Parse()
        {
            return new EmployeeReferenceInfo()
            {
                ID = ToInt(ID),
                EmployeeID = ToInt(EmployeeID),
                Name = Name.ToString(),
                Contact = Contact.ToString(),
                Occupation = Occupation.ToString(),
                Status = ToInt(Status)
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeID { get; set; }
        private object Name { get; set; }
        private object Contact { get; set; }
        private object Occupation { get; set; }
        private object Status { get; set; }
        #endregion
    }
}
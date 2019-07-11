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

            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object EmployeeNumber { get; set; }
        private object Name { get; set; }
        private object Contact { get; set; }
        private object Occupation { get; set; }
        #endregion
    }
}
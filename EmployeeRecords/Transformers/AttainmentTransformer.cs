using EmployeeRecords.Info;


namespace EmployeeRecords.Transformers
{
    public class AttainmentTransformer : Transformer<AttainmentInfo>
    {
        protected override AttainmentInfo Parse()
        {
            return new AttainmentInfo()
            {
                ID = ToInt(ID),
                Attainment = Attainment.ToString()
            };
        }

        #region Private Properties
        private object ID { get; set; }
        private object Attainment { get; set; }
        #endregion
    }
}
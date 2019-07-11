using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class RequirementServices
    {
        #region Constructors and Destructors
        public RequirementServices()
        {
            _transformer = new RequirementTransformer();
        }
        #endregion

        #region Private Properties

        private readonly RequirementTransformer _transformer;
        #endregion

        public List<RequirementInfo> getRequirements()
        {
            var items = new List<RequirementInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetRequirements", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        var reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            var item = _transformer.Transform(reader);
                            items.Add(item);
                        }
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }
            return items;
        }
    }
}
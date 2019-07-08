using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class EmployeeBenefitServices
    {
        #region Constructors and Destructors
        public EmployeeBenefitServices()
        {
            _transformer = new EmployeeBenefitTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeBenefitTransformer _transformer;
        #endregion


        public List<EmployeeBenefitInfo> findEmpBenefits(int id)
        {
            var items = new List<EmployeeBenefitInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetEmpBenefit", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);
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
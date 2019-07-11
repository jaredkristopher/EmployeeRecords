using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class EmployeeAttainmentServices
    {
        #region Constructors and Destructors
        public EmployeeAttainmentServices()
        {
            _transformer = new EmployeeAttainmentTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeAttainmentTransformer _transformer;
        #endregion

        public List<EmployeeAttainmentInfo> getEmpAttainments(int id)
        {
            var items = new List<EmployeeAttainmentInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetEmpAtt", dbconn))
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


        public static int insertEmployeeAttainments(int employeeID, int attainmentID, string yearAttended, string yearEnded, string school)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertEmpAtt", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("empId", employeeID);
                        cmd.Parameters.AddWithValue("attId", attainmentID);
                        cmd.Parameters.AddWithValue("yearattended", yearAttended);
                        cmd.Parameters.AddWithValue("yearended", yearEnded);
                        cmd.Parameters.AddWithValue("school", school);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }
            return item;
        }

    }
}
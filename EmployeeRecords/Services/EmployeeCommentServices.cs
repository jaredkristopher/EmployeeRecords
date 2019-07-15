
using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class EmployeeCommentServices
    {
        #region Constructors and Destructors
        public EmployeeCommentServices()
        {
            _transformer = new EmployeeCommentTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeCommentTransformer _transformer;
        #endregion

        public List<EmployeeCommentInfo> getEmpComment(int id)
        {
            var items = new List<EmployeeCommentInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetComment", dbconn))
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
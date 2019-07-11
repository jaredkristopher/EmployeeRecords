using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class EmployeeRequirementServices
    {
        #region Constructors and Destructors
        public EmployeeRequirementServices()
        {
            _transformer = new EmployeeRequirementTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeRequirementTransformer _transformer;
        #endregion

        public List<EmployeeRequirementInfo> getEmpRequirements(int id)
        {
            var items = new List<EmployeeRequirementInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetEmpReq", dbconn))
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

        public List<EmployeeRequirementInfo> findEmpRequirement(int id)
        {
            var items = new List<EmployeeRequirementInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();

                using (var cmd = new SqlCommand("spFindEmpReq", dbconn))
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

        public static int insertEmployeeRequirements(int employeeID, int requirementID, string requirementPath, string note)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertEmpReq", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("empId", employeeID);
                        cmd.Parameters.AddWithValue("reqId", requirementID);
                        cmd.Parameters.AddWithValue("requirementpath", requirementPath);
                        cmd.Parameters.AddWithValue("note", note);
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

        public static int updateEmpRequirement(int id, int requirementId, string requirementPath, string note)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateEmpReq", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);
                        cmd.Parameters.AddWithValue("reqId", requirementId);
                        cmd.Parameters.AddWithValue("requirementpath", requirementPath);
                        cmd.Parameters.AddWithValue("note", note);

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

        public static int deactivateEmpRequirement(int id)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spDeactivateEmpReqStatus", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);

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
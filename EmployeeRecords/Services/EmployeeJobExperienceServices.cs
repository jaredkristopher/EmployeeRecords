using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Services
{
    public class EmployeeJobExperienceServices
    {
        #region Constructors and Destructors
        public EmployeeJobExperienceServices()
        {
            _transformer = new EmployeeJobExperienceTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeJobExperienceTransformer _transformer; 
        #endregion

        public List<EmployeeJobExperienceInfo> getEmpJobExperiences(int id)
        {
            var items = new List<EmployeeJobExperienceInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetEmpExp", dbconn))
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


        public static int insertEmployeeJobExperiences(int employeeID, string companyName, string jobPosition, string yearStarted, string yearEnded)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                    dbconn.Open();

                using (var cmd = new SqlCommand("spInsertEmpExp", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("empId", employeeID);
                        cmd.Parameters.AddWithValue("compName", companyName);
                        cmd.Parameters.AddWithValue("jobpos", jobPosition);
                        cmd.Parameters.AddWithValue("yearstarted", yearStarted);
                        cmd.Parameters.AddWithValue("yearended", yearEnded);
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

        public List<EmployeeJobExperienceInfo> findEmpJobExperience(int id)
        {
            var items = new List<EmployeeJobExperienceInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();

                using (var cmd = new SqlCommand("spFindEmpExp", dbconn))
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

        public static int updateEmpJobExperiences(int id, string companyName, string jobPosition, string yearStarted, string yearEnded)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateEmpExp", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);
                        cmd.Parameters.AddWithValue("@companyname", companyName);
                        cmd.Parameters.AddWithValue("@jobposition", jobPosition);
                        cmd.Parameters.AddWithValue("@yearstarted", yearStarted);
                        cmd.Parameters.AddWithValue("@yearended", yearEnded);

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

        public static int deactivateEmpExperience(int id)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spDeactivateEmpExpStatus", dbconn))
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

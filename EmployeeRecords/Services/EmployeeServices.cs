using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class EmployeeServices
    {
        #region Constructors and Destructors
        public EmployeeServices()
        {
            _transformer = new EmployeeTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeTransformer _transformer;
        #endregion
        public List<EmployeeInfo> get()
        {
            var items = new List<EmployeeInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();
                using (var cmd = new SqlCommand("spGetEmployees", dbconn))
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

        public List<EmployeeInfo> find(int id)
        {
            var items = new List<EmployeeInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();

                using (var cmd = new SqlCommand("spFindEmployee", dbconn))
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

        public static int insert(string lname, string fname, string mname, string contact,
            string email, string password, string address, string birthday, string gender,
            string religion, string nationality, string birthplace, string civilstatus, 
            string employeestatus, string role)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertEmployee", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("firstname", fname);
                        cmd.Parameters.AddWithValue("lastname", lname);
                        cmd.Parameters.AddWithValue("mi", mname);
                        cmd.Parameters.AddWithValue("email", email);
                        cmd.Parameters.AddWithValue("password", password);
                        cmd.Parameters.AddWithValue("contact", contact);
                        cmd.Parameters.AddWithValue("address", address);
                        cmd.Parameters.AddWithValue("birthday", birthday);
                        cmd.Parameters.AddWithValue("gender", gender);
                        cmd.Parameters.AddWithValue("religion", religion);
                        cmd.Parameters.AddWithValue("nationality", nationality);
                        cmd.Parameters.AddWithValue("birthplace", birthplace);
                        cmd.Parameters.AddWithValue("civilStatus", civilstatus);
                        cmd.Parameters.AddWithValue("empstatus", employeestatus);
                        cmd.Parameters.AddWithValue("role", role);
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

        public static int update(int id, string fname, string lname, string mname,
            string contact, string email, string address, string birthday, string gender, string religion, 
            string nationality, string birthplace, string civilstatus, int employeestatus, int role)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateEmployee", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("empId", id);
                        cmd.Parameters.AddWithValue("firstname", fname);
                        cmd.Parameters.AddWithValue("lastname", lname);
                        cmd.Parameters.AddWithValue("mi", mname);
                        cmd.Parameters.AddWithValue("email", email);
                        cmd.Parameters.AddWithValue("contact", contact);
                        cmd.Parameters.AddWithValue("address", address);
                        cmd.Parameters.AddWithValue("birthday", birthday);
                        cmd.Parameters.AddWithValue("gender", gender);
                        cmd.Parameters.AddWithValue("religion", religion);
                        cmd.Parameters.AddWithValue("nationality", nationality);
                        cmd.Parameters.AddWithValue("birthplace", birthplace);
                        cmd.Parameters.AddWithValue("civilstatus", civilstatus);
                        cmd.Parameters.AddWithValue("empstatus", employeestatus);
                        cmd.Parameters.AddWithValue("role", role);

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

        public static int deactivate(int id)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spDeactivateEmployee", dbconn))
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

        public static int activate(int id)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spActivateEmployee", dbconn))
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
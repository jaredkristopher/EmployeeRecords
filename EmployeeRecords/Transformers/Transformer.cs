using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Transformers
{
    public abstract class Transformer<T>
    {
        public T Transform(SqlDataReader reader)
        {
            MapData(reader);

            return Parse();
        }

        protected abstract T Parse();

        protected void MapData(SqlDataReader reader)
        {
            var properties = GetType().GetFields(System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

            char[] lessThanSeparator = { '<' };
            char[] greaterThanSeparator = { '>' };

            foreach (var property in properties)
            {
                var propertyName = property.Name;

                if (property.Name.Contains("<") || property.Name.Contains(">"))
                    propertyName = property.Name.Split(lessThanSeparator)[1].Split(greaterThanSeparator)[0];

                property.SetValue(this, reader[propertyName]);
            }
        }

        #region Conversion Helpers

        protected int ToInt(object value)
        {
            try
            {
                return Convert.ToInt32(value);
            }
            catch (Exception)
            {
                return 0;
            }
        }

        protected double ToDouble(object value)
        {
            return Convert.ToDouble(value);
        }

        protected DateTime ToDateTime(object value)
        {
            return Convert.ToDateTime(value);
        }

        protected bool ToBoolean(object value)
        {
            return Convert.ToBoolean(value);
        }

        #endregion
    }
}
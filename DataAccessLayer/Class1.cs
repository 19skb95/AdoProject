using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer
{
    public class DataAccessClass
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommandBuilder l;
        DataSet ds = new DataSet();
        SqlConnection GetConnection()
        {
            return (new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString));
        }

        public DataTable SudentList()
        {
            FillDataSet();
            DataTable dt = ds.Tables[0];
            int a = dt.Rows.Count;
            return dt;

        }
        void FillDataSet()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            da = new SqlDataAdapter("select * from tbl_Student", con);
            da.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            l = new SqlCommandBuilder(da);
            da.Fill(ds);
        }
        public int InsertStudent(BusinessEntityLayer.BusinessEntityClass obj)
        {
            FillDataSet();
            DataRow dr = ds.Tables[0].NewRow();

            dr["Student_Name"] = obj.Name;
            dr["Student_address"] = obj.Address;
            dr["Student_Gender"] = obj.Gender;
            dr["Student_ph"] = obj.PhNumber;
            dr["DateofEnroll"] = obj.date;
            ds.Tables[0].Rows.Add(dr);
            return (da.Update(ds));
        }

        public int UpdateStudent(BusinessEntityLayer.BusinessEntityClass obj)
        {
            FillDataSet();
            DataRow dr = ds.Tables[0].Rows.Find(obj.id);
            dr["Student_Name"] = obj.Name;
            dr["Student_address"] = obj.Address;
            dr["Student_Gender"] = obj.Gender;
            dr["Student_ph"] = obj.PhNumber;
            dr["DateofEnroll"] = obj.date;
            return(da.Update(ds));
        }
        public int DeleteStudent(int id)
        {
            FillDataSet();
            ds.Tables[0].Rows.Find(id).Delete();
            return(da.Update(ds));

        }
    }

}

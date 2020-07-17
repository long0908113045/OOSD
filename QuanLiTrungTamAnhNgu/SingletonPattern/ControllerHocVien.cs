using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.SingletonPattern
{
    class ControllerHocVien
    {

        My_DB mydb = My_DB.getMy_DB;
        public DataTable getListHocVien()
        {
            SqlCommand command = new SqlCommand("select * from fn_ListHocVien()", mydb.getConnection);
            command.CommandType = CommandType.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }

        public DataTable searchHocVien(string ten)
        {

            SqlCommand command = new SqlCommand("sp_TimHocVienTheoTen", mydb.getConnection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = ten.ToUpper();      
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }
    }
}


using QuanLiTrungTamAnhNgu.BuilderPattern;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace QuanLiTrungTamAnhNgu.SingletonPattern
{
    public class ControllerNhanVien
    {
        My_DB mydb = new My_DB();
        public DataTable getNhanVien()
        {
            SqlCommand command = new SqlCommand("select * from fn_ListNhanVien()", mydb.getConnection);
            command.CommandType = CommandType.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }

        public DataTable searchNhanVien(string ten, string chucvu) {

            SqlCommand command = new SqlCommand("sp_TimNhanVienTheoTen", mydb.getConnection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = ten;
            command.Parameters.Add("@chucvu", SqlDbType.NVarChar).Value = chucvu;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }



        
    }
}

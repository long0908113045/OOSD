
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.SingletonPattern
{
    public class ControllerGiaoVien
    {
        My_DB mydb = new My_DB();

        public DataTable showLopTheoGiaoVien(int idgv) {

            SqlCommand command = new SqlCommand("select * from fn_TimLopTheoGiaoVien(@idgv)", mydb.getConnection);
            command.CommandType = CommandType.Text;
            command.Parameters.Add("@idgv", SqlDbType.Int).Value = idgv;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;

        }

        public DataTable showHocVien(int idlh)
        {

            SqlCommand command = new SqlCommand("select * from fn_ListHocVienCuaLopHoc(@idlh)", mydb.getConnection);
            command.CommandType = CommandType.Text;
            command.Parameters.Add("@idlh", SqlDbType.NVarChar).Value = idlh;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }
        
    }
}

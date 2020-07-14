﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.SingletonPattern
{
    class ControllerLopHoc
    {
        My_DB mydb = new My_DB();
        public DataTable getListHocVienCuaLop(int idlh)
        {
            SqlCommand command = new SqlCommand("select * from fn_ListHocVienCuaLopHoc(@idlh)", mydb.getConnection);
            command.CommandType = CommandType.Text;
            command.Parameters.Add("@idlh", SqlDbType.Int).Value = idlh;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }

        public DataTable getListLopHoc()
        {
            SqlCommand command = new SqlCommand("select * from fn_ListLopHoc()", mydb.getConnection);
            command.CommandType = CommandType.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable table = new DataTable();
            adapter.Fill(table);
            return table;
        }
    }
}
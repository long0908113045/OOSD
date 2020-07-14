using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace QuanLiTrungTamAnhNgu.SingletonPattern
{
    class My_DB
    {
        SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=EnglishCenter;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        public SqlConnection getConnection
        {
            get
            {
                return con;
            }

        }
        public void openConnection()
        {
            if ((con.State == ConnectionState.Closed))
            {
                con.Open();
            }
        }
        public void closeConnection()
        {
            if ((con.State == ConnectionState.Open))
            {
                con.Close();
            }
        }
    }
}

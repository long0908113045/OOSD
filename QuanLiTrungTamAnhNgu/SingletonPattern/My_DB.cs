using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DevExpress.CodeParser;

namespace QuanLiTrungTamAnhNgu.SingletonPattern
{
    class My_DB
    {

        private static My_DB instance = new My_DB();

        protected My_DB()
        {
           
        }

        public static My_DB getMy_DB
        {
            get
            {
                if(instance == null)
                {
                    instance = new My_DB();
                    
                }
                return instance;
            }
        }

        private SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=EnglishCenter;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");


        public SqlConnection getConnection
        {
            get
            {
                return con;
            }
        }

        public void openConnection()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
        public void closeConnection()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

       
    }
}

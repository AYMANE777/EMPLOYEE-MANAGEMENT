using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SECOND_LAST.Classes
{
    public class Connection
    {
        public Connection() { }



        RADEETA_Entities entity = new RADEETA_Entities();


        SqlConnection cnx = new SqlConnection(ConfigurationManager.ConnectionStrings["RADEETA_DATABASEConnectionString"].ConnectionString);
        SqlCommand cmd;
        DataTable dt =new DataTable("info");
        SqlDataAdapter sda;


        public void Connecter()
        {
            if(cnx.State==ConnectionState.Closed || cnx.State == ConnectionState.Broken)
            {
                cnx.Open();
            }
        }
        public void deconnecter()
        {
            if (cnx.State == ConnectionState.Open || cnx.State == ConnectionState.Broken)
            {
                cnx.Close();
            }
        }
        public  DataTable Get_ALL_info_chart(string Query)
        {
            Connecter();
            cmd = new SqlCommand(Query, cnx);
            cmd.ExecuteNonQuery();
         
            sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
           
          
            return dt;

           
        }
    }
}
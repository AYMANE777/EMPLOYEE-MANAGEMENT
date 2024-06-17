using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace SECOND_LAST.Classes
{
    public class Carburant_Class
    {
        public Carburant_Class() { }


        RADEETA_Entities entity = new RADEETA_Entities();


        SqlConnection cnx = new SqlConnection(ConfigurationManager.ConnectionStrings["RADEETA_DATABASEConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        

        public bool Ajouter_Bon_Carburant(int id_carburant,int id_bon)
        {
            cnx.Open();
            cmd.Connection = cnx;
            cmd.CommandText = "insert into BON_CARBURANT values (@ID_BON,@ID_CARBURANT)";
            cmd.Parameters.AddWithValue("@ID_BON", id_bon);
            cmd.Parameters.AddWithValue("@ID_CARBURANT", id_carburant);


            cmd.ExecuteNonQuery();
           

            cnx.Close();
            return true;
        }
        //public bool Add_bon_vehicule()
        //{
            
        //}


        public bool Ajouter_Bon(DateTime Date_Bon,float Prix_Litre,float Nb_Litre,float Kilometrage)
        {
            var COUNT = entity.BON_PLEIN.Select(x => x.ID_BON).DefaultIfEmpty(0).Max();
            
            BON_PLEIN plein = new BON_PLEIN();
            plein.ID_BON = COUNT + 1;
            plein.DATE_BON = Date_Bon;
            plein.PRIX_LITRE = (decimal)Prix_Litre;
            plein.NBR_LITRE = Nb_Litre;
            plein.KILOMETRAGE = Kilometrage;
            
            
         
            entity.BON_PLEIN.Add(plein);
            entity.SaveChanges();
            return true;



        }

       

        public void Ajouter_Carburant(string Nom_Carburant,DateTime Date_Bon)
        {
            var COUNT = entity.CARBURANTs.Select(x => x.ID_CARBURANT).DefaultIfEmpty(0).Max();

            CARBURANT carburant = new CARBURANT();
            carburant.ID_CARBURANT = COUNT + 1;
            carburant.DATE_ADD_CARBURANT = Date_Bon;
            carburant.TYPE_CARBURANT = Nom_Carburant;
           
            
            entity.CARBURANTs.Add(carburant);
            entity.SaveChanges();



        }

      

    }
}
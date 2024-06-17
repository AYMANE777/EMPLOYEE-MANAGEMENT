using Lucene.Net.Support;
using SECOND_LAST.Entity_Frame;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SECOND_LAST.Classes
{
    public class Agent_Class
    {
        RADEETA_Entities entity = new RADEETA_Entities();
        public Agent_Class() { }
       
        

        public bool Login_Mode_Admin(string email,string pass)
        {
            if(entity.LOGINs.Where(x=>x.Username== email && x.PASS == pass ).Count() != 0)
            {
               
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool Login_Mode_user(string email,string pass)
        {
            if (entity.AGENTs.Where(x => x.EMAIL==email && x.PASSWORD==pass).Count() != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void Ajouter_Agent(string nom,string prenom,string cin,string telephone,string email,DateTime date_Ajout,string type,string photo,int id_service,string adresse,string password)
        {
            var get_max_id = entity.AGENTs.Select(x => x.ID_AGENT).DefaultIfEmpty(0).Max();
            AGENT agent = new AGENT();
            agent.ID_AGENT = get_max_id + 1;
            agent.NOM =nom;
            agent.Prenom =prenom;
            agent.CIN =cin;
            agent.TELEPHONE =telephone;
            agent.EMAIL =email;
            agent.Date_Ajout =date_Ajout;
            agent.TYPE =type;
            agent.PHOTO =photo;
            agent.ID_SERVICE =id_service;
            agent.ADRESSE =adresse;
            agent.PASSWORD =password;


            entity.AGENTs.Add(agent);
            entity.SaveChanges();

        }
        public bool Update_Agent(int id,string email,string telephone,string adresse,string password,string photo)
        {
            try
            {
                AGENT agent = entity.AGENTs.Where(x => x.ID_AGENT == id).Single();
                agent.EMAIL = email;
                agent.TELEPHONE = telephone;
                agent.ADRESSE = adresse;
                agent.PASSWORD = password;
                agent.PHOTO = photo;
                entity.SaveChanges();
                return true;
            }catch(Exception ex) { return false; }
        }


        Carburant_Class carburant = new Carburant_Class();
        public void Ajouter_Bon_plein_user(DateTime date_ajout, float prix_litre, float nbr_litre, float kilometrage, int id_vehicule,int id_carbs)
        {
            BON_PLEIN bon = new BON_PLEIN();
            bon.ID_BON = entity.BON_PLEIN.Select(x => x.ID_BON).DefaultIfEmpty(0).Max() + 1;
            bon.DATE_BON = date_ajout;
            bon.NBR_LITRE = nbr_litre;
            bon.PRIX_LITRE = (decimal)prix_litre;
            bon.KILOMETRAGE = kilometrage;
            entity.BON_PLEIN.Add(bon);
            entity.SaveChanges();
            carburant.Ajouter_Bon_Carburant(id_carbs, entity.BON_PLEIN.Select(x => x.ID_BON).Max());

            

        }
        public PANNE Get_Panne_with_id(int id)
        {
             PANNE panne = entity.PANNEs.Where(x => x.ID_PANNE == id).DefaultIfEmpty(null).Single();

            return panne;
        }
    }
    public class Utils
    {
        public Utils() { }

        public bool IsvalidExtension(string filename)
        {
            bool isValid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg", ".bmp" };
            for (int i = 0; i <= fileExtension.Length - 1; i++)
            {
                if (filename.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
        public static string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "../Image/no-image.png";

            }
            else
            {
                url1 = string.Format("../{0}", url);
            }
            return url1;

        }
        //public static List<AGENT>  Get_All_information()
        //{
        //    RADEETA_Entities entity = new RADEETA_Entities();

        //    var mission = (from A in entity.AGENTs join D in entity.DETAIL_MISSION on A.ID_AGENT equals D.ID_AGENT select new { A }).ToList(); 


        //    return mission;
        //}
        


       public static int Get_Count_Mission()
        {
            RADEETA_Entities entity = new RADEETA_Entities();
            int get_count_miss=entity.MISSIONs.Select(x => x.ID_MISSION).DefaultIfEmpty(0).Count();
            return get_count_miss;
        }
        public static int Get_Count_Vehicule()
        {
            RADEETA_Entities entity = new RADEETA_Entities();
            int get_count_vehicule = entity.VEHICULEs.Select(x => x.ID_VEHICULE).DefaultIfEmpty(0).Count();
            return get_count_vehicule;
        }
        public static int Get_Count_vehicule_Panne()
        {
            RADEETA_Entities entity = new RADEETA_Entities();
            int get_count_vehicule_panne = (from V in entity.VEHICULEs join P in entity.PANNEs on V.ID_VEHICULE equals P.ID_VEHICULE join R in entity.REPARATIONs on P.ID_PANNE equals R.ID_PANNE
                                            where DateTime.Now <= R.DATE_FIN_REPARATION && DateTime.Now >= R.DATE_DEBUT_REPARATION select new { V.ID_VEHICULE }).Count();
            return get_count_vehicule_panne;
        }
        public static int Get_Count_vehicule_disponible()
        {
            RADEETA_Entities entity = new RADEETA_Entities();
            int get_count_vehicule_panne = (from V in entity.VEHICULEs
                                            join P in entity.PANNEs on V.ID_VEHICULE equals P.ID_VEHICULE
                                            join R in entity.REPARATIONs on P.ID_PANNE equals R.ID_PANNE
                                            where DateTime.Now >= R.DATE_FIN_REPARATION 
                                            select new { V.ID_VEHICULE }).Count();
            return get_count_vehicule_panne;
        }
        public static int Get_Count_vehicule_nouveau()
        {
            RADEETA_Entities db = new RADEETA_Entities();
            int get_count_nouveau_vehicule = (from VEHICULE in
                                            (from VEHICULE in db.VEHICULEs
                                             where
                                               !
                                                 (from REPARATION in db.REPARATIONs
                                                  select new
                                                  {
                                                      VEHICULE.ID_VEHICULE
                                                  }).Contains(new { ID_VEHICULE = VEHICULE.ID_VEHICULE })
                                             select new
                                             {
                                                 VEHICULE.ID_VEHICULE,
                                                 Col = "x"
                                             })
                                            group VEHICULE by new { VEHICULE.Col } into g
                                            select new
                                            {
                                                Column1 = g.Count(p => p.ID_VEHICULE != null)
                                            }).Count();
            return get_count_nouveau_vehicule;
        }


        public static int Get_Mission_effectuer()
        {
            RADEETA_Entities entity = new RADEETA_Entities();
            int get_count_miss = (from M in entity.MISSIONs join D in entity.DETAIL_MISSION on M.ID_MISSION equals D.ID_MISSION select D.ID_MISSION).DefaultIfEmpty(0).Count() ;
            return get_count_miss;
        }

        public static int Get_Mission_valable()
        {
            RADEETA_Entities db = new RADEETA_Entities();
            int get_count_miss = (from MISSION in db.MISSIONs
                                  where
                                    !
                                      (from DETAIL_MISSION in db.DETAIL_MISSION
                                       select new
                                       {
                                           DETAIL_MISSION.ID_MISSION
                                       }).Contains(new { ID_MISSION = MISSION.ID_MISSION })
                                  select new
                                  {
                                      MISSION.ID_MISSION,
                                      
                                  }).Count();
            return get_count_miss;
        }

        public static int Get_Expire_Mission()
        {
            RADEETA_Entities db = new RADEETA_Entities();
            int get_expire_mission = (from M in db.MISSIONs where DateTime.Compare(M.DATE_DEBUT, M.DATE_FIN) > 0 select M.ID_MISSION).Count();

            return get_expire_mission;
        }


    }
}
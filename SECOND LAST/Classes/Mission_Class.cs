using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SECOND_LAST.Classes
{
    public class Mission_Class
    {
        public Mission_Class() { }

        RADEETA_Entities entity = new RADEETA_Entities();


        public void Ajouter_Mission(string objet,DateTime date_debut,DateTime date_fin,string Lieu)
        {
            int count = entity.MISSIONs.Select(x => x.ID_MISSION).DefaultIfEmpty(0).Max() + 1;
            MISSION mission = new MISSION();
            mission.ID_MISSION = count;
            mission.OBJET = objet;
            mission.DATE_DEBUT = date_debut;
            mission.DATE_FIN = date_fin;
            mission.LIEU = Lieu;
            entity.MISSIONs.Add(mission);
            entity.SaveChanges();
        }
        public MISSION GetMISSION(int id)
        {
            return entity.MISSIONs.Where(x => x.ID_MISSION == id).Single();
        }
        public void Appliquer_Mission(int id_mission,int id_Agent,int id_Vehicule,DateTime date_application)
        {
            DETAIL_MISSION detail = new DETAIL_MISSION();
            detail.ID_MISSION = id_mission;
            detail.ID_AGENT = id_Agent;
            detail.ID_VEHICULE = id_Vehicule;
            detail.DATE = date_application;
            entity.DETAIL_MISSION.Add(detail);
            entity.SaveChanges();

        }



       


    }
   
}
using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SECOND_LAST.Classes
{
    public class Véhicule
    {
            public Véhicule() { }


        RADEETA_Entities entity = new RADEETA_Entities();

        public void Ajouter_Vehicule(string immatriculation,string matricule,int id_model,int id_categorie,int id_carburant,int id_proprietaire,DateTime date_debut)
        {
            VEHICULE vehicule = new VEHICULE();
            vehicule.ID_VEHICULE = entity.VEHICULEs.Select(x => x.ID_VEHICULE).DefaultIfEmpty(0).Max()+1;
            vehicule.IMATRUCULATION = immatriculation;
            vehicule.MATRICULE = matricule;
            vehicule.ID_MODELE = id_model;
            vehicule.ID_CATEGORIE = id_categorie;
            vehicule.ID_CARBURANT = id_carburant;
            vehicule.ID_PROPRIETAIRE = id_proprietaire;
            vehicule.DATE_DEBUT = date_debut;

            entity.VEHICULEs.Add(vehicule);
            entity.SaveChanges();
        }



        public void Ajouter_Catégorie_Vehicule(string libeller)
        {
            CATEGORIE categorie = new CATEGORIE();

            categorie.ID_CATEGORIE = entity.CATEGORIEs.Select(x => x.ID_CATEGORIE).DefaultIfEmpty(0).Max()+1;
            categorie.LIB_CATEGORIE = libeller;

            entity.CATEGORIEs.Add(categorie);
            entity.SaveChanges();


        }
        public void Ajouter_Modéle(string marque,string libeller_Model)
        {
            MODELE modele = new MODELE();
            modele.ID_MODELE = entity.MODELEs.Select(x => x.ID_MODELE).DefaultIfEmpty(0).Max()+1 ;
            modele.MARQUE = marque;
            modele.LIBELLER_MODEL = libeller_Model;

            entity.MODELEs.Add(modele);
            entity.SaveChanges();

        }


        public void Ajouter_Proprietaire(string intituler,string adresse,string tel,string email)
        {
            PROPRIETAIRE prop = new PROPRIETAIRE();
            prop.ID_PROPRIETAIRE = entity.PROPRIETAIREs.Select(x => x.ID_PROPRIETAIRE).DefaultIfEmpty(0).Max() + 1;
            prop.INTITULER = intituler;
            prop.ADRESSE = adresse;
            prop.TELEPHONE = tel;
            prop.EMAIL = email;
           
            entity.PROPRIETAIREs.Add(prop);
            entity.SaveChanges();
        }



        public void Ajouer_Panne(DateTime date_panne,int id_vehicule,string detail_panne)
        {
            PANNE panne = new PANNE();
            panne.ID_PANNE = entity.PANNEs.Select(x => x.ID_PANNE).DefaultIfEmpty(0).Max() + 1;
            panne.DATE_PANNE = date_panne;
            panne.ID_VEHICULE = id_vehicule;
            panne.DETAIL_PANNE = detail_panne;


            entity.PANNEs.Add(panne);
            entity.SaveChanges();

        }

        public void Reparation_Vehicule(DateTime debut_reparation,DateTime date_fin,float prix,int id_panne,string porteur)
        {
            REPARATION reparation = new REPARATION();
            reparation.N_REPARATION = entity.REPARATIONs.Select(x => x.N_REPARATION).DefaultIfEmpty(0).Max() + 1;
            reparation.DATE_DEBUT_REPARATION = debut_reparation;
            reparation.DATE_FIN_REPARATION = date_fin;
            reparation.PRIX = (decimal)prix;
            reparation.ID_PANNE = id_panne;
            reparation.PORTER = porteur;
            entity.REPARATIONs.Add(reparation);
            entity.SaveChanges();

        }
    }
}
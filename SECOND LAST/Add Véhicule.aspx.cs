using SECOND_LAST.Classes;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class Add_Véhicule : System.Web.UI.Page
    {
        Véhicule véhicule = new Véhicule();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADMIN"] == null) { Response.Redirect("Login_Acc.aspx"); }

        }
        public bool Traitement()
        {
            if(ddl_categorie.SelectedIndex != -1 && ddl_modele.SelectedIndex != -1 && ddl_carburant.SelectedIndex != -1 && ddl_proprietaire.SelectedIndex != -1 && tb_date_debut.Text != string.Empty && tb_immatriculation.Text != string.Empty && tb_matricule.Text != string.Empty)
            {
                return true;
            }
            else
            {
                return false;
            }
        

        }

        public void vider()
        {
            ddl_categorie.SelectedIndex = -1;
            ddl_modele.SelectedIndex = -1;
            ddl_carburant.SelectedIndex = -1;
            ddl_proprietaire.SelectedIndex = -1;
            tb_date_debut.Text = string.Empty;
            tb_immatriculation.Text = string.Empty;
            tb_matricule.Text = string.Empty;
            lb_cas_erreur.Text = string.Empty;

        }

        protected void btn_Add_Vehicule_Click(object sender, EventArgs e)
        {
            try
            {
                if (Traitement())
                {
                    int select_categorie = Convert.ToInt32(ddl_categorie.SelectedValue);
                    int select_modele = Convert.ToInt32(ddl_modele.SelectedValue);
                    int select_carburant = Convert.ToInt32(ddl_carburant.SelectedValue);
                    int select_proprietaire = Convert.ToInt32(ddl_proprietaire.SelectedValue);

                    véhicule.Ajouter_Vehicule(tb_immatriculation.Text, tb_matricule.Text, select_modele, select_categorie, select_carburant, select_proprietaire, DateTime.Parse(tb_date_debut.Text));
                    GridView1.DataBind();
                    SqlDataSource5.DataBind();
                    lb_cas_erreur.ForeColor = Color.Green;
                    lb_cas_erreur.Text = "Ajout Success !";
                    vider();
                }
              

            }
            catch (Exception ex)
            {
                lb_cas_erreur.ForeColor = Color.Red;
                lb_cas_erreur.Text = ex.Message;
            }
        }

        protected void commande(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
        }
    }
}
using SECOND_LAST.Classes;
using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class Categorie_and_modele : System.Web.UI.Page
    {

        Véhicule véhicule = new Véhicule();
        RADEETA_Entities entity = new RADEETA_Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
           
        }

        protected void btn_add_Modele_Click(object sender, EventArgs e)
        {
            try
            {
                véhicule.Ajouter_Modéle(tb_marque_modele.Text, tb_lib_modele.Text);
                lb_cas_erreur_modele.ForeColor = Color.Green;
                lb_cas_erreur_modele.Text = "Ajout Success";
                SqlDataSource2.DataBind();
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                lb_cas_erreur_modele.ForeColor = Color.Red;
                lb_cas_erreur_modele.Text = ex.Message;
            }
        }

        protected void Add_Categorie(object sender, EventArgs e)
        {
            try
            {
                véhicule.Ajouter_Catégorie_Vehicule(tb_libeller.Text);
                lb_cas_erreur.ForeColor = Color.Green;
                lb_cas_erreur.Text = "Ajout Success";
                SqlDataSource1.DataBind();
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                lb_cas_erreur.ForeColor = Color.Red;
                lb_cas_erreur.Text = ex.Message;
            }
        }
    }
}
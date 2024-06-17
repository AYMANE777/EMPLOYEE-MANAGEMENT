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
    public partial class WebForm6 : System.Web.UI.Page
    {
        Véhicule véhicule = new Véhicule();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AGENT_ID"] == null)
            {
                Response.Redirect("Login_Acc.aspx");
            }
        }
        protected void Add_panne(object sender, EventArgs e)
        {
            try
            {
                if (tb_date_panne.Text != string.Empty && tb_detail_panne.Text != string.Empty)
                {
                    int select = int.Parse(ddl_vehicule.SelectedValue);
                    véhicule.Ajouer_Panne(DateTime.Parse(tb_date_panne.Text), select, tb_detail_panne.Text);
                    lb_cas_erreur.ForeColor = Color.Green;
                    lb_cas_erreur.Text = "Ajout Success !";
                    SqlDataSource1.DataBind();
                    GridView1.DataBind();

                    tb_date_panne.Text = string.Empty; tb_detail_panne.Text = string.Empty; ddl_vehicule.SelectedIndex = 0;
                }
                else
                {
                    lb_cas_erreur.ForeColor = Color.Red;
                    lb_cas_erreur.Text = "Veuillez Remplir Tous Les Champs !";
                }
            }
            catch (Exception ex)
            {
                lb_cas_erreur.ForeColor = Color.Red;
                lb_cas_erreur.Text = ex.Message;
            }
        }

        //protected void Add_Reparation(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int select_panne = int.Parse(ddl_id_panne.SelectedValue);
        //        véhicule.Reparation_Vehicule(DateTime.Parse(tb_date_debut_reparation.Text), DateTime.Parse(tb_date_fin_reparation.Text), float.Parse(tb_prix_du_reparation.Text), select_panne, tb_porteur.Text);
        //        SqlDataSource4.DataBind();
        //        GridView3.DataBind();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}
    }
}
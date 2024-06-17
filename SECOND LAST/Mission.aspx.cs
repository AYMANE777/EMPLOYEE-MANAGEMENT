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
    public partial class Mission : System.Web.UI.Page
    {
        Mission_Class mission = new Mission_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADMIN"] == null) { Response.Redirect("Login_Acc.aspx"); }
            if (!IsPostBack)
            {

            }
        }

        protected void Ajouter_mission(object sender, EventArgs e)
        {
            try
            {
                if (tb_objet_mission.Text != string.Empty && tb_date_debut.Text != string.Empty && tb_date_fin.Text != string.Empty && tb_lieu_mission.Text != string.Empty)
                {
                    mission.Ajouter_Mission(tb_objet_mission.Text, DateTime.Parse(tb_date_debut.Text), DateTime.Parse(tb_date_fin.Text), tb_lieu_mission.Text);
                    lb_cas_erreur.ForeColor = Color.Green;
                    lb_cas_erreur.Text = "Ajout Success !";
                    SqlDataSource1.DataBind();
                    GridView2.DataBind();
                    tb_objet_mission.Text = string.Empty; tb_date_debut.Text = string.Empty; tb_date_fin.Text = string.Empty; tb_lieu_mission.Text = string.Empty;
                }
                else
                {
                    lb_cas_erreur.ForeColor = Color.Red;
                    lb_cas_erreur.Text = "Veuillez Remplir Tous Les Champs !";
                }
            }
            catch(Exception ex)
            {
                lb_cas_erreur.ForeColor = Color.Red;
                lb_cas_erreur.Text = ex.Message;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
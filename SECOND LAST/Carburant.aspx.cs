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
    public partial class Carburant1 : System.Web.UI.Page
    {

        RADEETA_Entities entity = new RADEETA_Entities();
        Carburant_Class carburant = new Carburant_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Add_Carburant(object sender, EventArgs e)
        {
            try
            {
                if (tb_date_carburant.Text != string.Empty && tb_nom_carburant.Text != string.Empty)
                {
                    carburant.Ajouter_Carburant(tb_nom_carburant.Text, DateTime.Parse(tb_date_carburant.Text));
                    lb_cas_erreur.ForeColor = Color.Green;
                    lb_cas_erreur.Text = "Ajout Success !";
                    SqlDataSource1.DataBind();
                    GridView1.DataBind();
                    tb_date_carburant.Text = string.Empty;
                    tb_nom_carburant.Text = string.Empty;
                }
                else
                {
                    lb_cas_erreur.ForeColor = Color.Red;
                    lb_cas_erreur.Text = "Veuiller Remplir Tous les Champs !";
                }
            }
            catch(Exception ex)
            {
                lb_cas_erreur.ForeColor = Color.Red;
                lb_cas_erreur.Text = ex.Message;
            }
        }
    }
}
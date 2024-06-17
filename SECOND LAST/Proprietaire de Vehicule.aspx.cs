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
    public partial class Proprietaire_de_Vehicule : System.Web.UI.Page
    {
        RADEETA_Entities entity = new RADEETA_Entities();
        Véhicule véhicule = new Véhicule();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADMIN"] == null) { Response.Redirect("Login_Acc.aspx"); }
        }
       public bool validate()
        {
            if(tb_adresse_prop.Text!=string.Empty && tb_email_prop.Text!=string.Empty && tb_intituler.Text!=string.Empty && tb_tel_prop.Text != string.Empty)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void ADD_PROPRIETAIRE(object sender, EventArgs e)
        {
            try
            {
                if (validate())
                {
                    véhicule.Ajouter_Proprietaire(tb_intituler.Text, tb_adresse_prop.Text, tb_tel_prop.Text, tb_email_prop.Text);
                    lb_cas_erreur.ForeColor = Color.Green;
                    lb_cas_erreur.Text = "Success";
                    SqlDataSource33.DataBind();
                    GridView1.DataBind();
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
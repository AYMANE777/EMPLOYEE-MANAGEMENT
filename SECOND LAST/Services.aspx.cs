using SECOND_LAST.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using SECOND_LAST.Entity_Frame;

namespace SECOND_LAST
{
    public partial class Services : System.Web.UI.Page
    {
        Service_Class service = new Service_Class();
        RADEETA_Entities entity = new RADEETA_Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADMIN"] == null) { Response.Redirect("Login_Acc.aspx"); }
            //tb_id_service.Text = (entity.SERVICES.Select(x => x.ID_SERVICE).DefaultIfEmpty(0).Max() + 1).ToString() ;
            //Remplissage_Grid();
        }

       public void Remplissage_Grid() { GridView1.DataSource = entity.SERVICES.Select(x => new { ID = x.ID_SERVICE, NOM = x.NOM_SERVICE, x.DESCRIPTION }).ToList();GridView1.DataBind(); }

        protected void Add_Service(object sender, EventArgs e)
        {
            try
            {
                if (tb_description.Text != string.Empty && tb_nom_service.Text != string.Empty)
                {
                    service.AddService(tb_nom_service.Text, tb_description.Text);
                    lb_cas_erreur.ForeColor =Color.Green;
                    lb_cas_erreur.Text = "Ajout Success";
                    //Remplissage_Grid();
                    SqlDataSource1.DataBind();
                    GridView1.DataBind();
                    tb_description.Text = string.Empty;tb_nom_service.Text = string.Empty;
                  
                }
                else
                {
                    lb_cas_erreur.ForeColor = Color.Red;
                    lb_cas_erreur.Text = "Veuillez remplir tous Les Champs !";
                }


            }catch(Exception ex)
            {

            }
        }
    }
}
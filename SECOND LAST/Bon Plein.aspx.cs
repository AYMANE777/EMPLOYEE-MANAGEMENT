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
    public partial class Carburant : System.Web.UI.Page
    {
        RADEETA_Entities entity = new RADEETA_Entities();
        Carburant_Class carburant = new Carburant_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               

            }
        }

        protected void Add_Bon(object sender, EventArgs e)
        {
            try
            {
               if( carburant.Ajouter_Bon(DateTime.Parse(tb_date_bon.Text),float.Parse(tb_prix.Text), float.Parse(tb_nombre_litre.Text), float.Parse(tb_kilometrage.Text)))
                {
                    int select = int.Parse(ddl_type_carburant.SelectedValue);
                    if (carburant.Ajouter_Bon_Carburant(select, entity.BON_PLEIN.Select(x => x.ID_BON).Max()))
                    {

                        lb_cas_erreur.ForeColor = Color.Green;
                        lb_cas_erreur.Text = "Ajout Success";
                        SqlDataSource1.DataBind();
                        GridView1.DataBind();
                        tb_date_bon.Text = string.Empty;
                        tb_kilometrage.Text = string.Empty;
                        tb_nombre_litre.Text = string.Empty;
                        tb_prix.Text = string.Empty;
                        ddl_type_carburant.SelectedIndex = 0;
                        SqlDataSource3.DataBind();
                        GridView1.DataBind();


                    }
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
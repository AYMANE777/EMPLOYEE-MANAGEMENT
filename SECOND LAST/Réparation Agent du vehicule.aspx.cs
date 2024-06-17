using SECOND_LAST.Classes;
using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        RADEETA_Entities entity = new RADEETA_Entities();
        Véhicule véhicule = new Véhicule();
        Agent_Class agent = new Agent_Class();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AGENT_ID"] == null)
            {
                Response.Redirect("Login_Acc.aspx");
            }
            if (!IsPostBack)
            {
                PANNE pn = agent.Get_Panne_with_id(1);
                if ( pn!= null)
                {
                    lb_date_panne.Text = agent.Get_Panne_with_id(1).DATE_PANNE.ToString();
                    lb_detail_panne.Text = agent.Get_Panne_with_id(1).DETAIL_PANNE;
                    lb_vehicule.Text = (from P in entity.PANNEs join V in entity.VEHICULEs on P.ID_VEHICULE equals V.ID_VEHICULE where P.ID_PANNE == 1 select V.IMATRUCULATION).FirstOrDefault();
                }
            }
            
        }

      

       

        protected void btn_reparer_vehicule_Click(object sender, EventArgs e)
        {


            try
            {
                int select_panne = int.Parse(DropDownList1.SelectedValue);
                véhicule.Reparation_Vehicule(DateTime.Parse(tb_date_entree.Text), DateTime.Parse(tb_date_retour.Text), float.Parse(tb_prix.Text), select_panne, tb_porteur.Text);

            }
            catch (Exception ex)
            {

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int get_id = int.Parse(DropDownList1.SelectedValue);

            lb_date_panne.Text = agent.Get_Panne_with_id(get_id).DATE_PANNE.ToString();
            lb_detail_panne.Text = agent.Get_Panne_with_id(get_id).DETAIL_PANNE;
            lb_vehicule.Text= (from P in entity.PANNEs join V in entity.VEHICULEs on P.ID_VEHICULE equals V.ID_VEHICULE where P.ID_PANNE == get_id select V.IMATRUCULATION).FirstOrDefault();
        }
    }
}
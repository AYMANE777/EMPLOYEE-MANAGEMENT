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
    public partial class WebForm3 : System.Web.UI.Page
    {

        RADEETA_Entities entity = new RADEETA_Entities();
        Mission_Class mission = new Mission_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AGENT_ID"] == null)
            {
                Response.Redirect("Login_Acc.aspx");
            }
            if (!IsPostBack)
            {
          
                lb_lieu_mission.Text = mission.GetMISSION(1).LIEU.ToString();
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int select_id_mission = int.Parse(ddl_mission.SelectedValue);
            lb_lieu_mission.Text = mission.GetMISSION(select_id_mission).LIEU.ToString();
            lb_Object_mission.Text = mission.GetMISSION(select_id_mission).OBJET.ToString();
            lb_date_debut.Text = mission.GetMISSION(select_id_mission).DATE_DEBUT.ToString();
            lb_date_fin.Text = mission.GetMISSION(select_id_mission).DATE_FIN.ToString();
        }

        protected void btn_add_mission_Click(object sender, EventArgs e)
        {
            try
            {
                int select_id_mission = int.Parse(ddl_mission.SelectedValue);
                int select_id_Vehicule = int.Parse(ddl_vehicule.SelectedValue);
                List<String> ls=new List<string>();
                string get_Values = "";
                for(int i = 0; i < Cb_Liste.Items.Count; i++)
                {
                    if (Cb_Liste.Items[i].Selected == true)
                    {
                        int get_id_Agent = int.Parse(Cb_Liste.Items[i].Value);
                        mission.Appliquer_Mission(select_id_mission,get_id_Agent, select_id_Vehicule, DateTime.Parse(tb_date_faire_mission.Text));
                      
                    }
                }
                lb_cas_erreur.ForeColor = Color.Green;
                lb_cas_erreur.Text = "Success";
               
            }
            catch (Exception ex)
            {

                lb_cas_erreur.Text = ex.Message;
            }
        }
    }
}
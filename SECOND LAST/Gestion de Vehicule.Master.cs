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
    public partial class Gestion_de_Vehicule : System.Web.UI.MasterPage
    {
       
        RADEETA_Entities entity = new RADEETA_Entities();
        Véhicule véhicule = new Véhicule();
        Agent_Class agent = new Agent_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            notification.Text= (from D in entity.DETAIL_MISSION join M in entity.MISSIONs on D.ID_MISSION equals M.ID_MISSION select D.ID_MISSION).DefaultIfEmpty(0).Count().ToString();
            repeter.DataSource = (from D in entity.DETAIL_MISSION join M in entity.MISSIONs on D.ID_MISSION equals M.ID_MISSION join A in entity.AGENTs on D.ID_AGENT equals A.ID_AGENT select new { D.DATE, D.ID_MISSION, D.ID_AGENT, A.PHOTO }).OrderByDescending(D=>D.DATE).ToList();
            repeter.DataBind();
        }
       

        protected void dec_Click(object sender, EventArgs e)
        {
             Session["USER"] = null;
            Response.Redirect("Login_Acc.aspx",true);
        }
    }
}
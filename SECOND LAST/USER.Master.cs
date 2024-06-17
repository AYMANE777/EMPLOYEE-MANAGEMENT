using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class USER : System.Web.UI.MasterPage
    {
        RADEETA_Entities entity = new RADEETA_Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            repeter.DataSource = (from MISSION in entity.MISSIONs
                                 where
                                   !
                                     (from DETAIL_MISSION in entity.DETAIL_MISSION
                                      select new
                                      {
                                          DETAIL_MISSION.ID_MISSION
                                      }).Contains(new { ID_MISSION = MISSION.ID_MISSION }) &&
                                   DateTime.Now >= MISSION.DATE_DEBUT && DateTime.Now <= MISSION.DATE_FIN
                                 orderby
                                   MISSION.ID_MISSION descending
                                 select new
                                 {
                                     MISSION.ID_MISSION,
                                     MISSION.OBJET,
                                     MISSION.DATE_DEBUT,
                                     MISSION.DATE_FIN,
                                     MISSION.LIEU
                                 }).ToList();
            repeter.DataBind();
            string select_notify = (from MISSION in entity.MISSIONs
                                 where
                                   !
                                     (from DETAIL_MISSION in entity.DETAIL_MISSION
                                      select new
                                      {
                                          DETAIL_MISSION.ID_MISSION
                                      }).Contains(new { ID_MISSION = MISSION.ID_MISSION }) &&
                                   DateTime.Now >= MISSION.DATE_DEBUT && DateTime.Now <= MISSION.DATE_FIN
                                 select new
                                 {
                                     MISSION.ID_MISSION,

                                 }).Count().ToString();
                                if (  select_notify!= null) { notify.Text = select_notify; }
                                else { notify.Text = "0"; }
        }
        public void deconnecter()
        {
            try
            {
                Session["USER"] = null;
                Response.Redirect("Login_Acc.aspx");

            }
            catch (Exception ex)
            {

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class USER_ACCEUIL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AGENT_ID"] == null)
            {
                Response.Redirect("Login_Acc.aspx");
            }
        }
    }
}
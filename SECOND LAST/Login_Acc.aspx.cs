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
    public partial class Login : System.Web.UI.Page
    {
        Agent_Class agent = new Agent_Class();
        RADEETA_Entities entity = new RADEETA_Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["AGENT_ID"] = null;
                Session["ADMIN"] = null;
            }
        }

     
        protected void login_user(object sender, EventArgs e)
        {
            try
            {
                if (tb_email_login.Text != string.Empty && tb_pass_login.Text != string.Empty) {
                    if (agent.Login_Mode_Admin(tb_email_login.Text, tb_pass_login.Text))

                    {
                        Session["ADMIN"] = tb_email_login.Text;
                        Response.Redirect("Admin Acceuilll.aspx");
                    }
                    else if (agent.Login_Mode_user(tb_email_login.Text, tb_pass_login.Text))
                    {
                        var select_user_info = entity.AGENTs.Where(x => x.EMAIL == tb_email_login.Text).Single();
                        Session["AGENT_ID"] = select_user_info.ID_AGENT.ToString();
                        Session["AGENT_IMG"] = select_user_info.PHOTO.ToString();
                        Session["AGENT"] = select_user_info.NOM + " " + select_user_info.Prenom;
                        Response.Redirect("USER_ACCEUIL.aspx");

                    }
                    else
                    {
                        lb_cas_erreur.ForeColor = Color.Red;
                        lb_cas_erreur.Text = "Email ou Mot de passe incorrect";
                    }
                }
                else 
                {
                    lb_cas_erreur.ForeColor = Color.Red;
                    lb_cas_erreur.Text = "Veuillez remplir tous les champs *";
                }
            }
            catch (Exception EX)
            {
                lb_cas_erreur.Text = EX.Message;
                //Response.Redirect("!found.html");
            }
        }
    }
}
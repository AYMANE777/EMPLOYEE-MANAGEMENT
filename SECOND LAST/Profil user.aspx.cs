
using SECOND_LAST.Classes;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Resources;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        Agent_Class agent = new Agent_Class();
        Utils utils = new Utils();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (img_Agent.HasFile)
            {
            
                string fileName = img_Agent.PostedFile.FileName;

                if (utils.IsvalidExtension(fileName))
                {
                    string path = "Image/" + img_Agent.FileName;
                    img_Agent.PostedFile.SaveAs(Server.MapPath("~/Image/") + fileName);
                    int get_id = int.Parse(Session["AGENT_ID"].ToString());
                    if(agent.Update_Agent(get_id,new_email.Text,new_phone.Text,new_adresse.Text, pass.Text, path))
                    {
                        lb_cas_erreur.ForeColor = Color.Green;
                        lb_cas_erreur.Text = "Bien Sauvegarder";
                    }
                   


                  
                }
                else
                {
                    lb_image_erreur.ForeColor = Color.Red;
                    lb_image_erreur.Text = "Importer image .jpeg,.png,.jpg,.bmp seulement";
                    lb_cas_erreur.Visible = false;
                }

            }
        }
    }
}
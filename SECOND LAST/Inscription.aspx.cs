using SECOND_LAST.Classes;
using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_LAST
{
    public partial class Inscription : System.Web.UI.Page
    {
        RADEETA_Entities entity = new RADEETA_Entities();
        Agent_Class agent = new Agent_Class();
        Utils Utils = new Utils();


        public void Remplissage_Grid()
        {
            GridView1.DataSource = entity.AGENTs.Select(x=>new {x.ID_AGENT,x.NOM } );
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADMIN"] == null) { Response.Redirect("Login_Acc.aspx"); }
            if (!IsPostBack)
            {

              
              

            }
          
        }
     

        protected void Add_Agent(object sender, EventArgs e)
        {
            try
            {
                if (tb_nom.Text != string.Empty && tb_prenom.Text != string.Empty && tb_cin.Text != string.Empty && tb_pass.Text!=string.Empty && tb_cofirm_pass.Text!=string.Empty && tb_tel.Text != string.Empty && tb_email.Text != string.Empty && tb_adresse.Text != string.Empty)
                {
                    if (FileUpload_img.HasFile)
                    {

                        string fileName = FileUpload_img.PostedFile.FileName;

                        if (Utils.IsvalidExtension(fileName))
                        {
                            string path = "Image/" + FileUpload_img.FileName;
                            FileUpload_img.PostedFile.SaveAs(Server.MapPath("~/Image/") + fileName);
                            int select = Convert.ToInt32(ddl_Service.SelectedValue);


                            if (radio_A.Checked)
                            {

                                agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text, DateTime.Now, "A", path, select, tb_adresse.Text, tb_pass.Text);
                            }
                            else if (radio_C.Checked)
                            {
                                agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text, DateTime.Now, "C", path, select, tb_adresse.Text, tb_pass.Text);
                            }
                            else if (radio_CA.Checked)
                            {
                                agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text, DateTime.Now, "CA", path, select, tb_adresse.Text, tb_pass.Text);
                            }
                        }
                        else
                        {
                            lb_image_erreur.ForeColor = Color.Red;
                            lb_image_erreur.Text = "Importer image .jpeg,.png,.jpg,.bmp seulement";
                            lb_cas_erreur.Visible = false;
                        }
                       
                    }
                    else
                    {
                        int select = Convert.ToInt32(ddl_Service.SelectedValue);


                        if (radio_A.Checked)
                        {

                            agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text, DateTime.Now, "A", null, select, tb_adresse.Text, tb_pass.Text);
                        }
                        else if (radio_C.Checked)
                        {
                            agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text, DateTime.Now, "C", null, select, tb_adresse.Text, tb_pass.Text);
                        }
                        else if (radio_CA.Checked)
                        {
                            agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text, DateTime.Now, "CA", null, select, tb_adresse.Text, tb_pass.Text);
                        }
                    }
                    lb_cas_erreur.Visible = true;
                    tb_nom.Text = string.Empty; tb_prenom.Text = string.Empty; tb_cin.Text = string.Empty; tb_tel.Text = string.Empty; tb_email.Text = string.Empty; tb_adresse.Text = string.Empty;tb_pass.Text = string.Empty;tb_cofirm_pass.Text = string.Empty;
                    SqlDataSource2.DataBind();
                    GridView1.DataBind();
                    lb_cas_erreur.ForeColor = Color.Green;
                    lb_cas_erreur.Text = "Ajout Success !";
                }
                else
                {
                   
                    lb_cas_erreur.ForeColor = Color.Red;
                    lb_cas_erreur.Text = "Veuillez Remplir les Champs !";
                }
              

                //agent.Ajouter_Agent(tb_nom.Text, tb_prenom.Text, tb_cin.Text, tb_tel.Text, tb_email.Text,DateTime.Now,)
            }
            catch(Exception ex)
            {
                lb_cas_erreur.ForeColor = Color.Red;
                lb_cas_erreur.Text = ex.Message;
            }
        }

        protected void Import_Image(object sender, EventArgs e)
        {
           
           
        }

        protected void tb_search_TextChanged(object sender, EventArgs e)
        {
           
        }

       

        protected void Refrech_Grid(object sender, EventArgs e)
        {
          
        }

        protected void btn_recherch_Click(object sender, EventArgs e)
        {
           

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
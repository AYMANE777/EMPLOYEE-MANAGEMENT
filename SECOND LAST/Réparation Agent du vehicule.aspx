<%@ Page Title="" Language="C#" MasterPageFile="~/USER.Master" AutoEventWireup="true" CodeBehind="Réparation Agent du vehicule.aspx.cs" Inherits="SECOND_LAST.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager11" runat="server"></asp:ScriptManager>



    <div class="row">

        <div class="col-xl-8 col-lg-7">

            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Réparation de Véhicule</h6>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                        <div class="card-body">


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label1">Id du panne :</asp:Label></h6>
                                    <asp:DropDownList ID="DropDownList1" class="form-control form-control-user"  runat="server" DataSourceID="SqlDataSource2" DataTextField="ID_PANNE" DataValueField="ID_PANNE" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_PANNE] FROM [PANNE]"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label2">Date d'Entrée :</asp:Label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_entree"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label3">Date du Retour :</asp:Label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_retour"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                         <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Porteur :</label></h6>
                                    <asp:TextBox runat="server"  class="form-control form-control-user" ID="tb_porteur"
                                        placeholder="Réparation du véhicule"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Prix de Réparation (Dh) :</label></h6>
                                    <asp:TextBox runat="server" type="Number" step="0.01" min="0" class="form-control form-control-user" ID="tb_prix"
                                        placeholder="Prix"></asp:TextBox>
                                </div><br />
                              
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>



                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_reparer_vehicule" runat="server" Text="Réparer" class="btn btn-primary btn-user btn-block" OnClick="btn_reparer_vehicule_Click"></asp:Button>
                                </div>

                            </div>
                        </div>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>







        <div class="col-xl-4 col-lg-7">

            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Détail du Panne :</h6>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="card-body">


                            <h4 class="sub-title">Information sur le panne :</h4>

                            <hr class="sidebar-divider my-0">
                            <br />



                             <div class="form-group row">
                                <div class="col-sm-12">
                                    <label>
                                        <h6 class="m-0 font-weight-bold text-primary ">Véhicule : </h6>
                                    </label>
                                    <asp:Label runat="server" ID="lb_vehicule" Text="-----"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>
                                    <h6 class="m-0 font-weight-bold text-primary ">Date du panne :</h6>
                                </label>
                                <asp:Label runat="server" ID="lb_date_panne" Text="-----"></asp:Label>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label>
                                        <h6 class="m-0 font-weight-bold text-primary ">Détail :</h6>
                                    </label>
                                    <asp:Label runat="server" ID="lb_detail_panne" Text="-----"></asp:Label>
                                </div>
                            </div>






                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />

                    </Triggers>

                </asp:UpdatePanel>

            </div>
        </div>

    </div>


</asp:Content>

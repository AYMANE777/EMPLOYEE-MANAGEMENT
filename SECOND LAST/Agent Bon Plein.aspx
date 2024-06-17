<%@ Page Title="" Language="C#" MasterPageFile="~/USER.Master" AutoEventWireup="true" CodeBehind="Agent Bon Plein.aspx.cs" Inherits="SECOND_LAST.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/api.css" rel="stylesheet">


    <!-- Custom styles for this template-->
    <link href="css/dash-min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <div class="row">

                <div class="col-xl-10 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Bon Plein :</h6>
                        </div>
                        <div class="card-body">


                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label1">Date d'Ajout :</asp:Label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_bon"
                                        placeholder="Date Bon"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label2">Type de Carburant :</asp:Label></h6>
                                     <asp:DropDownList runat="server" class="form-control form-control-user" ID="ddl_type_cb" DataSourceID="SqlDataSource4" DataTextField="TYPE_CARBURANT" DataValueField="ID_CARBURANT" AutoPostBack="True">
        
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT ID_CARBURANT, TYPE_CARBURANT FROM CARBURANT">
                                    </asp:SqlDataSource>
                                </div>
                            </div>





                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:TextBox runat="server" type="Number" step="0.01" min="0" class="form-control form-control-user" ID="tb_prix"
                                        placeholder="Prix Litre"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" type="Number" step="0.01" min="0" class="form-control form-control-user" ID="tb_nombre_litre"
                                        placeholder="Nombre Litre"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Véhicule disponible :</label></h6>
                                    <asp:DropDownList runat="server" class="form-control form-control-user" ID="ddl_vehicule_dispo"
                                        placeholder="Type Carburant" DataSourceID="SqlDataSource2" DataTextField="IMATRUCULATION" DataValueField="ID_VEHICULE">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Kilometrage (Km) :</label></h6>
                                    <asp:TextBox runat="server" TextMode="Number" min="0" step="0.01" class="form-control" ID="tb_kilometrage" placeholder="Kilometrage"></asp:TextBox>
                                </div>
                            </div>




                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>
                               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT VEHICULE.ID_VEHICULE, VEHICULE.IMATRUCULATION FROM CARBURANT INNER JOIN VEHICULE ON CARBURANT.ID_CARBURANT = VEHICULE.ID_CARBURANT WHERE (CARBURANT.ID_CARBURANT = @id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddl_type_cb" Name="id" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_add_mission" runat="server" Text=" Ajouter le Bon" class="btn btn-primary btn-user btn-block" OnClick="Add_Bon"></asp:Button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_add_mission" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBinding" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>




            <div class="row">


                <div class="col-xl-12 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">List des Bons Pleins</h6>
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" DataSourceID="SqlDataSource3" DataKeyNames="ID_BON">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="ID_BON" HeaderText="ID" SortExpression="ID_BON" ReadOnly="True" />
                                    <asp:BoundField DataField="DATE_BON" HeaderText="DATE_BON" SortExpression="DATE_BON" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="PRIX_LITRE" HeaderText="Prix(Litre)" SortExpression="PRIX_LITRE" />
                                    <asp:BoundField DataField="NBR_LITRE" HeaderText="Nbr(Litre)" SortExpression="NBR_LITRE" />
                                    <asp:BoundField DataField="KILOMETRAGE" HeaderText="KILOMETRAGE" SortExpression="KILOMETRAGE" />
                                    <asp:BoundField DataField="TYPE_CARBURANT" HeaderText="CARBURANT" SortExpression="TYPE_CARBURANT" />
                                    <asp:BoundField DataField="IMATRUCULATION" HeaderText="IMATRUCULATION" SortExpression="IMATRUCULATION" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT BON_PLEIN.ID_BON, BON_PLEIN.DATE_BON, BON_PLEIN.PRIX_LITRE, BON_PLEIN.NBR_LITRE, BON_PLEIN.KILOMETRAGE, CARBURANT.TYPE_CARBURANT, VEHICULE.IMATRUCULATION FROM BON_CARBURANT INNER JOIN BON_PLEIN ON BON_CARBURANT.ID_BON = BON_PLEIN.ID_BON INNER JOIN CARBURANT ON BON_CARBURANT.ID_CARBURANT = CARBURANT.ID_CARBURANT INNER JOIN VEHICULE ON CARBURANT.ID_CARBURANT = VEHICULE.ID_CARBURANT">
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT ID_BON, DATE_BON , PRIX_LITRE , NBR_LITRE , KILOMETRAGE, TYPE FROM BON_PLEIN" UpdateCommand="UPDATE BON_PLEIN SET DATE_BON = @DATE_BON, PRIX_LITRE = @PRIX_LITRE, NBR_LITRE = @NBR_LITRE, KILOMETRAGE = @KILOMETRAGE, TYPE = @TYPE WHERE (ID_BON = @ID_BON)">
                                <UpdateParameters>
                                    <asp:Parameter Name="DATE_BON" />
                                    <asp:Parameter Name="PRIX_LITRE" />
                                    <asp:Parameter Name="NBR_LITRE" />
                                    <asp:Parameter Name="KILOMETRAGE" />
                                    <asp:Parameter Name="TYPE" />
                                    <asp:Parameter Name="ID_BON" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

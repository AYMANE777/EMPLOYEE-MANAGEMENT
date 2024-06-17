<%@ Page Title="" Language="C#" MasterPageFile="~/USER.Master" AutoEventWireup="true" CodeBehind="User Mission .aspx.cs" Inherits="SECOND_LAST.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/api.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_AGENT], [NOM],[Prenom] FROM [AGENT]"></asp:SqlDataSource>

    <div class="row">

        <div class="col-xl-7 col-lg-7">

            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Mission :</h6>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="card-body">
                            <h4 class="sub-title">Selectionner Mission :</h4>

                            <hr class="sidebar-divider my-0">
                            <br />

                            <div class="form-group">
                                <label>
                                    <h6 class="m-0 font-weight-bold text-primary ">Véhicule :</h6>
                                </label>
                                <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_vehicule" DataSourceID="SqlDataSource7" DataTextField="IMATRUCULATION" DataValueField="ID_VEHICULE"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_VEHICULE], [IMATRUCULATION] FROM [VEHICULE]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label>
                                        <h6 class="m-0 font-weight-bold text-primary ">Mission :</h6>
                                    </label>
                                    <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_mission" DataSourceID="SqlDataSource8" DataTextField="OBJET" DataValueField="ID_MISSION" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT ID_MISSION, OBJET FROM MISSION WHERE (ID_MISSION NOT IN (SELECT ID_MISSION FROM DETAIL_MISSION))"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>
                                    <h6 class="m-0 font-weight-bold text-primary ">Date du démarage :</h6>
                                </label>
                                <asp:TextBox runat="server" ID="tb_date_faire_mission" type="Date"
                                    class="form-control form-control-primary"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <legend>
                                        <label>
                                            <h6 class="m-0 font-weight-bold text-primary ">Les Accompagnats :</h6>
                                        </label>
                                    </legend>
                                    <asp:CheckBoxList ID="Cb_Liste" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource2" DataTextField="Usename" DataValueField="ID_AGENT" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" Width="100%"></asp:CheckBoxList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT NOM + ' ' + Prenom AS Usename, ID_AGENT FROM AGENT"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <h6 class="m-0 font-weight-bold text-primary ">
                                    <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="btn_add_mission" runat="server" Text=" Appliquer" class="btn btn-primary btn-user btn-block" OnClick="btn_add_mission_Click" />
                            </div>
                        </div>

                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btn_add_mission" EventName="Click" />
                    </Triggers>

                </asp:UpdatePanel>

            </div>
        </div>






        <div class="col-xl-5 col-lg-7">

            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Détail Mission :</h6>
                </div>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>

                        <div class="card-body">


                            <h4 class="sub-title">Information sur Mission :</h4>

                            <hr class="sidebar-divider my-0">
                            <br />




                            <div class="form-group">
                                <label>
                                    <h6 class="m-0 font-weight-bold text-primary ">Lieu :</h6>
                                </label>
                                <asp:Label runat="server" ID="lb_lieu_mission" Text="-----"></asp:Label>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label>
                                        <h6 class="m-0 font-weight-bold text-primary ">Object :</h6>
                                    </label>
                                    <asp:Label runat="server" ID="lb_Object_mission" Text="-----"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>
                                    <h6 class="m-0 font-weight-bold text-primary ">Date du début :</h6>
                                </label>
                                <asp:Label runat="server" ID="lb_date_debut" Text="-----"></asp:Label>
                            </div>


                            <div class="form-group">
                                <label>
                                    <h6 class="m-0 font-weight-bold text-primary ">Date du Fin :</h6>
                                </label>
                                <asp:Label runat="server" ID="lb_date_fin" Text="-----"></asp:Label>
                            </div>

                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddl_mission" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>






    </div>






    <div class="row">

        <div class="col-xl-12 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Liste des Agent</h6>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="card-body">



                            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="ID_AGENT" HeaderText="ID" SortExpression="ID_AGENT" />
                                    <asp:BoundField DataField="OBJET" HeaderText="OBJET" SortExpression="OBJET" />
                                    <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="NOM_SERVICE" HeaderText="SERVICE" SortExpression="NOM_SERVICE" />
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

                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [VEHICULE] WHERE [ID_VEHICULE] = @ID_VEHICULE" InsertCommand="INSERT INTO [VEHICULE] ([ID_VEHICULE], [IMATRUCULATION], [MATRICULE], [ID_MODELE], [ID_CATEGORIE], [ID_CARBURANT], [ID_PROPRIETAIRE], [DATE_DEBUT]) VALUES (@ID_VEHICULE, @IMATRUCULATION, @MATRICULE, @ID_MODELE, @ID_CATEGORIE, @ID_CARBURANT, @ID_PROPRIETAIRE, @DATE_DEBUT)" SelectCommand="SELECT DETAIL_MISSION.ID_AGENT, MISSION.OBJET, DETAIL_MISSION.DATE, SERVICES.NOM_SERVICE, VEHICULE.IMATRUCULATION FROM AGENT INNER JOIN DETAIL_MISSION ON AGENT.ID_AGENT = DETAIL_MISSION.ID_AGENT INNER JOIN MISSION ON DETAIL_MISSION.ID_MISSION = MISSION.ID_MISSION INNER JOIN SERVICES ON AGENT.ID_SERVICE = SERVICES.ID_SERVICE INNER JOIN VEHICULE ON DETAIL_MISSION.ID_VEHICULE = VEHICULE.ID_VEHICULE AND DETAIL_MISSION.ID_VEHICULE = VEHICULE.ID_VEHICULE WHERE (AGENT.ID_AGENT = @ID)" UpdateCommand="UPDATE VEHICULE SET IMATRUCULATION = @IMATRUCULATION, MATRICULE = @MATRICULE, ID_MODELE = @ID_MODELE, ID_CATEGORIE = @ID_CATEGORIE, ID_CARBURANT = @ID_CARBURANT, ID_PROPRIETAIRE = @ID_PROPRIETAIRE, DATE_DEBUT = @DATE_DEBUT WHERE (ID_VEHICULE = @ID_VEHICULE)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                    <asp:Parameter Name="IMATRUCULATION" Type="String" />
                                    <asp:Parameter Name="MATRICULE" Type="String" />
                                    <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                    <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                    <asp:Parameter Name="DATE_DEBUT" Type="DateTime" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="ID" SessionField="AGENT_ID" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="IMATRUCULATION" Type="String" />
                                    <asp:Parameter Name="MATRICULE" Type="String" />
                                    <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                    <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                    <asp:Parameter Name="DATE_DEBUT" Type="DateTime" />
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>

        </div>

    </div>



</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Panne.aspx.cs" Inherits="SECOND_LAST.Panne" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <div class="row">

                <div class="col-xl-8 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Panne d'une véhicule :</h6>
                        </div>
                        <div class="card-body">


                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h4 class="sub-title">Détail du Panne :</h4>

                                    <hr class="sidebar-divider my-0">
                                </div>
                            </div>



                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Véhicule :</label></h6>
                                    <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_vehicule" DataSourceID="SqlDataSource2" DataTextField="MATRICULE" DataValueField="ID_VEHICULE"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_VEHICULE], [MATRICULE] FROM [VEHICULE]"></asp:SqlDataSource>



                                </div>
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Date du Panne :</label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_panne"
                                        placeholder=""></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" TextMode="Multiline" Rows="3" class="form-control form-control-user" ID="tb_detail_panne"
                                        placeholder="Détail du Panne"></asp:TextBox>
                                </div>
                            </div>




                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>



                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_add_panne" runat="server" Text=" Ajouter Panne" class="btn btn-primary btn-user btn-block" OnClick="Add_panne"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_add_panne" EventName="Click" />
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
                            <h6 class="m-0 font-weight-bold text-primary ">Liste des Pannes</h6>
                        </div>
                        <div class="card-body">


                            

                            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_PANNE" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="ID" SortExpression="ID_PANNE">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_PANNE") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_PANNE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date du panne" SortExpression="DATE_PANNE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-user" TextMode="Date" Text='<%# Bind("DATE_PANNE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DATE_PANNE","{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VEHICULE" SortExpression="ID_VEHICULE">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="IMATRUCULATION" class="form-control form-control-user" DataValueField="ID_VEHICULE" SelectedValue='<%# Bind("ID_VEHICULE") %>'></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_VEHICULE], [IMATRUCULATION] FROM [VEHICULE]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ID_VEHICULE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Détail" SortExpression="DETAIL_PANNE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" class="form-control form-control-user" TextMode="MultiLine" runat="server" Text='<%# Bind("DETAIL_PANNE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DETAIL_PANNE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [PANNE] WHERE [ID_PANNE] = @ID_PANNE" InsertCommand="INSERT INTO [PANNE] ([ID_PANNE], [DATE_PANNE], [ID_VEHICULE], [DETAIL_PANNE]) VALUES (@ID_PANNE, @DATE_PANNE, @ID_VEHICULE, @DETAIL_PANNE)" SelectCommand="SELECT * FROM [PANNE]" UpdateCommand="UPDATE [PANNE] SET [DATE_PANNE] = @DATE_PANNE, [ID_VEHICULE] = @ID_VEHICULE, [DETAIL_PANNE] = @DETAIL_PANNE WHERE [ID_PANNE] = @ID_PANNE">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                    <asp:Parameter Name="DATE_PANNE" DbType="Date" />
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                    <asp:Parameter Name="DETAIL_PANNE" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="DATE_PANNE" DbType="Date" />
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                    <asp:Parameter Name="DETAIL_PANNE" Type="String" />
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowEditing" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCancelingEdit" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdated" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdating" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleted" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleting" />
        </Triggers>
    </asp:UpdatePanel>







    <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <div class="row">

                <div class="col-xl-12 col-lg-7">


                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Réparation du Véhicule</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">

                                <div class="col-sm-6 mobile-inputs">
                                  

                                    <h4 class="sub-title">Détail de Réparation :</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />


                                    <div class="form-group row">

                                        <div class="col-sm-6">
                                            <label>
                                                <h6 class="m-0 font-weight-bold text-primary ">Date du début :</h6>
                                            </label>
                                            <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_debut_reparation"
                                                placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-sm-6">
                                            <label>
                                                <h6 class="m-0 font-weight-bold text-primary ">Date du Fin :</h6>
                                            </label>
                                            <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_fin_reparation"
                                                placeholder=""></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="form-group row">

                                        <div class="col-sm-6">
                                            <label>
                                                <h6 class="m-0 font-weight-bold text-primary ">Prix de Réparation :</h6>
                                            </label>
                                            <asp:TextBox runat="server" type="Number" step="0.01" min="0" class="form-control form-control-user" ID="tb_prix_du_reparation"
                                                placeholder="Prix de Réparation"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-6">
                                            <label>
                                                <h6 class="m-0 font-weight-bold text-primary ">Id de Panne :</h6>
                                            </label>
                                            <asp:DropDownList runat="server" class="form-control form-control-user" ID="ddl_id_panne" DataSourceID="SqlDataSource3" DataTextField="ID_PANNE" DataValueField="ID_PANNE"></asp:DropDownList>

                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_PANNE] FROM [PANNE]"></asp:SqlDataSource>

                                        </div>
                                    </div>




                                    <div class="form-group row">
                                        <div class="col-sm-12">

                                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="3" class="form-control form-control-user" ID="tb_porteur"
                                                placeholder="Lieu est adresse du reparateur"></asp:TextBox>

                                        </div>

                                    </div>



                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="btn_add_reparation" runat="server" Text="Réparer" class="btn btn-primary btn-user btn-block" OnClick="Add_Reparation"></asp:Button>
                                        </div>
                                        <br />
                                    </div>
                                </div>


                                <div class="col-sm-6 mobile-inputs">



                                    <h4 class="sub-title">Détail de Réparation :</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />


                                    <div class="form-group row">

                                        <div class="col-sm-12">
                                            <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="TextBox3"
                                                placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-12">

                                            <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="TextBox4"
                                                placeholder=""></asp:TextBox>

                                        </div>

                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-3 mb-sm-0">

                                            <h6 class="m-0 font-weight-bold text-primary ">
                                                <asp:Label runat="server" ID="Label2"></asp:Label></h6>

                                            <asp:TextBox runat="server" type="Number" step="0.01" min="0" class="form-control form-control-user" ID="TextBox5"
                                                placeholder="Prix de Réparation"></asp:TextBox>
                                        </div>
                                    </div>



                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="Button1" runat="server" Text=" Ajouter Compte" class="btn btn-primary btn-user btn-block" OnClick="Add_panne"></asp:Button>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_add_reparation" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="DataBinding" />
        </Triggers>
    </asp:UpdatePanel>







    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div class="row">

                <div class="col-xl-12 col-lg-7">


                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Réparation du Véhicule</h6>
                        </div>
                        <div class="card-body">


                            <asp:GridView ID="GridView3" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="N_REPARATION" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="N_REPARATION" HeaderText="N° Reparation" ReadOnly="True" SortExpression="N_REPARATION" />
                                    <asp:BoundField DataField="DATE_DEBUT_REPARATION" HeaderText="Date Début" SortExpression="DATE_DEBUT_REPARATION" />
                                    <asp:BoundField DataField="DATE_FIN_REPARATION" HeaderText="Date Fin" SortExpression="DATE_FIN_REPARATION" />
                                    <asp:BoundField DataField="PRIX" HeaderText="Prix" SortExpression="PRIX" />
                                    <asp:BoundField DataField="ID_PANNE" HeaderText="Id Panne" SortExpression="ID_PANNE" />
                                    <asp:BoundField DataField="PORTER" HeaderText="Porter" SortExpression="PORTER" />
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



                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [REPARATION] WHERE [N_REPARATION] = @N_REPARATION" InsertCommand="INSERT INTO [REPARATION] ([N_REPARATION], [DATE_DEBUT_REPARATION], [DATE_FIN_REPARATION], [PRIX], [ID_PANNE], [PORTER]) VALUES (@N_REPARATION, @DATE_DEBUT_REPARATION, @DATE_FIN_REPARATION, @PRIX, @ID_PANNE, @PORTER)" SelectCommand="SELECT * FROM [REPARATION]" UpdateCommand="UPDATE [REPARATION] SET [DATE_DEBUT_REPARATION] = @DATE_DEBUT_REPARATION, [DATE_FIN_REPARATION] = @DATE_FIN_REPARATION, [PRIX] = @PRIX, [ID_PANNE] = @ID_PANNE, [PORTER] = @PORTER WHERE [N_REPARATION] = @N_REPARATION">
                                <DeleteParameters>
                                    <asp:Parameter Name="N_REPARATION" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="N_REPARATION" Type="Int32" />
                                    <asp:Parameter Name="DATE_DEBUT_REPARATION" Type="DateTime" />
                                    <asp:Parameter Name="DATE_FIN_REPARATION" Type="DateTime" />
                                    <asp:Parameter Name="PRIX" Type="Decimal" />
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                    <asp:Parameter Name="PORTER" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="DATE_DEBUT_REPARATION" Type="DateTime" />
                                    <asp:Parameter Name="DATE_FIN_REPARATION" Type="DateTime" />
                                    <asp:Parameter Name="PRIX" Type="Decimal" />
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                    <asp:Parameter Name="PORTER" Type="String" />
                                    <asp:Parameter Name="N_REPARATION" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
















</asp:Content>

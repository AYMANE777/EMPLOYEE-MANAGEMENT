<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Add Véhicule.aspx.cs" Inherits="SECOND_LAST.Add_Véhicule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
    <div class="row">


        <div class="col-xl-12 col-lg-7">


            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Ajouter une Véhicule</h6>
                </div>
                <div class="card-body">
                    

                      
                            <div class="row">

                                <div class="col-sm-6 mobile-inputs">
                                    <h4 class="sub-title">Véhicule</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />

                                    <div class="form-group">
                                        <label>
                                            <h6 class="m-0 font-weight-bold text-primary ">Imatriculation :</h6>
                                        </label>
                                        <asp:TextBox runat="server" ID="tb_immatriculation" type="text"
                                            class="form-control form-control-primary"
                                            placeholder="Imatriculation"></asp:TextBox>
                                    </div>


                                    <div class="form-group">
                                        <label>
                                            <h6 class="m-0 font-weight-bold text-primary ">Matricule :</h6>
                                        </label>
                                        <asp:TextBox runat="server" ID="tb_matricule" type="text"
                                            class="form-control form-control-primary"
                                            placeholder="Matricule"></asp:TextBox>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <label>
                                                <h6 class="m-0 font-weight-bold text-primary ">Modéle :</h6>
                                            </label>
                                            <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_modele" DataSourceID="SqlDataSource1" DataTextField="MARQUE" DataValueField="ID_MODELE">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_MODELE], [MARQUE] FROM [MODELE]"></asp:SqlDataSource>
                                        </div>
                                    </div>



                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <label>
                                                <h6 class="m-0 font-weight-bold text-primary ">Catégorie :</h6>
                                            </label>
                                            <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_categorie" DataSourceID="SqlDataSource2" DataTextField="LIB_CATEGORIE" DataValueField="ID_CATEGORIE">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_CATEGORIE], [LIB_CATEGORIE] FROM [CATEGORIE]"></asp:SqlDataSource>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <h6 class="m-0 font-weight-bold text-primary ">
                                            <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>

                                    </div>

                                </div>

                                <div class="col-sm-6 mobile-inputs">
                                    <h4 class="sub-title">Détail de Véhicule</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />

                                    <div class="form-group">
                                        <label>
                                            <h6 class="m-0 font-weight-bold text-primary ">Carburant :</h6>
                                        </label>
                                        <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_carburant" DataSourceID="SqlDataSource3" DataTextField="TYPE_CARBURANT" DataValueField="ID_CARBURANT">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_CARBURANT], [TYPE_CARBURANT] FROM [CARBURANT]"></asp:SqlDataSource>
                                    </div>


                                    <div class="form-group">
                                        <label>
                                            <h6 class="m-0 font-weight-bold text-primary ">Proprietaire :</h6>
                                        </label>
                                        <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_proprietaire" DataSourceID="SqlDataSource4" DataTextField="INTITULER" DataValueField="ID_PROPRIETAIRE">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_PROPRIETAIRE], [INTITULER] FROM [PROPRIETAIRE]"></asp:SqlDataSource>
                                    </div>



                                    <div class="form-group">
                                        <label>
                                            <h6 class="m-0 font-weight-bold text-primary ">Date de Début :</h6>
                                        </label>
                                        <asp:TextBox runat="server" ID="tb_date_debut" type="Date"
                                            class="form-control form-control-primary"
                                            placeholder="Date Début du Voiture "></asp:TextBox>
                                    </div><br />
                                     <div class="form-group">
                                    <asp:Button ID="btn_Add_Vehicule" runat="server" Text=" Ajouter Véhicule" class="btn btn-primary btn-user btn-block" OnClick="btn_Add_Vehicule_Click" />
                                </div>

                                </div>

                               

                            </div>
                          
                    

                </div>

            </div>
        </div>
    </div>
               </ContentTemplate>
      <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_Add_Vehicule" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBinding" />
                        </Triggers>
                </asp:UpdatePanel>

     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
          <ContentTemplate>
    <div class="row">

        <div class="col-xl-12 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Liste des Véhicules</h6>
                </div>
               
                   
                        <div class="card-body">
                           
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" Width="100%" GridLines="None" OnRowCommand="commande" DataKeyNames="ID_VEHICULE" OnRowDataBound="GridView1_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1"  runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                          
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID" SortExpression="ID_VEHICULE">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_VEHICULE") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ID_VEHICULE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IMATRUCULATION" SortExpression="IMATRUCULATION">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-primary" runat="server" Text='<%# Bind("IMATRUCULATION") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("IMATRUCULATION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MATRICULE" SortExpression="MATRICULE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-primary" runat="server" Text='<%# Bind("MATRICULE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("MATRICULE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MODELE" SortExpression="ID_MODELE">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList22" class="browser-default custom-select" runat="server" DataSourceID="SqlDataSourceM" DataTextField="MARQUE" DataValueField="ID_MODELE" SelectedValue='<%# Bind("ID_MODELE") %>' ></asp:DropDownList>                                          
                                            <asp:SqlDataSource ID="SqlDataSourceM" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_MODELE], [MARQUE] FROM [MODELE]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ID_MODELE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CATEGORIE" SortExpression="ID_CATEGORIE">
                                        <EditItemTemplate>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_CATEGORIE], [LIB_CATEGORIE] FROM [CATEGORIE]"></asp:SqlDataSource>
                                            <asp:DropDownList ID="DropDownList2" class="browser-default custom-select" runat="server" DataSourceID="SqlDataSource6" DataTextField="LIB_CATEGORIE" DataValueField="ID_CATEGORIE" SelectedValue='<%# Bind("ID_CATEGORIE") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_CATEGORIE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CARBURANT" SortExpression="ID_CARBURANT">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" class="browser-default custom-select" runat="server" DataSourceID="SqlDataSource7" DataTextField="TYPE_CARBURANT" DataValueField="ID_CARBURANT" SelectedValue='<%# Bind("ID_CARBURANT") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_CARBURANT], [TYPE_CARBURANT] FROM [CARBURANT]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ID_CARBURANT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PROPRIETAIRE" SortExpression="ID_PROPRIETAIRE">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList4" class="browser-default custom-select" runat="server" DataSourceID="SqlDataSource8" DataTextField="INTITULER" DataValueField="ID_PROPRIETAIRE" SelectedValue='<%# Bind("ID_PROPRIETAIRE") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_PROPRIETAIRE], [INTITULER] FROM [PROPRIETAIRE]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ID_PROPRIETAIRE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DEBUT" SortExpression="DATE_DEBUT">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" TextMode="Date" class="form-control form-control-primary" runat="server" Text='<%# Bind("DATE_DEBUT") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("DATE_DEBUT", "{0:d}") %>'></asp:Label>
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



                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT * FROM [VEHICULE]" UpdateCommand="UPDATE [VEHICULE] SET [IMATRUCULATION] = @IMATRUCULATION, [MATRICULE] = @MATRICULE, [ID_MODELE] = @ID_MODELE, [ID_CATEGORIE] = @ID_CATEGORIE, [ID_CARBURANT] = @ID_CARBURANT, [ID_PROPRIETAIRE] = @ID_PROPRIETAIRE, [DATE_DEBUT] = @DATE_DEBUT WHERE [ID_VEHICULE] = @original_ID_VEHICULE" DeleteCommand="DELETE FROM [VEHICULE] WHERE [ID_VEHICULE] = @original_ID_VEHICULE" InsertCommand="INSERT INTO [VEHICULE] ([ID_VEHICULE], [IMATRUCULATION], [MATRICULE], [ID_MODELE], [ID_CATEGORIE], [ID_CARBURANT], [ID_PROPRIETAIRE], [DATE_DEBUT]) VALUES (@ID_VEHICULE, @IMATRUCULATION, @MATRICULE, @ID_MODELE, @ID_CATEGORIE, @ID_CARBURANT, @ID_PROPRIETAIRE, @DATE_DEBUT)" OldValuesParameterFormatString="original_{0}">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ID_VEHICULE" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                    <asp:Parameter Name="IMATRUCULATION" Type="String" />
                                    <asp:Parameter Name="MATRICULE" Type="String" />
                                    <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                    <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="DATE_DEBUT" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="IMATRUCULATION" Type="String" />
                                    <asp:Parameter Name="MATRICULE" Type="String" />
                                    <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                    <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                    <asp:Parameter Name="DATE_DEBUT" DbType="Date" />
                                    <asp:Parameter Name="original_ID_VEHICULE" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>

                   
            </div>
        </div>
    </div>
              </ContentTemplate>
          <Triggers>
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowEditing" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdating" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdated" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleting" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleted" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDataBound" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCreated" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCancelingEdit" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PreRender" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanged" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="Load" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBinding" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBound" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="Init" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="CreatingModelDataSource" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="CallingDataMethods" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="Unload" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="CreatingModelDataSource" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="Sorted" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="Sorting" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="Disposed" />
             
          </Triggers>
    </asp:UpdatePanel>
    
    
</asp:Content>

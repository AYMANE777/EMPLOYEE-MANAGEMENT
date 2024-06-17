<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Categorie and modele.aspx.cs" Inherits="SECOND_LAST.Categorie_and_modele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <div class="row">


                <div class="col-xl-12 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Ajouter Catégorie de Véhicule</h6>
                        </div>
                        <div class="card-body">

                            <div class="row">

                                <div class="col-sm-5 mobile-inputs">
                                    <h4 class="sub-title">Catégorie</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />


                                    <form>
                                      


                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="tb_libeller" TextMode="MultiLine" type="text"
                                                class="form-control form-control-primary"
                                                placeholder="Libeller Catégorie"></asp:TextBox>
                                        </div>

                                        <div class="form-group">
                                            <asp:Button ID="btn_Add_Categorie" runat="server" Text=" Ajouter Catégorie" class="btn btn-primary btn-user btn-block" OnClick="Add_Categorie" />
                                        </div>
                                        <div class="form-group">
                                            <h6 class="m-0 font-weight-bold text-primary ">
                                                <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-7 mobile-inputs">
                                    <h4 class="sub-title">Listes Des Catégories</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_CATEGORIE" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:TemplateField HeaderText="Id Catégorie" SortExpression="ID_CATEGORIE">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_CATEGORIE") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_CATEGORIE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Libeller" SortExpression="LIB_CATEGORIE">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" class="form-control form-control-primary" runat="server" Text='<%# Bind("LIB_CATEGORIE") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LIB_CATEGORIE") %>'></asp:Label>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [CATEGORIE] WHERE [ID_CATEGORIE] = @ID_CATEGORIE" InsertCommand="INSERT INTO [CATEGORIE] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (@ID_CATEGORIE, @LIB_CATEGORIE)" SelectCommand="SELECT * FROM [CATEGORIE]" UpdateCommand="UPDATE [CATEGORIE] SET [LIB_CATEGORIE] = @LIB_CATEGORIE WHERE [ID_CATEGORIE] = @ID_CATEGORIE">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                            <asp:Parameter Name="LIB_CATEGORIE" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="LIB_CATEGORIE" Type="String" />
                                            <asp:Parameter Name="ID_CATEGORIE" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-xl-12 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Ajouter un Modéle de Véhicule</h6>
                        </div>
                        <div class="card-body">

                            <div class="row">

                                <div class="col-sm-4 mobile-inputs">
                                    <h4 class="sub-title">Modéle</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="tb_marque_modele" type="text"
                                            class="form-control form-control-primary"
                                            placeholder="Marque"></asp:TextBox>
                                    </div>


                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="tb_lib_modele" TextMode="MultiLine" type="text"
                                            class="form-control form-control-primary"
                                            placeholder="Libeller Modele"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <h6 class="m-0 font-weight-bold text-primary ">
                                            <asp:Label runat="server" ID="lb_cas_erreur_modele"></asp:Label></h6>

                                    </div>

                                    <div class="form-group">
                                        <asp:Button ID="btn_add_Modele" runat="server" Text="Ajouter le Modéle" class="btn btn-primary btn-user btn-block" OnClick="btn_add_Modele_Click" />
                                    </div>
                                </div>
                                <div class="col-sm-8 mobile-inputs">
                                    <h4 class="sub-title">Listes Des Modéles</h4>

                                    <hr class="sidebar-divider my-0">
                                    <br />
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" Width="100%" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID_MODELE">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True" />
                                            <asp:BoundField DataField="ID_MODELE" HeaderText="Id Modele" ReadOnly="True" SortExpression="ID_MODELE" />
                                            <asp:TemplateField HeaderText="Marque" SortExpression="MARQUE">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" class="form-control form-control-primary" runat="server" Text='<%# Bind("MARQUE") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MARQUE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Libeller" SortExpression="LIBELLER_MODEL">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" class="form-control form-control-primary" runat="server" Text='<%# Bind("LIBELLER_MODEL") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LIBELLER_MODEL") %>'></asp:Label>
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [MODELE] WHERE [ID_MODELE] = @ID_MODELE" InsertCommand="INSERT INTO [MODELE] ([ID_MODELE], [MARQUE], [LIBELLER_MODEL]) VALUES (@ID_MODELE, @MARQUE, @LIBELLER_MODEL)" SelectCommand="SELECT * FROM [MODELE]" UpdateCommand="UPDATE [MODELE] SET [MARQUE] = @MARQUE, [LIBELLER_MODEL] = @LIBELLER_MODEL WHERE [ID_MODELE] = @ID_MODELE">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                            <asp:Parameter Name="MARQUE" Type="String" />
                                            <asp:Parameter Name="LIBELLER_MODEL" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="MARQUE" Type="String" />
                                            <asp:Parameter Name="LIBELLER_MODEL" Type="String" />
                                            <asp:Parameter Name="ID_MODELE" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_Add_Categorie" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btn_add_Modele" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>








</asp:Content>

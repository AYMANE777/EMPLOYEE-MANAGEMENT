<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Carburant.aspx.cs" Inherits="SECOND_LAST.Carburant1" %>

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

                <div class="col-xl-6 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Carburant :</h6>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Nom du Carburant :</label></h6>
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_nom_carburant"
                                        placeholder="Carburant"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Date d'ajout :</label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_carburant"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_add_carburant" runat="server" Text=" Ajouter le Carburant" class="btn btn-primary btn-user btn-block" OnClick="Add_Carburant"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_add_carburant" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>



    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <div class="row">


                <div class="col-xl-12 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Listes des Carburants</h6>
                        </div>
                        <div class="card-body">



                            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="ID_CARBURANT" DataSourceID="SqlDataSource1">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="Id" SortExpression="ID_CARBURANT">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_CARBURANT") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_CARBURANT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Carburant" SortExpression="TYPE_CARBURANT">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-user" runat="server" Text='<%# Bind("TYPE_CARBURANT") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TYPE_CARBURANT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date Ajout" SortExpression="DATE_ADD_CARBURANT">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-user" TextMode="Date" runat="server" Text='<%# Bind("DATE_ADD_CARBURANT") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3"  runat="server" Text='<%# Bind("DATE_ADD_CARBURANT","{0:d}") %>'></asp:Label>
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






                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT * FROM [CARBURANT]" UpdateCommand="UPDATE [CARBURANT] SET [TYPE_CARBURANT] = @TYPE_CARBURANT, [DATE_ADD_CARBURANT] = @DATE_ADD_CARBURANT WHERE [ID_CARBURANT] = @ID_CARBURANT" DeleteCommand="DELETE FROM [CARBURANT] WHERE [ID_CARBURANT] = @ID_CARBURANT" InsertCommand="INSERT INTO [CARBURANT] ([ID_CARBURANT], [TYPE_CARBURANT], [DATE_ADD_CARBURANT]) VALUES (@ID_CARBURANT, @TYPE_CARBURANT, @DATE_ADD_CARBURANT)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                    <asp:Parameter Name="TYPE_CARBURANT" Type="String" />
                                    <asp:Parameter Name="DATE_ADD_CARBURANT" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="TYPE_CARBURANT" Type="String" />
                                    <asp:Parameter Name="DATE_ADD_CARBURANT" Type="DateTime" />
                                    <asp:Parameter Name="ID_CARBURANT" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>

                    </div>
                </div>

            </div>






        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

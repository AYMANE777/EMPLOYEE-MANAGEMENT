<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Bon Plein.aspx.cs" Inherits="SECOND_LAST.Carburant" %>


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

                <div class="col-xl-8 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Bon Plein </h6>
                        </div>
                        <div class="card-body">


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label1">Date d'Ajout :</asp:Label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_bon"
                                        placeholder="Date Bon"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:TextBox runat="server" type="Number" step="0.01" min="0" class="form-control form-control-user" ID="tb_prix"
                                        placeholder="Prix Litre"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" TextMode="Number" step="0.01"  min="0" class="form-control form-control-user" ID="tb_nombre_litre"
                                        placeholder="Nombre Litre"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Type de Carburant :</label></h6>
                                    <asp:DropDownList runat="server" class="form-control form-control-user" ID="ddl_type_carburant"
                                        placeholder="Type Carburant" DataSourceID="SqlDataSource2" DataTextField="TYPE_CARBURANT" DataValueField="ID_CARBURANT">
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

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_add_mission" runat="server" Text=" Ajouter le Bon" class="btn btn-primary btn-user btn-block" OnClick="Add_Bon"></asp:Button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [TYPE_CARBURANT], [ID_CARBURANT] FROM [CARBURANT]"></asp:SqlDataSource>


                 

                 <div class="col-xl-4 col-lg-7">
                   
                     
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
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="ID_BON" HeaderText="ID" SortExpression="ID_BON" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="Date de bon" SortExpression="DATE_BON">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" TextMode="Date" class="form-control form-control-user" runat="server" Text='<%# Bind("DATE_BON") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DATE_BON", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prix(Litre)" SortExpression="PRIX_LITRE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-user" TextMode="Number" min="0" runat="server" Text='<%# Bind("PRIX_LITRE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PRIX_LITRE", "{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Litre" SortExpression="NBR_LITRE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" class="form-control form-control-user" TextMode="Number" min="0" runat="server" Text='<%# Bind("NBR_LITRE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("NBR_LITRE", "{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Kilometrage" SortExpression="KILOMETRAGE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" class="form-control form-control-user" TextMode="Number" min="0" runat="server" Text='<%# Bind("KILOMETRAGE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("KILOMETRAGE", "{0:0.00}") %>'></asp:Label>
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






                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT * FROM [BON_PLEIN]" DeleteCommand="DELETE FROM [BON_PLEIN] WHERE [ID_BON] = @ID_BON" InsertCommand="INSERT INTO [BON_PLEIN] ([ID_BON], [DATE_BON], [PRIX_LITRE], [NBR_LITRE], [KILOMETRAGE]) VALUES (@ID_BON, @DATE_BON, @PRIX_LITRE, @NBR_LITRE, @KILOMETRAGE)" UpdateCommand="UPDATE [BON_PLEIN] SET [DATE_BON] = @DATE_BON, [PRIX_LITRE] = @PRIX_LITRE, [NBR_LITRE] = @NBR_LITRE, [KILOMETRAGE] = @KILOMETRAGE WHERE [ID_BON] = @ID_BON">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_BON" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_BON" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="DATE_BON" />
                                    <asp:Parameter Name="PRIX_LITRE" Type="Decimal" />
                                    <asp:Parameter Name="NBR_LITRE" Type="Double" />
                                    <asp:Parameter Name="KILOMETRAGE" Type="Double" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter DbType="Date" Name="DATE_BON" />
                                    <asp:Parameter Name="PRIX_LITRE" Type="Decimal" />
                                    <asp:Parameter Name="NBR_LITRE" Type="Double" />
                                    <asp:Parameter Name="KILOMETRAGE" Type="Double" />
                                    <asp:Parameter Name="ID_BON" Type="Int32" />
                                </UpdateParameters>
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

     <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="Package/chart.js/Chart.min.js"></script>


   




</asp:Content>

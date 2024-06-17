<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="SECOND_LAST.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/api.css" rel="stylesheet">


    <!-- Custom styles for this template-->
    <link href="css/dash-min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-xl-6 col-lg-7">

                    <!-- Area Chart -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Ajouter un Service</h6>
                        </div>
                        <div class="card-body">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>

                            <div class="form-group row">
                             
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_nom_service"
                                        placeholder="Nom Service"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <asp:TextBox runat="server" TextMode="MultiLine" type="text" class="form-control form-control-user" ID="tb_description"
                                        placeholder="Description"></asp:TextBox>
                                </div>
                            </div>
                          

                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>
                            <br />
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button runat="server" class="btn btn-primary btn-user btn-block" Text="Ajouter Service" ID="btn_add_services" OnClick="Add_Service"></asp:Button>
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
                            <h6 class="m-0 font-weight-bold text-primary ">Liste des Services</h6>
                        </div>
                        <div class="card-body">


                            <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_SERVICE" DataSourceID="SqlDataSource1">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="ID_SERVICE" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_SERVICE" />
                                    <asp:TemplateField HeaderText="SERVICE" SortExpression="NOM_SERVICE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-user"  runat="server" Text='<%# Bind("NOM_SERVICE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NOM_SERVICE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DESCRIPTION" SortExpression="DESCRIPTION">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-user" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
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




                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT * FROM [SERVICES]" UpdateCommand="UPDATE [SERVICES] SET [NOM_SERVICE] = @NOM_SERVICE, [DESCRIPTION] = @DESCRIPTION WHERE [ID_SERVICE] = @ID_SERVICE" DeleteCommand="DELETE FROM [SERVICES] WHERE [ID_SERVICE] = @ID_SERVICE" InsertCommand="INSERT INTO [SERVICES] ([NOM_SERVICE], [DESCRIPTION]) VALUES (@NOM_SERVICE, @DESCRIPTION)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_SERVICE" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="NOM_SERVICE" Type="String" />
                                    <asp:Parameter Name="DESCRIPTION" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="NOM_SERVICE" Type="String" />
                                    <asp:Parameter Name="DESCRIPTION" Type="String" />
                                    <asp:Parameter Name="ID_SERVICE" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_add_services" />
        </Triggers>
    </asp:UpdatePanel>







</asp:Content>

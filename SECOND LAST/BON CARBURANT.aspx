<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="BON CARBURANT.aspx.cs" Inherits="SECOND_LAST.BON_CARBURANT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/api.css" rel="stylesheet">


    <!-- Custom styles for this template-->
    <link href="css/dash-min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID_CARBURANT" HeaderText="ID" ReadOnly="True" SortExpression="ID_CARBURANT" />
                            <asp:TemplateField HeaderText="TYPE" SortExpression="TYPE_CARBURANT">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control form-control-user" Text='<%# Bind("TYPE_CARBURANT") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TYPE_CARBURANT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Ajout" SortExpression="DATE_ADD_CARBURANT">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" type="Date" class="form-control form-control-user" Text='<%# Bind("DATE_ADD_CARBURANT") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DATE_ADD_CARBURANT") %>'></asp:Label>
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






                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>






                </div>

            </div>
        </div>

    </div>
</asp:Content>

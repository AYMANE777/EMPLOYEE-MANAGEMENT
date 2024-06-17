<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Mission.aspx.cs" Inherits="SECOND_LAST.Mission" %>

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
                            <h6 class="m-0 font-weight-bold text-primary ">Ajouter une Mission</h6>
                        </div>
                        <div class="card-body">


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_objet_mission"
                                        placeholder="Objet du Mission"></asp:TextBox>
                                </div>
                            </div>





                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Date Début :</label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_debut"
                                        placeholder="Date Début"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <label>Date Fin :</label></h6>
                                    <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_fin"
                                        placeholder="Date Fin"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group green-border-focus">
                                <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="tb_lieu_mission" Rows="3" placeholder="Lieu"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_add_mission" runat="server" Text=" Ajouter Mission" class="btn btn-primary btn-user btn-block" OnClick="Ajouter_mission"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-12 col-lg-7">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Liste des Missions</h6>
                        </div>
                        <div class="card-body">

                            <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_MISSION" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" ValidationGroup="G1" CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID_MISSION" HeaderText="ID" ReadOnly="True" SortExpression="ID_MISSION" />
                                    <asp:TemplateField HeaderText="OBJET" SortExpression="OBJET">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-user" runat="server" Text='<%# Bind("OBJET") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="G1" runat="server" ControlToValidate="TextBox1" ForeColor="Red" ErrorMessage="Champ Obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("OBJET") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DEBUT" SortExpression="DATE_DEBUT">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-user" TextMode="Date" runat="server" Text='<%# Bind("DATE_DEBUT") %>'></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ValidationGroup="G1" ForeColor="Red" ErrorMessage="Champ Obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DATE_DEBUT", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FIN" SortExpression="DATE_FIN">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" class="form-control form-control-user" TextMode="Date" runat="server" Text='<%# Bind("DATE_FIN") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="G1" runat="server" ControlToValidate="TextBox3" ForeColor="Red" ErrorMessage="Champ Obligatoire"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" ValidationGroup="G1" ControlToCompare="TextBox2" ControlToValidate="TextBox3" runat="server" ForeColor="Red" ErrorMessage="Date incorrect" Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("DATE_FIN", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="LIEU" SortExpression="LIEU">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" class="form-control form-control-user" TextMode="MultiLine" runat="server" Text='<%# Bind("LIEU") %>'></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ValidationGroup="G1" ForeColor="Red" ErrorMessage="Champ Obligatoire"></asp:RequiredFieldValidator>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("LIEU") %>'></asp:Label>
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



                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT * FROM [MISSION]" UpdateCommand="UPDATE [MISSION] SET [OBJET] = @OBJET, [DATE_DEBUT] = @DATE_DEBUT, [DATE_FIN] = @DATE_FIN, [LIEU] = @LIEU WHERE [ID_MISSION] = @ID_MISSION" DeleteCommand="DELETE FROM [MISSION] WHERE [ID_MISSION] = @ID_MISSION" InsertCommand="INSERT INTO [MISSION] ([ID_MISSION], [OBJET], [DATE_DEBUT], [DATE_FIN], [LIEU]) VALUES (@ID_MISSION, @OBJET, @DATE_DEBUT, @DATE_FIN, @LIEU)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_MISSION" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_MISSION" Type="Int32" />
                                    <asp:Parameter Name="OBJET" Type="String" />
                                    <asp:Parameter DbType="Date" Name="DATE_DEBUT" />
                                    <asp:Parameter DbType="Date" Name="DATE_FIN" />
                                    <asp:Parameter Name="LIEU" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="OBJET" Type="String" />
                                    <asp:Parameter DbType="Date" Name="DATE_DEBUT" />
                                    <asp:Parameter DbType="Date" Name="DATE_FIN" />
                                    <asp:Parameter Name="LIEU" Type="String" />
                                    <asp:Parameter Name="ID_MISSION" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>
        </contenttemplate>
        <triggers>
            <asp:asyncpostbacktrigger controlid="btn_add_mission" eventname="click" />
        </triggers>
    </asp:updatepanel>


</asp:Content>

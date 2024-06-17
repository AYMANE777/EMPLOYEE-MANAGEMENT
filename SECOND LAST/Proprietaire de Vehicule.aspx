<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Proprietaire de Vehicule.aspx.cs" Inherits="SECOND_LAST.Proprietaire_de_Vehicule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/api.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">

                <div class="col-sm-7 mobile-inputs">
                    <div class="card shadow mb-4">


                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Propriétaire </h6>
                        </div>
                        <div class="card-body">
                            <h4 class="sub-title">Detail Propriétaire</h4>

                            <hr class="sidebar-divider my-0">
                            <br />

                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="tb_intituler" type="text"
                                        class="form-control form-control-primary"
                                        placeholder="Intituler" Required></asp:TextBox>
                                </div>


                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="tb_adresse_prop" type="text"
                                        class="form-control form-control-primary"
                                        placeholder="Adresse"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="tb_tel_prop" type="tel"
                                        class="form-control form-control-primary"
                                        placeholder="Téléphone " Required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="tb_email_prop" type="Email"
                                        class="form-control form-control-primary"
                                        placeholder="Email" Required></asp:TextBox>
                                </div>



                                <div class="form-group">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>

                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btn_Add_Proprietaire" runat="server" Text=" Ajouter Propriétaire" class="btn btn-primary btn-user btn-block" OnClick="ADD_PROPRIETAIRE" />
                                </div>                       
                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_Add_Proprietaire" EventName="Click" />

        </Triggers>
    </asp:UpdatePanel>

    
            <div class="row">

                <div class="col-sm-12 mobile-inputs">
                    <div class="card shadow mb-4">


                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary ">Listes Proprietaires  : </h6>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
                        <div class="card-body">



                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_PROPRIETAIRE" DataSourceID="SqlDataSource33" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="ID" SortExpression="ID_PROPRIETAIRE">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_PROPRIETAIRE") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_PROPRIETAIRE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="INTITULER" SortExpression="INTITULER">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-primary" runat="server" Text='<%# Bind("INTITULER") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="G1" Text="*" ErrorMessage="Champs obligatoir "></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("INTITULER") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ADRESSE" SortExpression="ADRESSE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-primary" TextMode="MultiLine" runat="server" Text='<%# Bind("ADRESSE") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" Text="*" ForeColor="Red" ValidationGroup="G1" ErrorMessage="Champs obligatoir "></asp:RequiredFieldValidator>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ADRESSE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TELEPHONE" SortExpression="TELEPHONE">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" TextMode="Phone" class="form-control form-control-primary" runat="server" Text='<%# Bind("TELEPHONE") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" Text="*" ForeColor="Red" ValidationGroup="G1" ErrorMessage="Champs obligatoir "></asp:RequiredFieldValidator>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("TELEPHONE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EMAIL" SortExpression="EMAIL">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" TextMode="Email" class="form-control form-control-primary" runat="server" Text='<%# Bind("EMAIL") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Text="*" ForeColor="Red" ValidationGroup="G1" ErrorMessage="Champs obligatoir "></asp:RequiredFieldValidator>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
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



                            <asp:SqlDataSource ID="SqlDataSource33" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [PROPRIETAIRE] WHERE [ID_PROPRIETAIRE] = @ID_PROPRIETAIRE" InsertCommand="INSERT INTO [PROPRIETAIRE] ([ID_PROPRIETAIRE], [INTITULER], [ADRESSE], [TELEPHONE], [EMAIL]) VALUES (@ID_PROPRIETAIRE, @INTITULER, @ADRESSE, @TELEPHONE, @EMAIL)" SelectCommand="SELECT * FROM [PROPRIETAIRE]" UpdateCommand="UPDATE [PROPRIETAIRE] SET [INTITULER] = @INTITULER, [ADRESSE] = @ADRESSE, [TELEPHONE] = @TELEPHONE, [EMAIL] = @EMAIL WHERE [ID_PROPRIETAIRE] = @ID_PROPRIETAIRE">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                    <asp:Parameter Name="INTITULER" Type="String" />
                                    <asp:Parameter Name="ADRESSE" Type="String" />
                                    <asp:Parameter Name="TELEPHONE" Type="String" />
                                    <asp:Parameter Name="EMAIL" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="INTITULER" Type="String" />
                                    <asp:Parameter Name="ADRESSE" Type="String" />
                                    <asp:Parameter Name="TELEPHONE" Type="String" />
                                    <asp:Parameter Name="EMAIL" Type="String" />
                                    <asp:Parameter Name="ID_PROPRIETAIRE" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>



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
                    </div>
                </div>
            </div>

       

</asp:Content>

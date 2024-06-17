<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="SECOND_LAST.Inscription" %>

<%@ Import Namespace="SECOND_LAST.Classes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/api.css" rel="stylesheet">


    <!-- Custom styles for this template-->
    <link href="css/dash-min.css" rel="stylesheet">

    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%= img_Agent.ClientID %>').prop('src', e.target.result).width(200).height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }

        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>





    <div class="row">

        <div class="col-xl-12 col-lg-7">


            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Ajouter un Agent!</h6>
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-sm-8 mobile-inputs">
                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>--%>
                            <h4 class="sub-title">Détail D'Agent :</h4>

                            <hr class="sidebar-divider my-0">
                            <br />

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_nom"
                                        placeholder="Nom"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_prenom"
                                        placeholder="Prénom"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_cin"
                                        placeholder="CIN"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" type="tel" class="form-control form-control-user" ID="tb_tel"
                                        placeholder="Téléphone"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" type="email" class="form-control form-control-user" ID="tb_email"
                                        placeholder="Email Address"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <asp:TextBox runat="server" type="password" class="form-control form-control-user"
                                        ID="tb_pass" placeholder="Password"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" type="password" class="form-control form-control-user"
                                        ID="tb_cofirm_pass" placeholder="Confirmer Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="tb_adresse"
                                        placeholder="Address"></asp:TextBox>
                                </div>
                            </div>




                            <div class="form-group row">
                                <div class="col-sm-12">

                                    <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_Service" DataSourceID="SqlDataSource1" DataTextField="NOM_SERVICE" DataValueField="ID_SERVICE">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_SERVICE], [NOM_SERVICE] FROM [SERVICES]"></asp:SqlDataSource>
                                </div>
                            </div>




                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label id="lb_type">type :</label><br />
                                    <div class="form-check form-check-inline">
                                        <asp:RadioButton runat="server" class="form-check-input" type="radio" GroupName="G1" name="inlineRadioOptions" ID="radio_A" value="A" />
                                        <label class="form-check-label" for="inlineRadio1">Accompagneur</label>
                                    </div>
                                    <div class="form-check form-check-inline" style="left: 0px; top: 0px">
                                        <asp:RadioButton runat="server" class="form-check-input" type="radio" GroupName="G1" name="inlineRadioOptions" ID="radio_C" value="C" />
                                        <label class="form-check-label" for="inlineRadio2">Chauffeur</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <asp:RadioButton runat="server" class="form-check-input" type="radio" GroupName="G1" name="inlineRadioOptions" ID="radio_CA" value="CA" />
                                        <label class="form-check-label" for="inlineRadio3">Les deux</label>
                                    </div>
                                </div>
                            </div>



                            <br />

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>




                        </div>


                        <div class="col-sm-4 mobile-inputs">



                            <h4 class="sub-title">Photo :</h4>

                            <hr class="sidebar-divider my-0">
                            <br />


                            <div class="form-group row">


                                <div class="col-sm-12">
                                    <asp:Image runat="server" ID="img_Agent" ImageUrl="/Image/no-image.png" class="rounded rounded mx-auto d-block" alt="No image" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">


                                    <asp:FileUpload runat="server" class="btn btn-primary btn-user btn-block" ID="FileUpload_img" onchange="ImagePreview(this)" />
                                </div>


                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_image_erreur"></asp:Label></h6>
                                </div>
                            </div>

                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:Button ID="btn_Add_Account" runat="server" Text=" Ajouter Compte" class="btn btn-primary btn-user btn-block" OnClick="Add_Agent"></asp:Button>
                                </div>
                                <br />
                            </div>
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
                    <h6 class="m-0 font-weight-bold text-primary ">Liste des Agent</h6>
                </div>
                <div class="card-body">
                  
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                           
                            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_AGENT" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" >
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" ValidationGroup="G2" CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID_AGENT" HeaderText="ID" ReadOnly="True" SortExpression="ID_AGENT" />
                                    <asp:TemplateField HeaderText="NOM" SortExpression="NOM">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-user" runat="server" Text='<%# Bind("NOM") %>'></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NOM") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prenom" SortExpression="Prenom">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" class="form-control form-control-user" runat="server" Text='<%# Bind("Prenom") %>'></asp:TextBox>
                                                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Prenom") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CIN" SortExpression="CIN">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" class="form-control form-control-user" runat="server" Text='<%# Bind("CIN") %>'></asp:TextBox>
                                                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox3" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CIN") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TELEPHONE" SortExpression="TELEPHONE">
                                        <EditItemTemplate>
                                          <asp:TextBox ID="TextBox4" class="form-control form-control-user" TextMode="Phone" runat="server" Text='<%# Bind("TELEPHONE") %>'></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBox4" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("TELEPHONE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EMAIL" SortExpression="EMAIL">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" class="form-control form-control-user" TextMode="Email" runat="server" Text='<%# Bind("EMAIL") %>'></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox5" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DATE" SortExpression="Date_Ajout">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" class="form-control form-control-user" TextMode="Date" runat="server" Text='<%# Bind("Date_Ajout") %>'></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBox6" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                               <asp:Label ID="Label6" runat="server" Text='<%# Bind("Date_Ajout", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TYPE" SortExpression="TYPE">
                                        <EditItemTemplate>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="form-check form-check-inline" SelectedValue='<%# Bind("TYPE") %>'>
                                                <asp:ListItem Value="C">Chauffeur</asp:ListItem>
                                                <asp:ListItem Value="A">Accompagnateur</asp:ListItem>
                                                <asp:ListItem Value="CA">Chauff/Accomp</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("TYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SERVICE" SortExpression="ID_SERVICE">
                                        <EditItemTemplate>
                                             <asp:DropDownList ID="DropDownList1" runat="server" class="browser-default custom-select" DataSourceID="SqlDataSource3" DataTextField="NOM_SERVICE" DataValueField="ID_SERVICE" SelectedValue='<%# Bind("ID_SERVICE") %>'></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_SERVICE], [NOM_SERVICE] FROM [SERVICES]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("ID_SERVICE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ADRESSE" SortExpression="ADRESSE">
                                        <EditItemTemplate>
                                 <asp:TextBox ID="TextBox9" class="form-control form-control-user" TextMode="MultiLine" runat="server" Text='<%# Bind("ADRESSE") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBox9" runat="server" ValidationGroup="G2" ForeColor="Red" ErrorMessage="Champ obligatoire"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("ADRESSE") %>'></asp:Label>
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

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [AGENT] WHERE [ID_AGENT] = @ID_AGENT" InsertCommand="INSERT INTO [AGENT] ([ID_AGENT], [NOM], [Prenom], [CIN], [TELEPHONE], [EMAIL], [Date_Ajout], [TYPE], [ID_SERVICE], [ADRESSE]) VALUES (@ID_AGENT, @NOM, @Prenom, @CIN, @TELEPHONE, @EMAIL, @Date_Ajout, @TYPE, @ID_SERVICE, @ADRESSE)" SelectCommand="SELECT [ID_AGENT], [NOM], [Prenom], [CIN], [TELEPHONE], [EMAIL], [Date_Ajout], [TYPE], [ID_SERVICE], [ADRESSE] FROM [AGENT]" UpdateCommand="UPDATE [AGENT] SET [NOM] = @NOM, [Prenom] = @Prenom, [CIN] = @CIN, [TELEPHONE] = @TELEPHONE, [EMAIL] = @EMAIL, [Date_Ajout] = @Date_Ajout, [TYPE] = @TYPE, [ID_SERVICE] = @ID_SERVICE, [ADRESSE] = @ADRESSE WHERE [ID_AGENT] = @ID_AGENT">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_AGENT" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_AGENT" Type="Int32" />
                                    <asp:Parameter Name="NOM" Type="String" />
                                    <asp:Parameter Name="Prenom" Type="String" />
                                    <asp:Parameter Name="CIN" Type="String" />
                                    <asp:Parameter Name="TELEPHONE" Type="String" />
                                    <asp:Parameter Name="EMAIL" Type="String" />
                                    <asp:Parameter DbType="Date" Name="Date_Ajout" />
                                    <asp:Parameter Name="TYPE" Type="String" />
                                    <asp:Parameter Name="ID_SERVICE" Type="Int32" />
                                    <asp:Parameter Name="ADRESSE" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="NOM" Type="String" />
                                    <asp:Parameter Name="Prenom" Type="String" />
                                    <asp:Parameter Name="CIN" Type="String" />
                                    <asp:Parameter Name="TELEPHONE" Type="String" />
                                    <asp:Parameter Name="EMAIL" Type="String" />
                                    <asp:Parameter DbType="Date" Name="Date_Ajout" />
                                    <asp:Parameter Name="TYPE" Type="String" />
                                    <asp:Parameter Name="ID_SERVICE" Type="Int32" />
                                    <asp:Parameter Name="ADRESSE" Type="String" />
                                    <asp:Parameter Name="ID_AGENT" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </ContentTemplate>
                      
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

  
</asp:Content>

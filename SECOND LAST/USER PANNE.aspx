<%@ Page Title="" Language="C#" MasterPageFile="~/USER.Master" AutoEventWireup="true" CodeBehind="USER PANNE.aspx.cs" Inherits="SECOND_LAST.WebForm6" %>

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
                            <h6 class="m-0 font-weight-bold text-primary ">Panne d'une véhicule !</h6>
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


                            <asp:GridView ID="GridView2" runat="server" Width="100%"></asp:GridView>

                            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_PANNE" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Selectionner pour Réparer" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID_PANNE" HeaderText="Id Panne" ReadOnly="True" SortExpression="ID_PANNE" />
                                    <asp:BoundField DataField="DATE_PANNE" HeaderText="Date" SortExpression="DATE_PANNE" />
                                    <asp:TemplateField HeaderText="Matricule" SortExpression="MATRICULE">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddl_bind" runat="server" class="browser-default custom-select" DataSourceID="SqlDataSource11" DataTextField="MATRICULE" DataValueField="ID_VEHICULE">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT [ID_VEHICULE], [MATRICULE] FROM [VEHICULE]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MATRICULE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DETAIL_PANNE" HeaderText="Détail" SortExpression="DETAIL_PANNE" />
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

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" DeleteCommand="DELETE FROM [PANNE] WHERE [ID_PANNE] = @ID_PANNE" InsertCommand="INSERT INTO [PANNE] ([ID_PANNE], [DATE_PANNE], [ID_VEHICULE], [DETAIL_PANNE]) VALUES (@ID_PANNE, @DATE_PANNE, @ID_VEHICULE, @DETAIL_PANNE)" SelectCommand="SELECT PANNE.ID_PANNE, PANNE.DATE_PANNE, VEHICULE.MATRICULE, PANNE.DETAIL_PANNE FROM PANNE INNER JOIN VEHICULE ON PANNE.ID_VEHICULE = VEHICULE.ID_VEHICULE" UpdateCommand="UPDATE [PANNE] SET [DATE_PANNE] = @DATE_PANNE, [ID_VEHICULE] = @ID_VEHICULE, [DETAIL_PANNE] = @DETAIL_PANNE WHERE [ID_PANNE] = @ID_PANNE">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_PANNE" Type="Int32" />
                                    <asp:Parameter Name="DATE_PANNE" Type="DateTime" />
                                    <asp:Parameter Name="ID_VEHICULE" Type="Int32" />
                                    <asp:Parameter Name="DETAIL_PANNE" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="DATE_PANNE" Type="DateTime" />
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







 


</asp:Content>

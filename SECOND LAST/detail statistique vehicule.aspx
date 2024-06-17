<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="detail statistique vehicule.aspx.cs" Inherits="SECOND_LAST.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
          <ContentTemplate>
    <div class="row">

        <div class="col-xl-12 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Liste des Véhicules</h6>
                </div>

                 <div class="card-body">
                      <div class="form-row justify-content-center">
                                <div class="col-sm-6">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="Label1">Selectionner une véhicule :</asp:Label></h6>
 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" class="browser-default custom-select" DataSourceID="SqlDataSource1" DataTextField="IMATRUCULATION" DataValueField="ID_VEHICULE"></asp:DropDownList>
                                    
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT ID_VEHICULE, IMATRUCULATION FROM VEHICULE"></asp:SqlDataSource>
                                    
                                </div>
                                
                            </div><br /><br />


                      <div class="form-group row">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="ID_AGENT" HeaderText="AGENT" SortExpression="ID_AGENT" />
                                            <asp:BoundField DataField="ID_MISSION" HeaderText="MISSION" SortExpression="ID_MISSION" />
                                            <asp:BoundField DataField="DATE" DataFormatString="{0:d}" HeaderText="DATE" SortExpression="DATE" />
                                            <asp:BoundField DataField="ID_VEHICULE" HeaderText="VEHICULE" SortExpression="ID_VEHICULE" />
                                            <asp:BoundField DataField="KILOMETRAGE" HeaderText="KILOMETRAGE" SortExpression="KILOMETRAGE" />
                                            <asp:BoundField DataField="ID_BON" HeaderText="BON" SortExpression="ID_BON" />
                                            <asp:BoundField DataField="PRIX_LITRE" HeaderText="PRIX(L)" SortExpression="PRIX_LITRE" />
                                            <asp:BoundField DataField="NBR_LITRE" HeaderText="Litrage" SortExpression="NBR_LITRE" />
                                            <asp:BoundField DataField="DATE_BON" DataFormatString="{0:d}" HeaderText="DATE DE BON" SortExpression="DATE_BON" />
                                            <asp:BoundField DataField="TYPE_CARBURANT" HeaderText="CARBURANT" SortExpression="TYPE_CARBURANT" />
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
                                       
                                    
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT AGENT.ID_AGENT, MISSION.ID_MISSION, DETAIL_MISSION.DATE, VEHICULE.ID_VEHICULE, BON_PLEIN.KILOMETRAGE, BON_CARBURANT.ID_BON, BON_PLEIN.PRIX_LITRE, BON_PLEIN.NBR_LITRE, BON_PLEIN.DATE_BON, CARBURANT.TYPE_CARBURANT FROM BON_CARBURANT INNER JOIN BON_PLEIN ON BON_CARBURANT.ID_BON = BON_PLEIN.ID_BON INNER JOIN CARBURANT ON BON_CARBURANT.ID_CARBURANT = CARBURANT.ID_CARBURANT INNER JOIN AGENT INNER JOIN DETAIL_MISSION ON AGENT.ID_AGENT = DETAIL_MISSION.ID_AGENT INNER JOIN MISSION ON DETAIL_MISSION.ID_MISSION = MISSION.ID_MISSION INNER JOIN VEHICULE ON DETAIL_MISSION.ID_VEHICULE = VEHICULE.ID_VEHICULE AND DETAIL_MISSION.ID_VEHICULE = VEHICULE.ID_VEHICULE ON CARBURANT.ID_CARBURANT = VEHICULE.ID_CARBURANT WHERE (VEHICULE.ID_VEHICULE = @ID_VEHICULE)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="ID_VEHICULE" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                       
                                    
                                </div>
                                
                            </div>

                     </div>
                </div>
            </div>
        </div>
              </ContentTemplate>
         </asp:UpdatePanel>


</asp:Content>

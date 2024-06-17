<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Admin Acceuilll.aspx.cs" Inherits="SECOND_LAST.WebForm5" %>

<%@ Import Namespace="SECOND_LAST.Entity_Frame" %>
<%@ Import Namespace="SECOND_LAST.Classes" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- Page Wrapper -->
    <div id="wrapper">


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">





                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Acceuil :</h1>
                 

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">
                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Statistiques des Agent appliquer des missions :</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <%--<hr>
                                   
                                    <code>Nombre des mission affecter par les agents</code> --%>
                                </div>
                            </div>
                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Statistique des Missions :</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <%--     <hr>
                                    Styling for the donut chart can be found in the
                                    <code>/js/demo/chart-pie-demo.js</code> file.--%>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">

                        <div class="col-xl-12 col-lg-7">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Détail Agent appliquer des missions :</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-row justify-content-center">
                                                <div class="col-sm-10 mb-3 mb-sm-0">
                                                    <label>
                                                        <h6 class="m-0 font-weight-bold text-primary ">Mission :</h6>
                                                    </label>
                                                    <asp:DropDownList runat="server" class="browser-default custom-select" ID="ddl_mission" DataSourceID="SqlDataSource8" DataTextField="OBJET" DataValueField="ID_MISSION" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT DISTINCT MISSION.ID_MISSION, MISSION.OBJET FROM MISSION INNER JOIN DETAIL_MISSION ON MISSION.ID_MISSION = DETAIL_MISSION.ID_MISSION"></asp:SqlDataSource>
                                                </div>

                                            </div>
                                            <br />
                                            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_AGENT" HeaderText="AGENT" SortExpression="ID_AGENT" />
                                                    <asp:BoundField DataField="IMATRUCULATION" HeaderText="IMATRUCULATION" SortExpression="IMATRUCULATION" />
                                                    <asp:BoundField DataField="DATE" DataFormatString="{0:d}" HeaderText="DATE" SortExpression="DATE" />
                                                    <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
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
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RADEETA_DATABASEConnectionString %>" SelectCommand="SELECT AGENT.ID_AGENT, VEHICULE.IMATRUCULATION, DETAIL_MISSION.DATE, AGENT.TYPE FROM AGENT INNER JOIN DETAIL_MISSION ON AGENT.ID_AGENT = DETAIL_MISSION.ID_AGENT INNER JOIN MISSION ON DETAIL_MISSION.ID_MISSION = MISSION.ID_MISSION INNER JOIN VEHICULE ON DETAIL_MISSION.ID_VEHICULE = VEHICULE.ID_VEHICULE AND DETAIL_MISSION.ID_VEHICULE = VEHICULE.ID_VEHICULE

WHERE (DETAIL_MISSION.ID_MISSION = @ID)
">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddl_mission" Name="ID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <%--<hr>
                                   
                                    <code>Nombre des mission affecter par les agents</code> --%>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>



                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>



    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="Package/chart.js/Chart.min.js"></script>


    <script>


        let Mission_valable;

        let Mission_Expirer;

        let mission_effect;
        let total_mission;


        total_mission =  <%Response.Write(Utils.Get_Count_Mission()); %>;
        mission_effect =<%Response.Write(Utils.Get_Mission_effectuer());%>;
        Get_Mission_valable =<%Response.Write(Utils.Get_Mission_valable());%>

            Mission_Expirer =<%Response.Write(Utils.Get_Expire_Mission());%>










            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        // Pie Chart Example
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ["Mission effectuer", "Total des Missions", "Mission Valable", "Mission Expirer"],
                datasets: [{
                    data: [mission_effect, total_mission, Get_Mission_valable, Mission_Expirer],
                    backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                    hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                    hoverBorderColor: "rgba(234, 236, 244, 1)",
                }],
            },
            options: {
                maintainAspectRatio: false,
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                },
                legend: {
                    display: false
                },
                cutoutPercentage: 80,
            },
        });

    </script>


    <script>

        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
            // *     example: number_format(1234.56, 2, ',', ' ');
            // *     return: '1 234,56'
            number = (number + '').replace(',', '').replace(' ', '');
            var n = !isFinite(+number) ? 0 : +number,
                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                s = '',
                toFixedFix = function (n, prec) {
                    var k = Math.pow(10, prec);
                    return '' + Math.round(n * k) / k;
                };
            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
            if (s[0].length > 3) {
                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
            }
            if ((s[1] || '').length < prec) {
                s[1] = s[1] || '';
                s[1] += new Array(prec - s[1].length + 1).join('0');
            }
            return s.join(dec);
        }


        let nom_client_x = []
        let Mission_count_y = []


            <%
        RADEETA_Entities db = new RADEETA_Entities();
        var get_all = (from DETAIL_MISSION in db.DETAIL_MISSION
                       group new
                       { DETAIL_MISSION.AGENT, DETAIL_MISSION } by new
                       {
                           DETAIL_MISSION.AGENT.NOM,
                           DETAIL_MISSION.AGENT.Prenom
                       } into g
                       select new
                       {
                           Counting = g.Count(p => p.DETAIL_MISSION.ID_AGENT != null),
                           Complet = (g.Key.NOM + " " + g.Key.Prenom)
                       }).Distinct();
        foreach (var a in get_all)
        {
                %>
        Mission_count_y.push("<%Response.Write(a.Counting);%>");
        nom_client_x.push("<%Response.Write(a.Complet.ToString());%>");<%
        }
            %>




        let label2 = []

        // Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: nom_client_x,
                datasets: [{
                    label: "Mission effectuer ",
                    backgroundColor: "#4e73df",
                    hoverBackgroundColor: "#2e59d9",
                    borderColor: "#4e73df",
                    data: Mission_count_y,
                }],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'month'
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 6
                        },
                        maxBarThickness: 25,
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 100,
                            maxTicksLimit: 10,
                            padding: 10,
                            // Include a dollar sign in the ticks
                            callback: function (value, index, values) {
                                return '' + number_format(value);
                            }
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [2],
                            zeroLineBorderDash: [2]
                        }
                    }],
                },
                legend: {
                    display: false
                },
                tooltips: {
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function (tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                        }
                    }
                },
            }
        });



    </script>






</asp:Content>

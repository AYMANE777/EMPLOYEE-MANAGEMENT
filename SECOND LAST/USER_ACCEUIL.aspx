<%@ Page Title="" Language="C#" MasterPageFile="~/USER.Master" AutoEventWireup="true" CodeBehind="USER_ACCEUIL.aspx.cs" Inherits="SECOND_LAST.USER_ACCEUIL" %>
<%@ Import Namespace="SECOND_LAST.Entity_Frame" %>
<%@ Import Namespace="SECOND_LAST.Classes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- Custom fonts for this template-->
    <link href="Package/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/dash-min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Statistiques des missions compléter avec l'équipe :</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                    

                                </div>
                            </div>

                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Statistiques des véhicules :</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                   
                                </div>
                            </div>
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

    <!-- Page level custom scripts -->
    
    <script src="js/demo/chart-pie-demo.js"></script>



     <script>


         let vehicule_disponible;

         let vehicule_panne;

         let vehicule_réparer;
         
         let total_vehicule;


         total_vehicule =  <%Response.Write(Utils.Get_Count_Vehicule()); %>;
         vehicule_panne =<%Response.Write(Utils.Get_Count_vehicule_Panne());%>;
         vehicule_réparer =<%Response.Write(Utils.Get_Count_vehicule_disponible());%>
             vehicule_disponible =<%Response.Write(Utils.Get_Count_vehicule_nouveau());%>
           










             // Set new default font family and font color to mimic Bootstrap's default styling
             Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
         Chart.defaults.global.defaultFontColor = '#858796';

         // Pie Chart Example
         var ctx = document.getElementById("myPieChart");
         var myPieChart = new Chart(ctx, {
             type: 'doughnut',
             data: {
                 labels: ["véhicule disponible", "Total des véhicules", "vehicule Valable", "véhicule en panne"],
                 datasets: [{
                     data: [vehicule_disponible, total_vehicule, vehicule_réparer, vehicule_panne],
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
        </script>
       
      
        <script>

            let nom_client_x = []
            let Mission_count_y = []


            <%
            RADEETA_Entities db = new RADEETA_Entities();
            var get_all = (from DETAIL_MISSION in db.DETAIL_MISSION
                           group new { DETAIL_MISSION.MISSION, DETAIL_MISSION } by new
                           {
                               DETAIL_MISSION.MISSION.OBJET
                           } into g
                           select new
                           {
                               get_Count = g.Count(p => p.DETAIL_MISSION.ID_AGENT != null),
                               g.Key.OBJET
                           }).Distinct().ToList() ;
            foreach (var a in get_all)
            {
                %>
            Mission_count_y.push("<%Response.Write(a.get_Count.ToString());%>");
            nom_client_x.push("<%Response.Write(a.OBJET);%>");<%
        }
            %>




            let label2=[]
        // Area Chart Example
        var ctx = document.getElementById("myAreaChart");
        var myLineChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: nom_client_x,
                datasets: [{
                    label: "Nombre d'équipe",
                    lineTension: 0.3,
                    backgroundColor: "rgba(78, 115, 223, 0.05)",
                    borderColor: "rgba(78, 115, 223, 1)",
                    pointRadius: 3,
                    pointBackgroundColor: "rgba(78, 115, 223, 1)",
                    pointBorderColor: "rgba(78, 115, 223, 1)",
                    pointHoverRadius: 3,
                    pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                    pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                    pointHitRadius: 10,
                    pointBorderWidth: 2,
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
                            unit: 'date'
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 7
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            maxTicksLimit: 5,
                            padding: 10,


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
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    intersect: false,
                    mode: 'index',
                    caretPadding: 10,
                    callbacks: {
                        label: function (tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                        }
                    }
                }
            }
        });

        </script>

</asp:Content>

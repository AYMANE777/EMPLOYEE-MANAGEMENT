<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Acc.aspx.cs" Inherits="SECOND_LAST.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/dash-min.css" rel="stylesheet" />
    <title>RADEETA</title>
    <style>
    .er{
        outline: 1px solid red;
    }    
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
                $(document).ready(function(){
                    $('#tb_email_login').blur(function(){
                        if(!$(this).val()){
                            $(this).addClass("er");
                        } else{
                            $(this).removeClass("er");
                        }
                    });
                    $('#tb_pass_login').blur(function () {
                        if (!$(this).val()) {
                            $(this).addClass("er");
                        } else {
                            $(this).removeClass("er");
                        }
                    });
                });
</script>



</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block ">
                                    <img src="Image/PIC.png" width="450px" height="450px" /></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Authentification </h1>
                                        </div>
                                        <form class="user">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" TextMode="Email" type="email" class="form-control form-control-user"
                                                    ID="tb_email_login" aria-describedby="emailHelp"
                                                    placeholder="Enter Email Address..."></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox runat="server" TextMode="Password" class="form-control form-control-user"
                                                    ID="tb_pass_login" placeholder="Password"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <asp:CheckBox runat="server" type="checkbox" class="custom-control-input" ID="customCheck" />
                                                    <label class="custom-control-label" for="customCheck">
                                                        Remember
                                                    Me</label>
                                                </div>
                                            </div>
                                            <h6 class="m-0 font-weight-bold text-primary ">
                                                <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                            <hr>
                                            <asp:Button runat="server" class="btn btn-primary btn-user btn-block" Text="Connecter" ID="btn_login" OnClick="login_user"></asp:Button>

                                        </form>
                                   
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </form>



    <!-- Bootstrap core JavaScript-->
    <script src="Package/jquery/jquery.min.js"></script>
    <script src="Package/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="Package/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>

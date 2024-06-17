<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion de Vehicule.Master" AutoEventWireup="true" CodeBehind="Réparation du Voiture.aspx.cs" Inherits="SECOND_LAST.Réparation_du_Voiture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="row">

        <div class="col-xl-12 col-lg-7">

            <asp:TextBox runat="server" type="Date" class="form-control form-control-user" ID="tb_date_fin_reparation"
                placeholder=""></asp:TextBox>


            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary ">Réparation du Voiture</h6>
                </div>
                <div class="card-body">

                    <form class="container" id="form-validation">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validation1">First name</label>
                                <input type="text" class="form-control" id="validation1" placeholder="First name" value="Jhon">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validation2">Last name</label>
                                <input type="text" class="form-control" id="validation2" placeholder="Last name" value="Doe">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validation3">City</label>
                                <input type="text" class="form-control" id="validation3" placeholder="City">
                                <div class="invalid-feedback">
                                    Enter city.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validation4">State</label>
                                <input type="text" class="form-control" id="validation4" placeholder="State">
                                <div class="invalid-feedback">
                                    Enter state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validation5">Zip</label>
                                <input type="text" class="form-control" id="validation5" placeholder="Zip">
                                <div class="invalid-feedback">
                                    Enter zip code.
                                </div>
                            </div>
                        </div>
                        <asp:Button runat="server" class="btn btn-secondary btn-md" Text="Add" OnClick="Unnamed1_Click"></asp:Button>
                    </form>
                </div>
            </div>
        </div>
    </div>















    <script>
        // Custom JavaScript for Validation
        (function () {
            "use strict";
            window.addEventListener("load", function () {
                var form = document.getElementById("form-validation");
                form.addEventListener("submit", function (event) {
                    if (form.checkValidity() == false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add("was-validated");
                }, false);
            }, false);
        }());
    </script>




</asp:Content>

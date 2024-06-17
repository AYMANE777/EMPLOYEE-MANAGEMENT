<%@ Page Title="" Language="C#" MasterPageFile="~/USER.Master" AutoEventWireup="true" CodeBehind="Profil user.aspx.cs" Inherits="SECOND_LAST.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		/*body {
    margin: 0;
    padding-top: 40px;
    color: #2e323c;
    background: #f5f6fa;
    position: relative;
    height: 100%;
}*/
.account-settings .user-profile {
    margin: 0 0 1rem 0;
    padding-bottom: 1rem;
    text-align: center;
}
.account-settings .user-profile .user-avatar {
    margin: 0 0 1rem 0;
}
.account-settings .user-profile .user-avatar img {
    width: 90px;
    height: 90px;
    -webkit-border-radius: 100px;
    -moz-border-radius: 100px;
    border-radius: 100px;
}
.account-settings .user-profile h5.user-name {
    margin: 0 0 0.5rem 0;
}
.account-settings .user-profile h6.user-email {
    margin: 0;
    font-size: 0.8rem;
    font-weight: 400;
    color: #9fa8b9;
}
.account-settings .about {
    margin: 2rem 0 0 0;
    text-align: center;
}
.account-settings .about h5 {
    margin: 0 0 15px 0;
    color: #007ae1;
}
.account-settings .about p {
    font-size: 0.825rem;
}
.form-control {
    border: 1px solid #cfd1d8;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    font-size: .825rem;
    background: #ffffff;
    color: #2e323c;
}

.card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
}

	</style>
	 <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%= Image1.ClientID %>').prop('src', e.target.result).width(200).height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }

        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					
					<asp:Image runat="server" ID="Image1" ImageUrl="Image/no-image.png" Width="100px" Height="110px"  alt="No image" />
				</div><br />
				<br />
				<asp:FileUpload class="btn btn-primary btn-user btn-block" onchange="ImagePreview(this)" runat="server" ID="img_Agent" /><br /><br /><br />
				<h5 class="user-name">Bonjour : </h5><br />
				<h5 class="user-name"><%=Session["AGENT"].ToString() %></h5>
				<%--<h6 class="user-email">yuki@Maxwell.com</h6>--%>
			</div>
			<%--<div class="about">
				<h5>About</h5>
				<p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p>
			</div>--%>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Agent Détails</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="eMail">Email</label>
					<asp:TextBox TextMode="Email" runat="server" class="form-control" ID="new_email" placeholder="Enter votre nouveau email" Required></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="phone">Téléphone</label>
					<asp:TextBox TextMode="Phone" runat="server" class="form-control" id="new_phone" placeholder="Enter votre Téléphone " Required></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="adresse">Adresse</label>
					<asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="new_adresse" placeholder="Enter votre adresse" Required></asp:TextBox>
				</div>
			</div>
			
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mt-3 mb-2 text-primary">Password</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="Pass">Mot de passe</label>
					<asp:TextBox runat="server" TextMode="Password"  class="form-control" ID="pass" placeholder="Enter nouveau mot de pass" Required></asp:TextBox>
				
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="cofirm">Confirmer votre mot de pass</label>
					<asp:TextBox TextMode="Password" runat="server" class="form-control" ID="confirm_pass" placeholder="Confirmer mot de pass" Required></asp:TextBox>
						<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass" ControlToValidate="confirm_pass" ValidationGroup="G1" ForeColor="Red" ErrorMessage="mot de pass incorrect"></asp:CompareValidator>
				</div>
			</div>
			
			
			
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right">
					<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
					<asp:Button runat="server" type="button" ID="submit" ValidationGroup="G1" Text="Update" class="btn btn-primary" OnClick="submit_Click"></asp:Button>
				</div>
			</div>
		</div>
		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_image_erreur"></asp:Label></h6>
                                </div>
		<div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <h6 class="m-0 font-weight-bold text-primary ">
                                        <asp:Label runat="server" ID="lb_cas_erreur"></asp:Label></h6>
                                </div>
                            </div>
	</div>
</div>
</div>
</div>
</div>

</asp:Content>

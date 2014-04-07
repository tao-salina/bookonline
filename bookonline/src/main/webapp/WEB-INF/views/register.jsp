<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='Expires' content='-1' />
<title>TaoTao's BookStore | Create an Account</title>
<link href="./resources/css/book2.css" type="text/css" rel="stylesheet">
<script src="./resources/js/book2.js" type="text/javascript"></script>
<script charset="utf-8" src="./resources/js/rls"></script>
<script charset="utf-8" src="./resources/js/rls1"></script>
<script charset="utf-8" src="./resources/js/rls2"></script>
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="./resources/js/jquery.validate.min.js"></script>
<script>
	$(document).ready(init);

	function init() {
		$("#registerform").validate({
			rules : {
				firstName : {
					required : true
				},
				lastName : {
					required : true
				},
				email : {
					required : true,

					email : true
				},
				confirmEmail : {
					required : true,
					equalTo : "#email",
					email : true
				},
				password : {
					required : true
				},
				confirmPassword : {
					required : true,
					equalTo : "#password"
				}
			},
			messages : {
				confirmEmail : {
					equalTo : "Please enter same emal address."
				},
				confirmPassword : {
					equalTo : "Please enter same password."
				}
			}
		});
		// end validate
	}
</script>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<header class="box  full">
		<div id="minimal-head-1" data-bn-widget-name="minimal-head" class="centered-width popup box full minimal-head">
			<a href="./home"><div class="logo-container"></div></a>
			<h2 class="milo">Create Account</h2>
			<div class="border hide-in-popup">
				<div class="fade-out"></div>
			</div>
		</div>
	</header>
	<div class="centered-width page-content-wrapper box  full ">
		<a id="mainContent" tabindex="0"></a>
		<section class="page-content column">
			<div id="create-account-form-1" data-bn-widget-name="create-account-form" data-bntrack="create-account"
				class="account-form-layout account-form-layout create-account-form" data-bntrack-root="true">
				<div class="note">
					Fill in the fields below to create a account.<br />If you already have an account, please <a href="signInForm"
						rel="nofollow" class="sign-in" data-bntrack="sign-in">Sign in</a>.
				</div>
				<form id="registerform" name="registerform" action="createUser" class="AccountForm" method="post">
					<input type="hidden" name="csrfToken" value="Fat1hjUEF6TFpXXNF81C0FNWsbLZbq5v" />
					<div class="error-box hidden   "></div>
					<h3 class="fieldsetlabel">First Name</h3>
					<fieldset class="first-and-last-name box">
						<div>
							<input name="firstName" id="firstName" value="" tabindex="1" type="text" />
						</div>
					</fieldset>
					<h3 class="fieldsetlabel">Last Name</h3>
					<fieldset class="first-and-last-name box">
						<div>
							<input name="lastName" id="lastName" value="" tabindex="2" type="text" />
						</div>
					</fieldset>
					<h3 class="fieldsetlabel">Email Address</h3>
					<fieldset class="confirm-email-address box">
						<div>
							<input name="email" id="email" value="" tabindex="3" type="text" />
						</div>
					</fieldset>
					<h3 class="fieldsetlabel">Re-Enter Email Address</h3>
					<fieldset class="confirm-email-address box">
						<div>
							<input name="confirmEmail" id="confirmEmail" value="" tabindex="4" type="text" />
						</div>
					</fieldset>
					<h3 class="fieldsetlabel">Password</h3>
					<fieldset class="confirm-password box">
						<div>
							<input name="password" id="password" value="" tabindex="5" type="password" />
						</div>
					</fieldset>
					<h3 class="fieldsetlabel">Confirm Password</h3>
					<fieldset class="confirm-password box">
						<div>
							<input name="confirmPassword" id="confirmPassword" value="" tabindex="6" type="password" />
						</div>
					</fieldset>
					<div class="action">
						<a href="" data-bntrack="cancel" class="secondary button cancel">Cancel</a>
						<button type="submit" class="secondary button">Create Account</button>
					</div>
				</form>
			</div>
		</section>
	</div>
	<footer class="box  full"> </footer>
	<div></div>
	<div class="page-debug"></div>
	<script src="./resources/js/book3.js" type="text/javascript"></script>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='Expires' content='-1' />
<title>TaoTao's BookStore | Sign in</title>
<link href="./resources/css/book2.css" type="text/css" rel="stylesheet">
<script src="./resources/js/book2.js" type="text/javascript"></script>
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="./resources/js/jquery.validate.min.js"></script>
<script>
$(document).ready(init);

function init() {
	$("#signinform").validate({
		rules : {
			email : {
				required : true,
			    email: true
			},
			password : {
				required : true
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
			<a href="./home">
				<div class="logo-container"></div>
			</a>
			<h2 class="milo">Sign In</h2>
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
					Fill in the fields below to sign in.<br />If you haven't an account, please <a
						href="registerForm" rel="nofollow" class="sign-in" data-bntrack="sign-in">Register</a>.
				</div>
				<form id="signinform" name="signinform" action="processLogin" class="AccountForm" method="post">
					<h3 class="fieldsetlabel">Email Address</h3>
					<fieldset class="confirm-email-address box">
						<div >
							<input name="email" id="email" value="" tabindex="1" type="text" />
						</div>
					</fieldset>
					<h3 class="fieldsetlabel">Password</h3>
					<fieldset class="confirm-email-address box">
						<div>
							<input name="password" id="password" value="" tabindex="2"  type="password" />
						</div>
					</fieldset>
					
					<div class="action">
						<a href="./home" data-bntrack="cancel" class="secondary button cancel">Cancel</a>
						<button type="submit" class="secondary button">Sign In</button>
					</div>
				</form>
			</div>
		</section>
	</div>
	<footer class="box  full"> </footer>
	<div></div>
	<div class="page-debug"></div>
</body>
</html>

<%@ include file="./include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='Expires' content='-1' />
<title>TaoTao's BookStore | Check out</title>
<link href="./resources/css/book2.css" type="text/css" rel="stylesheet">
<script src="./resources/js/book2.js" type="text/javascript"></script>
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="./resources/js/cart.js"></script>
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="./resources/js/jquery.validate.min.js"></script>
<script>
	$(document).ready(init);

	function init() {
		var booklist = cart.getBookList();
		var htmlStr = "";
		var cartlist = document.getElementById("cartlist");
		for ( var i in booklist) {
			htmlStr = htmlStr
					+ '<input type="hidden" name="details['+i+'].bookId" value="'+booklist[i].bookid+'" />';
			htmlStr = htmlStr
					+ '<input type="hidden" name="details['+i+'].quantity" value="'+booklist[i].quantity+'" />';
		}
		cartlist.innerHTML = htmlStr;
		$('#totalAmount').val(orderdetail.totalAmount);
		$('#priceDiv span').text("$" + orderdetail.totalAmount);
		$("#checkoutform").validate({
			rules : {
				creditNo : {
					required : true
				},
				shipAddress : {
					required : true
				}
			}
		});
	}
</script>
</head>
<body>
	<header class="box  full">
		<div id="minimal-head-1" data-bn-widget-name="minimal-head" class="centered-width popup box full minimal-head">
			<a href="./home"><div class="logo-container"></div></a>
			<h2 class="milo">Check Out</h2>
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
					Fill in the fields below to check out.<br />
					<form id="checkoutform" action="./createOrder" method="POST">
						<input type="hidden" id="userId" name="userId" value="${user.userId}" /> <input type="hidden" id="totalAmount"
							name="totalAmount" value="" />
						<div id="cartlist"></div>
						<div class="error-box hidden   "></div>
						<h3 class="fieldsetlabel">
							Total Amount:
							<div id="priceDiv">
								<span></span>
							</div>
						</h3>
						<h3 class="fieldsetlabel">Credit Number</h3>
						<fieldset class="confirm-email-address box">
							<div>
								<input name="creditNo" id="creditNo" value="" tabindex="3" type="text" />
							</div>
						</fieldset>
						<h3 class="fieldsetlabel">Shipping Address</h3>
						<fieldset class="confirm-email-address box">
							<div>
								<input name="shipAddress" id="shipAddress" value="" tabindex="3" type="text" />
							</div>
						</fieldset>
						<div class="action">
							<a href="" data-bntrack="cancel" class="secondary button cancel">Cancel</a>
							<button type="submit" class="secondary button">Submit</button>
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

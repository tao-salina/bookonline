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
<link rel="stylesheet" type="text/css" href="./resources/css/bn-core.css">
<link rel="stylesheet" href="./resources/css/bn_fullCart.css">
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="./resources/js/cart.js"></script>
<script>
	var amount = 0;
	$(document).ready(showCart);
	function showCart() {

		//Get book list
		var booklist = cart.getBookList();
		var htmlStr = "";
		var cartlist = document.getElementById("cartlist");
		for ( var i in booklist) {
			htmlStr = htmlStr
					+ '<div class="itemRow" data-bntrack="itemRow-1">';
			htmlStr = htmlStr + '	<div class="itemRowContent">';
			htmlStr = htmlStr + '		<div class="itemDetails">';
			htmlStr = htmlStr + '			<div class="thumbnail">';
			htmlStr = htmlStr
					+ '				<a class="productName" href="showBookDetail?bookId='
					+ booklist[i].bookid + '">';
			htmlStr = htmlStr
					+ '					<img border="0" src="./resources/images/books/'+ booklist[i].image + '_small.JPG"></a>';
			htmlStr = htmlStr + '			</div>';
			htmlStr = htmlStr + '			<div class="itemDetailsDiv">';
			htmlStr = htmlStr + '				<ul>';
			htmlStr = htmlStr
					+ '					<li><a class="productName" data-bntrack="Title" href="showBookDetail?bookId='
					+ booklist[i].bookid + '">';
			htmlStr = htmlStr + '					    <b>' + booklist[i].bookname
					+ '</b><br></a></li>';
			htmlStr = htmlStr + '					<li>by ' + booklist[i].author + '</li>';
			htmlStr = htmlStr + '				</ul>';
			htmlStr = htmlStr + '			</div>';
			htmlStr = htmlStr + '		</div>';
			htmlStr = htmlStr + '		<div class="itemColRight">';
			htmlStr = htmlStr + '			<div class="itemPrice">';
			htmlStr = htmlStr + '				<ul>';
			htmlStr = htmlStr + '					<li><span class="itemAmt">'
					+ booklist[i].price + '</span></li>';
			htmlStr = htmlStr + '				</ul>';
			htmlStr = htmlStr + '			</div>';
			htmlStr = htmlStr + '			<div class="itemAction">';
			htmlStr = htmlStr + '				<ul>';
			htmlStr = htmlStr + '					<li>' + booklist[i].quantity + '</li>';
			htmlStr = htmlStr + '					<li><a href="" onclick="removeBook(\''
					+ booklist[i].bookid + '\')">Remove</a></li>';
			htmlStr = htmlStr + '				</ul>';
			htmlStr = htmlStr + '			</div>';
			htmlStr = htmlStr + '		</div>';
			htmlStr = htmlStr + '	</div>';
			htmlStr = htmlStr + '</div>';
		}
		cartlist.innerHTML = htmlStr;
		$('#priceDiv span').text("$" + orderdetail.totalAmount);
		amount = orderdetail.totalAmount;
	}

	function removeBook(bookid) {
		cart.deleteBook(bookid);
		//Get book list
		showCart();
	}

	function showCheckOut(userId) {
		if (amount != 0) {
			window.open('showCheckOut?userId=' + userId, '_blank');
		} else {
			alert("You shopping cart is empty, can not check out.");
			window.open('home', '_blank');
		}
	}

	function clearCart() {
		localStorage.setItem("BookShoppingCart", "");
	}
</script>
<%
	User user = new User();

	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
	}
%>
</head>
<body>
	<header class="box  full">
		<div id="minimal-head-1" data-bn-widget-name="minimal-head" class="centered-width popup box full minimal-head">
			<a href="./home">
				<div class="logo-container"></div>
			</a>
			<h2 class="milo">Shopping Cart</h2>
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
					Fill in the fields below to check out.<br /> <input type="hidden" name="csrfToken"
						value="Fat1hjUEF6TFpXXNF81C0FNWsbLZbq5v" />
					<div class="error-box hidden   "></div>
					<div id="fullCartLanding" class="fullCart-landing">
						<div class="w-box wgt-item-added-fullcart-item-content" xmlns:exslt="http://exslt.org/common">
							<div class="fullCart-items" id="fullCart-items" data-bntrack="cartSummary" data-bntrack-root="true">
								<div class="fullCart-items-include">
									<div class="hdrDiv" data-bntrack="header">
										<div class="titleDiv">
											<span class="pgName">My Shopping Bag</span> <a href="" onclick="clearCart()">Clear Cart</a>
										</div>
									</div>
									<div style="display: inline">
										<img height="1" width="1" style="border-style: none;" alt="" src="">
									</div>
									<div class="itemRow hdr">
										<div class="itemRowContent">
											<div class="itemDetails">PRODUCT DETAILS</div>
											<div class="itemColRight">
												<div class="itemPrice">PRICE</div>
												<div class="itemAction">QUANTITY</div>
											</div>
										</div>
									</div>
									<div id="cartlist"></div>
									<div class="itemRow summary">
										<div class="summaryRight">
											<div class="estTotals">
												<ul>
													<li class="estTot"><span class="txt">Total<span class="footNoteMark">*</span>:
													</span>
														<div id="priceDiv">
															<span class="price"></span>
														</div></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="continueChechoutDiv" data-bntrack="footer">
										<input class="continueCheckout" data-bntrack="continueCheckout"
											onclick="showCheckOut('<%=user.getUserId()%>')" type="Image" border="0" name="UIAction_cartContinue"
											alt="Continue Checkout" src="./resources/images/btn_cont_chckout.png"> <a
											data-bntrack="ContinueShoppingBottom" manual_cm_re="Cart-_-ContinueShoppingBottom-_-Gateway" href="./home"><img
											class="continueShop" border="0" alt="Continue Shopping" src="./resources/images/cont_shop_btn.png"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="page-foot"></div>
				<footer class="box  full"> </footer>
				<div></div>
				<div class="page-debug"></div>
</body>
</html>

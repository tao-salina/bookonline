<%@ include file="./include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='Expires' content='-1' />
<title>TaoTao's BookStore | My Orders</title>
<link href="./resources/css/book2.css" type="text/css" rel="stylesheet">
<script src="./resources/js/book2.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/bn-core.css">
<link rel="stylesheet" href="./resources/css/bn_fullCart2.css">
</head>
<body>
	<header class="box  full">
		<div id="minimal-head-1" data-bn-widget-name="minimal-head" class="centered-width popup box full minimal-head">
			<a href="./home"><div class="logo-container"></div></a>
			<h2 class="milo">My Orders</h2>
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
						<div id="fullCartLanding" class="fullCart-landing">
							<div class="w-box wgt-item-added-fullcart-item-content" xmlns:exslt="http://exslt.org/common">
								<div class="fullCart-items" id="fullCart-items" data-bntrack="cartSummary" data-bntrack-root="true">
									<div class="fullCart-items-include">
										<div style="display: inline">
											<img height="1" width="1" style="border-style: none;" alt="" src="">
										</div>
										<div class="itemRow hdr">
											<div class="itemRowContent">
												<div class="itemDetails">Order No</div>
												<div class="itemColRight">
													<div class="itemPrice">Total Amount</div>
													<div class="itemAction">Shipping Address</div>
												</div>
											</div>
										</div>
										<c:forEach items="${orderList}" var="order" varStatus="status">
											<div class="itemRow">
												<div class="itemRowContent">
													<div class="itemDetails">
														<div class="itemDetailsDiv">
															<ul>
																<li>${order.orderId}</li>
															</ul>
														</div>
													</div>
													<div class="itemColRight">
														<div class="itemPrice">
															<ul>
																<li><span class="itemAmt">${order.totalAmount}</span></li>
															</ul>
														</div>
														<div class="itemAction">
															<ul>
																<li>${order.shipAddress}</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<div class="itemRow summary"></div>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="page-foot">
				</div>
				<footer class="box  full"> </footer>
				<div></div>
				<div class="page-debug"></div>
</body>
</html>

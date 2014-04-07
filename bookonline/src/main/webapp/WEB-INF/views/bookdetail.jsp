<%@ include file="./include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>TaoTao's BookStore</title>
<link href="./resources/css/resources.css" type="text/css" rel="stylesheet">
<style>
.browser-notification .banner {
	width: 694px;
}

.horiz-navigation #horiz-navigation-1-store-1 {
	width: 50px;
}

.horiz-navigation #horiz-navigation-1-store-2 {
	width: 90px;
}

.horiz-navigation #horiz-navigation-1-store-3 {
	width: 60px;
}

.horiz-navigation #horiz-navigation-1-store-4 {
	width: 76px;
}

@media only screen and (min-width: 1212px) {
	.horiz-navigation #horiz-navigation-1-store-1 {
		width: 60px;
	}
	.horiz-navigation #horiz-navigation-1-store-2 {
		width: 100px;
	}
	.horiz-navigation #horiz-navigation-1-store-3 {
		width: 70px;
	}
	.horiz-navigation #horiz-navigation-1-store-4 {
		width: 86px;
	}
} /*/mediaquery*/
.headerText {
	font-size: 10px;
	line-height: 10px;
	text-align: center;
	text-transform: uppercase;
}
</style>
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="./resources/js/cart.js"></script>
<script>
	$(document).ready(init);

	function init() {
		$("#addCartBtn").click(addToCart);
	}

	function goToCart() {
		window.open('showBookCart', '_blank');
	}

	function addToCart() {
		var bookid = $("#bookId").val();
		var bookname = $("#bookName").val();
		var author = $("#author").val();
		var image = $("#image").val();
		var price = $("#price").val();

		var book = {
			'bookid' : bookid,
			'bookname' : bookname,
			'author' : author,
			'image' : image,
			'quantity' : 1,
			'price' : price
		};

		cart.addBook(book);
		alert("Add to Cart successful!");
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
	<header class="box">
		<div id="masthead-1" data-bn-widget-name="masthead" data-bntrack-pageaware="true" data-bntrack="Global_Nav"
			class="masthead box regular masthead" data-bntrack-view="Master Header" data-bntrack-root="true">
			<div id="browser-notification-1" data-bn-widget-name="browser-notification" data-bntrack="browser-notifiction"
				class="browser-notification">
				<div class="banner c15-11col c17-11col box">
					<a class="styled-close" data-bntrack="close">&nbsp;</a>
				</div>
				<img src="./resources/images/bottom_line_1024.png" class="horizontal-line small"> <img
					src="./resources/images/bottom_line_1280.png" class="horizontal-line wide">
			</div>
			<div id="user-links-1" data-bn-widget-name="user-links" class="user-links" data-bntrack-view="User Links Bar">
				<div class="user-links-wrapper" data-bntrack="Header">
					<div class="user-links-content centered-width c15-15col c17-17col">
						<ul>
							<li><%=user.getFirstName()%></li>
							<%
								if (user.getUserId() != 0) {
							%>
							<li><a href="signout">Sign out</a></li>
							<%
								} else {
							%>
							<li><a href="signInForm">Sign in</a></li>
							<%
								}
							%>
							<li><a href="showUserOrders?userId=<%=user.getUserId()%>">My Orders</a></li>
							<li><a href="showBookCart" data-bntrack="OrderStatus">Shopping Cart</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="wide centered-width box logo-container">
				<a href="./home" data-bntrack="logo" class="logo"> <img src="./resources/images/cleardot.gif">
				</a>
				<p>
				<div class="masthead-bottom box">
					<div id="quick-search-1" data-bn-widget-name="quick-search" class="c15-11col c17-13col box quick-search"
						data-bntrack-view="Quick Search Bar">
						<form name="search" action="searchBook" class="box" method="get">
							<button type="submit">Search</button>
							<div class="outer-container">
								<input type="submit" class="secondary-submit" tabindex="-1" />
								<div class="inner-container milo">
									<div class="styledinput styledselect-display ">
										<select name="bookType" id="bookType" tabindex="2" value="ALLPRODUCTS">
											<option value="all">All Products</option>
											<option value="textbook">Textbooks</option>
											<option value="kid">Kids' Books</option>
											<option value="fiction">Fiction</option>
										</select>
									</div>
									<div class="search-input-wrapper milo">
										<div class="text-field-wrapper">
											<input name="bookName" id="bookName" value="" tabindex="1" class="search-input milo" autocomplete="off" />
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="masthead-bar box" data-bntrack="Category_Nav">
					<nav id="horiz-navigation-1" data-bn-widget-name="horiz-navigation" class="horiz-navigation">
						<ul class="c15-15col c17-17col">
							<li id="horiz-navigation-1-store-2" class=" " data-bntrack="NOOK+Books-2" data-bntrack-event="view"><a
								href="searchBook?bookType=fiction" class="milo ">Fiction</a></li>
							<li id="horiz-navigation-1-store-3" class=" " data-bntrack="Textbooks-4" data-bntrack-event="view"><a
								href="searchBook?bookType=textbook">Textbooks</a></li>
							<li id="horiz-navigation-1-store-4" class=" " data-bntrack="Newsstand-5" data-bntrack-event="view"><a
								href="searchBook?bookType=kid">Kid's Book</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div itemscope="">
		<div class="page-content-wrapper box centered-width full">
			<section class="page-content column"></section>
		</div>
		<div class="page-content-wrapper box centered-width l2r wide">
			<aside class="page-sidebar column ">
				<div id="top-sidebar-layout-1" data-bn-widget-name="top-sidebar-layout" class="wrapper top-sidebar-layout">
					<div id="product-image-smaller-1" data-bn-widget-name="product-image-smaller" data-bntrack="Product Image"
						class="product-image product-image-smaller" data-bntrack-root="true">
						<div class="image-block smaller-product" data-bntrack="Hero Product" style="cursor: pointer;">
							<img height="390" width="260" itemprop="image" data-expand-image="" class="product-image image img book"
								alt="I&#39;ve Got You Under My Skin" src="./resources/images/books/${book.image}_big.JPG" id="rnd-1717549997">
						</div>
						<div class="product-thumbs thumbs box smaller-product" data-bntrack="ImageThumbnails"></div>
					</div>
					<div class="yui3-widget yui3-productimageviewer yui3-widget-positioned"
						style="position: relative; left: -124px; top: -721px;"></div>
					<div id="product-promos-aside-1" data-bn-widget-name="product-promos-aside" data-bntrack="Promos"
						class="nook-below product-promos product-promos-aside" data-bntrack-root="true"></div>
				</div>
			</aside>
			<section class="page-content column">
				<a id="mainContent" tabindex="0"></a>
				<div id="top-content-title-with-share-1" data-bn-widget-name="top-content-title-with-share"
					class="wrapper top-content-title-with-share">
					<div id="product-title-1" data-bn-widget-name="product-title" data-bntrack="Product Title"
						class="product-title product-title" data-bntrack-root="true">
						<h1 class="milo" itemprop="name">${book.bookName}</h1>
						<ul class="contributors">
							<li class="byline">by</li>
							<li>${book.author}</li>
						</ul>
						<div class="reviews-share box">
							<div class="share-bar">
								<div id="product-share-1" data-bn-widget-name="product-share" data-bntrack="ShareBar"
									class="box product-share product-share show" data-bntrack-root="Share">
									<div class="like-button">
										<div class="more-shares">
											<div id="add-to-list-layout-1" data-bn-widget-name="add-to-list-layout" class="add-to-list-layout">
												<div id="menu-item-overlay-rnd-1530503286" class="menu-item-overlay hide ">
													<div class="content box">
														<div id="add-to-list-1" data-bn-widget-name="add-to-list" class="add-to-list">
															<ul>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="top-content-book-1" data-bn-widget-name="top-content-book" class="wrapper top-content-book">
						<div id="product-commentary-snippet-1" data-bn-widget-name="product-commentary-snippet" data-bntrack="Information"
							class="product-commentary-snippet" data-bntrack-root="true">
							<div id="product-commentary-overview-1" data-bn-widget-name="product-commentary-overview"
								class="box with-bullets product-commentary product-commentary-overview">
								<aside></aside>
								<section>
									<div class="fade-to-more">
										<div class="content box">
											<h3>Overview</h3>
											<div class="simple-html">${book.detail}</div>
										</div>
									</div>
								</section>
							</div>
						</div>
						<div class="fade-out"></div>
						<div id="single-gradient-wrap-layout-1" data-bn-widget-name="single-gradient-wrap-layout"
							class="box gradient-wrap single-gradient-wrap-layout">
							<div class="fade-in"></div>
							<div class="fade-out"></div>
							<div id="product-buy-box-2s-1" data-bn-widget-name="product-buy-box-2s" data-bntrack="HeroBuyBox"
								class="box product-buy-box-layout equal-sections product-buy-box product-buy-box-top-border  buy-box-2s buy-box-2es product-buy-box-2s"
								data-bntrack-root="true">
								<div class="right">
									<div id="product-shipping-1" data-bn-widget-name="product-shipping" class="product-shipping">
										<div class="shipping"></div>
									</div>
								</div>
								<div class="left">
									<div class="left-top">
										<div id="product-price-1" data-bn-widget-name="product-price" class="product-price">
											<div class="bb-title"></div>
											<div class="bb-pricing" itemprop="offers" itemscope="">
												<div class="price hilight" itemprop="price" data-bntrack="Price" data-bntrack-event="click">$${book.price}</div>
											</div>
										</div>
										<div class="left-bottom">
											<div id="product-purchase-1" data-bn-widget-name="product-purchase" class="purchase product-purchase">
												<div class="purchase-options-wrapper">
													<form name="WWW.CART.ADD" action="" id="instant_purchase_form_rnd-85502561" target="_self"
														class="instant_purchase_form" method="POST">
														<input type="hidden" name="bookId" id="bookId" value="${book.bookId}"> <input type="hidden"
															name="bookName" id="bookName" value="${book.bookName}"> <input type="hidden" name="author"
															id="author" value="${book.author}"> <input type="hidden" name="image" id="image"
															value="${book.image}"> <input type="hidden" name="price" id="price" value="${book.price}">
														<button type="button" id="addCartBtn" class="primary primary add-to-cart">Add to Bag</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<footer class="box"> </footer>
							<div>
</body>
</html>
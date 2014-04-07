<%@ include file="./include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>TaoTao's BookStore</title>
<link href="./resources/css/resources2.css" type="text/css" rel="stylesheet">
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
	<div class="two-column-sidebar-content-container">
		<div class="page-content-wrapper box centered-width l2r trim">
			<aside class="page-sidebar column  shadowed">
				<div id="search-filter-1" data-bn-widget-name="search-filter"
					class="search-filter yui3-widget yui3-filter yui3-filter-content">
					<div class="wrapper" data-bntrack="Refinements" data-bntrack-root="true" data-bntrack-pageaware="true">
						<ul class="filter-set">
							<li class="filter" data-bntrack="Categories">
								<div class="filter-name milo">Categories</div>
								<div class="filter-hider">
									<ul class="filter-value-set">
										<li class="filter-value"><a href="searchBook?bookType=fiction" class="filter-value-a" rel="nofollow">Fiction</a></li>
										<li class="filter-value"><a href="searchBook?bookType=textbook" class="filter-value-a" rel="nofollow">Textbook</a></li>
										<li class="filter-value"><a href="searchBook?bookType=kid" class="filter-value-a" rel="nofollow">Kid's
												Book</a></li>
									</ul>
								</div> <a class="filter-toggle" href="" title="Toggle">Toggle</a>
							</li>
							<li class="filter" data-bntrack="Price+Range">
								<div class="filter-name milo">Price Range</div>
								<div class="filter-hider">
									<ul class="filter-value-set">
										<li class="filter-value"><a href="searchBookByPrice?priceLevel=1" class="filter-value-a" rel="nofollow">Under
												$10</a></li>
										<li class="filter-value"><a href="searchBookByPrice?priceLevel=2" class="filter-value-a" rel="nofollow">$10
												- $25</a></li>
										<li class="filter-value"><a href="searchBookByPrice?priceLevel=3" class="filter-value-a" rel="nofollow">$25
												- $50</a></li>
										<li class="filter-value"><a href="searchBookByPrice?priceLevel=4" class="filter-value-a" rel="nofollow">Over
												$50</a></li>
									</ul>
								</div> <a class="filter-toggle" href="" title="Toggle">Toggle</a>
							</li>
						</ul>
					</div>
				</div>
			</aside>
			<section class="page-content column  c15-12col c17-14col ">
				<div id="search-results-1" data-bn-widget-name="search-results" class="grid search-results">
					<ol class="result-set box" data-bntrack="Search Results grid" data-bntrack-root="true"
						data-bntrack-pageaware="true">
						<c:forEach items="${bookList}" var="book" varStatus="status">
							<li class="result box " id="search-result0" data-bntrack="${status.count}">
								<div class="display-tile-item axis-aligned border" data-bn-ean="9780316206877" data-product-code="BK">
									<div class="thumb above-axis">
										<div class="image-block small" data-bntrack="Hero Product">
											<a href="showBookDetail?bookId=${book.bookId}" hidefocus="true" data-bntrack="ProductImageMain"><img
												height="166" width="107" itemprop="image" data-expand-image="1" class="product-image image img book"
												alt="The Silkworm (Cormoran Strike Series #2)" src="./resources/images/books/${book.image}.JPG"
												id="rnd-1546482138"> <span class="custom-icon-hook"></span> </a>
										</div>
										<span></span>
									</div>
									<div class="details below-axis">
										<a href="showBookDetail?bookId=${book.bookId}" class="title"><span>${book.bookName}</span></a> ${book.author}
										<div class="price-format">
											<span class="price">${book.price}</span>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ol>
				</div>
		</div>
		</section>
	</div>
	</div>
	<footer class="box"> </footer>
</body>
</html>
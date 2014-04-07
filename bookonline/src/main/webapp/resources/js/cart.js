utils = {
	setParam : function(name, value) {
		localStorage.setItem(name, value);
	},
	getParam : function(name) {
		return localStorage.getItem(name);
	}
};

book = {
	bookid : "",
	bookname : "",
	author : "",
	image : "",
	quantity : 0,
	price : 0.00
};
orderdetail = {
	userid : "",
	shipaddress : "",
	creditno : "",
	totalAmount : 0.00
};

cart = {
	// Add book to cart
	addBook : function(book) {
		var ShoppingCart = utils.getParam("BookShoppingCart");
		if (ShoppingCart == null || ShoppingCart == "") {
			// Add book first
			var jsonstr = {
				"booklist" : [ {
					"bookid" : book.bookid,
					"bookname" : book.bookname,
					"author" : book.author,
					"image" : book.image,
					"quantity" : book.quantity,
					"price" : book.price
				} ],
				"totalAmount" : (book.price * book.quantity)
			};
			utils.setParam("BookShoppingCart", "'" + JSON.stringify(jsonstr));
		} else {

			var jsonstr = JSON.parse(ShoppingCart
					.substr(1, ShoppingCart.length));
			var booklist = jsonstr.booklist;
			var result = false;
			// Search if there is the book
			for ( var i in booklist) {
				if (booklist[i].bookid == book.bookid) {
					if (booklist[i].quantity == null) {
						booklist[i].quantity = 0;
					}
					booklist[i].quantity = parseInt(booklist[i].quantity)
							+ parseInt(book.quantity);
					result = true;
				}
			}
			if (!result) {
				// Add the book to cart
				booklist.push({
					"bookid" : book.bookid,
					"bookname" : book.bookname,
					"author" : book.author,
					"image" : book.image,
					"quantity" : book.quantity,
					"price" : book.price
				});
			}
			// Recalculate cost
			if (jsonstr.totalAmount == null) {
				jsonstr.totalAmount = 0;
			}
			jsonstr.totalAmount = (parseFloat(jsonstr.totalAmount)
					+ (parseInt(book.quantity) * parseFloat(book.price))).toFixed(2);
			orderdetail.totalAmount = jsonstr.totalAmount;
			// Save the cart
			utils.setParam("BookShoppingCart", "'" + JSON.stringify(jsonstr));
		}
	},
	// Modify the quantity of book
	updateBookQuantity : function(bookid, quantity) {
		var ShoppingCart = utils.getParam("BookShoppingCart");
		var jsonstr = JSON.parse(ShoppingCart.substr(1, ShoppingCart.length));
		var booklist = jsonstr.booklist;

		for ( var i in booklist) {
			if (booklist[i].bookid == bookid) {
				jsonstr.totalAmount = (parseFloat(jsonstr.totalAmount) + ((parseInt(quantity) * parseFloat(booklist[i].price)) - parseInt(booklist[i].quantity)
						* parseFloat(booklist[i].price))).toFixed(2);
				booklist[i].quantity = parseInt(quantity);

				orderdetail.totalAmount = jsonstr.totalAmount;
				utils.setParam("BookShoppingCart", "'"
						+ JSON.stringify(jsonstr));
				return;
			}
		}
	},
	// Get all book list
	getBookList : function() {
		var ShoppingCart = utils.getParam("BookShoppingCart");
		var jsonstr = JSON.parse(ShoppingCart.substr(1, ShoppingCart.length));
		var booklist = jsonstr.booklist;
		orderdetail.totalAmount = jsonstr.totalAmount;
		return booklist;
	},

	// Check the book is exist
	existBook : function(bookid) {
		var ShoppingCart = utils.getParam("BookShoppingCart");
		var jsonstr = JSON.parse(ShoppingCart.substr(1, ShoppingCart.length));
		var booklist = jsonstr.booklist;
		var result = false;
		for ( var i in booklist) {
			if (booklist[i].bookid == book.bookid) {
				result = true;
			}
		}
		return result;
	},

	// Remove from cart
	deleteBook : function(bookid) {
		var ShoppingCart = utils.getParam("BookShoppingCart");
		var jsonstr = JSON.parse(ShoppingCart.substr(1, ShoppingCart.length));
		var booklist = jsonstr.booklist;
		var list = [];
		for ( var i in booklist) {
			if (booklist[i].bookid == bookid) {
				jsonstr.totalAmount = (parseFloat(jsonstr.totalAmount) - parseInt(booklist[i].quantity)
						* parseFloat(booklist[i].price)).toFixed(2);
			} else {
				list.push(booklist[i]);
			}
		}
		jsonstr.booklist = list;
		orderdetail.totalAmount = jsonstr.totalAmount;
		utils.setParam("BookShoppingCart", "'" + JSON.stringify(jsonstr));
	}
};

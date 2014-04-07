package edu.npu.onlinebook.domain;

import java.io.Serializable;

public class Book implements Serializable {

	private static final long serialVersionUID = 1L;

	private long bookId;
	private String bookName;
	private String bookType;
	private String author;
	private String detail;
	private String image;
	private float price;

	public Book() {
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	
	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String toString() {
		String bookStr = "Book[" + bookName + " " + image + "]";
		return bookStr;
	}

	public boolean equals(Object otherObj) {
		Book otherBook;

		if (!(otherObj instanceof Book))
			return false;
		otherBook = (Book) otherObj;
		return (bookId == otherBook.bookId && bookName
				.equals(otherBook.bookName));
	}
}

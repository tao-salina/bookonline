package edu.npu.onlinebook.domain;

import java.io.Serializable;

public class OrderDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	private long orderDetailId;
	private long orderId;
	private long bookId;
	private int quantity;

	public OrderDetail() {
	}

	public long getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(long orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String toString() {
		String OrderDetailStr = "OrderDetail[" + orderDetailId + " , orderId: "
				+ orderId + "  bookId: " + bookId + "]";
		return OrderDetailStr;
	}

}

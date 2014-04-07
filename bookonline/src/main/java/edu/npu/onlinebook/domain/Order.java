package edu.npu.onlinebook.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {

	private static final long serialVersionUID = 1L;

	private long orderId;
	private long userId;
	private Date date;
	private float totalAmount;
	private String creditNo;
	private String shipAddress;
	private List<OrderDetail> details;

	public List<OrderDetail> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}

	public Order() {
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getCreditNo() {
		return creditNo;
	}

	public void setCreditNo(String creditNo) {
		this.creditNo = creditNo;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String toString() {
		String orderStr = "Order[" + orderId + " userId= " + userId + " ]\n";
		if (details != null) {
			for (OrderDetail detail : details) {
				orderStr = orderStr + " Bookid :" + detail.getBookId() + "\n";
			}
		}
		return orderStr;
	}

}

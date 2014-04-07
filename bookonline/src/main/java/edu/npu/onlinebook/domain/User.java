package edu.npu.onlinebook.domain;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	private long userId;
	private String lastName;
	private String firstName;
	private String email;
	private String password;

	public User() {
		userId = 0;
		firstName = "";
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String toString() {
		String userStr = "User[" + firstName + " " + lastName + "  email: "
				+ email + "]";
		return userStr;
	}

	public boolean equals(Object otherObj) {
		User otherUser;

		if (!(otherObj instanceof User))
			return false;
		otherUser = (User) otherObj;
		return (userId == otherUser.userId
				&& lastName.equals(otherUser.lastName) && firstName
					.equals(otherUser.firstName));
	}
}

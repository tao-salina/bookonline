package edu.npu.onlinebook.services;

import edu.npu.onlinebook.domain.User;

public interface UserService {

	public void addNewUser(User user);

	public User login(String email, String password);

}

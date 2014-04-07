package edu.npu.onlinebook.dao;

import edu.npu.onlinebook.domain.User;

public interface UserDao {

	public User findUserByEmailAndPswd(String email, String password);
	
	public User findUserById(long userId);

	public void insertUser(User user);

}

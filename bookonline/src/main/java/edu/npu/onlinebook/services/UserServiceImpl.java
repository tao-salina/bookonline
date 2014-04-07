package edu.npu.onlinebook.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.npu.onlinebook.dao.UserDao;
import edu.npu.onlinebook.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	@Qualifier("UserDaoJdbcImpl")
	private UserDao userDao;

	@Transactional
	public void addNewUser(User user) {
		userDao.insertUser(user);
	}

	public User login(String email, String password) {
		User user = userDao.findUserByEmailAndPswd(email, password);;
		
		return user;
	}

}

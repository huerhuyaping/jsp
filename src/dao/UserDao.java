package dao;

import entity.User;

public interface UserDao {
	int addUser(User user);
	int login(String username, String password);
}

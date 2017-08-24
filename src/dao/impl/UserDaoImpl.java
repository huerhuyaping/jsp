package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import entity.User;
import util.BaseDao;

public class UserDaoImpl extends BaseDao implements UserDao{

	public int addUser(User user) {
		int result=0;
		String sql="insert into news_user(userName,password) values (?,?)";
		result=this.executeUpdate(sql, user.getUserName(),user.getPassword());
		return result;
	}

	public int login(String userName, String password) {
		int result =0;
		String sql = "select * from news_user where userName = ? and password = ?";
		Object[] param={userName,password};
		ResultSet rs=this.excuteQuery(sql, param);
		try {
			while(rs.next()){
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


}

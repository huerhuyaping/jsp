package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class BaseDao {
	static String driver=null;
	static String url=null;
	static String user=null;
	static String password=null;
	
	static{
		init();
	}
	
	//��ȡ�����ļ�
	public static void init(){
		Properties properties=new Properties();
		String config="database.properties";
		InputStream is=BaseDao.class.getClassLoader().getResourceAsStream(config);
		try {
			properties.load(is);
			driver=properties.getProperty("driver");
			url=properties.getProperty("url");
			user=properties.getProperty("user");
			password=properties.getProperty("password");
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	protected Connection conn=null;
	protected PreparedStatement pstmt=null;
	protected ResultSet rs=null;
	
	//��ȡ����
	public Connection getConnection(){
		if(conn==null){
			try {
				Class.forName(driver);
				conn=DriverManager.getConnection(url,user,password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return conn;
	}
	
	//�ر�����
	public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//��ɾ��ͨ�÷���
	public int executeUpdate(String sql,Object...params){
		int result=0;
		conn=this.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//��ռλ����ֵ
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1, params[i]);
			}
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(conn,pstmt,null);
		}
		return result;
	}
	//��ͨ�÷���
	public ResultSet excuteQuery(String sql,Object...params){
		conn=this.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//��ռλ����ֵ
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1, params[i]);
			}
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

}

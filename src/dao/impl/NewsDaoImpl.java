package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.NewsDao;
import entity.News;
import util.BaseDao;

public class NewsDaoImpl extends BaseDao implements NewsDao{

	public int add(News news) {
		String sql="insert into news_detail(title,author,createDate) values(?,?,?)";
		SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d=new Date();
		String riqi=formater.format(d);
		Object[] param={news.getTitle(),news.getAuthor(),riqi};
		int result=this.executeUpdate(sql, param);
		return result;
	}

	public int update(News news) {
		String sql="update news_detail set author=?,title=? where id=?";
		Object[] param={news.getAuthor(),news.getTitle(),news.getId()};
		int result=this.executeUpdate(sql, param);
		return result;
	}

	public int delete(News news) {
		String sql="delete from news_detail where id=?";
		Object[] param={news.getId()};
		int result=this.executeUpdate(sql, param);
		return result;
	}

	public List<News> getAll() {
		List<News> newslist=new ArrayList<News>();
		String sql="select * from news_detail";
		ResultSet rs=this.excuteQuery(sql);
		try {
			while(rs.next()){
				News news=new News();
				news.setId(rs.getInt(1));
				news.setCategoryId(rs.getInt(2));
				news.setTitle(rs.getString(3));
				news.setSummary(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setPicPath(rs.getString(6));
				news.setAuthor(rs.getString(7));
				news.setCreateDate(rs.getDate(8));
				news.setModifyDate(rs.getDate(9));
				newslist.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(conn,pstmt,rs);
		}
		return newslist;
	}

	public News getById(String id) {
		String sql="select * from news_detail where id=?";
		Object[] param={id};
		ResultSet rs=this.excuteQuery(sql, param);
		try {
			while(rs.next()){
				News news=new News();
				news.setId(rs.getInt(1));
				news.setCategoryId(rs.getInt(2));
				news.setTitle(rs.getString(3));
				news.setSummary(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setPicPath(rs.getString(6));
				news.setAuthor(rs.getString(7));
				news.setCreateDate(rs.getDate(8));
				news.setModifyDate(rs.getDate(9));
				return news;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getNewsCount() {
		ResultSet rs= null;
		int count =-1;
		String sql = "select count(1) from news_detail";
		try {
			rs = this.excuteQuery(sql);
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(null,null,rs);
		}
		return count;
	}

	public List<News> getNewsList(int currPageNo, int pageSize) {
		List<News> newslist=new ArrayList<News>();	
		String sql="select * from news_detail limit ?,?";
		
		int startIndex = (currPageNo-1)*pageSize;
		
		ResultSet rs=this.excuteQuery(sql,startIndex,pageSize);
		try {
			while(rs.next()){
				News news=new News();
				news.setId(rs.getInt(1));
				news.setCategoryId(rs.getInt(2));
				news.setTitle(rs.getString(3));
				news.setSummary(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setPicPath(rs.getString(6));
				news.setAuthor(rs.getString(7));
				news.setCreateDate(rs.getDate(8));
				news.setModifyDate(rs.getDate(9));
				newslist.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(null,null,rs);
		}
		return newslist;
	}

	public List<News> getNewsListByKey(String key, int currPageNo, int pageSize) {
		List<News> newslist=new ArrayList<News>();	
		String sql="select * from news_detail where title like ? limit ?,?";
		
		int startIndex = (currPageNo-1)*pageSize;
		Object[] keyword = new Object[]{"%"+key+"%"};
		ResultSet rs=this.excuteQuery(sql,keyword,startIndex,pageSize);
		try {
			while(rs.next()){
				News news=new News();
				news.setId(rs.getInt(1));
				news.setCategoryId(rs.getInt(2));
				news.setTitle(rs.getString(3));
				news.setSummary(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setPicPath(rs.getString(6));
				news.setAuthor(rs.getString(7));
				news.setCreateDate(rs.getDate(8));
				news.setModifyDate(rs.getDate(9));
				newslist.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(null,null,rs);
		}
		return newslist;
	}
}


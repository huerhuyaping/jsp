package dao;

import java.util.List;

import entity.News;

public interface NewsDao {
	//增，删，改，查
	public int add(News news);
	
	public int update(News news);
	
	public int delete(News news);
	
	public List<News> getAll();
	
	public News getById(String id);
	
	//查询新闻数目
	public int getNewsCount();
	
	//分页显示
	public List<News> getNewsList(int currPageNo,int pageSize);
	
	//模糊查询
	public List<News> getNewsListByKey(String key,int currPageNo,int pageSize);

}

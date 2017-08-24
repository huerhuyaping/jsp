package dao;

import java.util.List;

import entity.News;

public interface NewsDao {
	//����ɾ���ģ���
	public int add(News news);
	
	public int update(News news);
	
	public int delete(News news);
	
	public List<News> getAll();
	
	public News getById(String id);
	
	//��ѯ������Ŀ
	public int getNewsCount();
	
	//��ҳ��ʾ
	public List<News> getNewsList(int currPageNo,int pageSize);
	
	//ģ����ѯ
	public List<News> getNewsListByKey(String key,int currPageNo,int pageSize);

}

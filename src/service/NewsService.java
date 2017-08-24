package service;

import util.Page;

public interface NewsService {
	public Page getNewsList(int currPageNo,int pageSize);
	public Page getNewsList(String key,int currPageNo,int pageSize);
}

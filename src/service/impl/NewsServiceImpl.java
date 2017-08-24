package service.impl;

import java.util.List;

import dao.NewsDao;
import dao.impl.NewsDaoImpl;
import entity.News;
import service.NewsService;
import util.Page;

public class NewsServiceImpl implements NewsService {

	public Page getNewsList(int currPageNo, int pageSize) {
		NewsDao newsdao = new NewsDaoImpl();
		Page page = new Page();
		//设置page参数
		page.setCurrPageNo(currPageNo);
		page.setPageSize(pageSize);
		//查询总记录数
		int totalCount = newsdao.getNewsCount();
		//计算总页数
		page.setTotalCount(totalCount);
		List<News> newsList = newsdao.getNewsList(currPageNo, pageSize);
		page.setNewsList(newsList);
		return page;
	}

	public Page getNewsList(String key, int currPageNo, int pageSize) {
		NewsDao newsdao = new NewsDaoImpl();
		Page page = new Page();
		//设置page参数
		page.setCurrPageNo(currPageNo);
		page.setPageSize(pageSize);
		//查询总记录数
		int totalCount = newsdao.getNewsCount();
		//计算总页数
		page.setTotalCount(totalCount);
		List<News> newsList = newsdao.getNewsListByKey(key, currPageNo, pageSize);
		page.setNewsList(newsList);
		return page;
	}

}

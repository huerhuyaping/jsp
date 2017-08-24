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
		//����page����
		page.setCurrPageNo(currPageNo);
		page.setPageSize(pageSize);
		//��ѯ�ܼ�¼��
		int totalCount = newsdao.getNewsCount();
		//������ҳ��
		page.setTotalCount(totalCount);
		List<News> newsList = newsdao.getNewsList(currPageNo, pageSize);
		page.setNewsList(newsList);
		return page;
	}

	public Page getNewsList(String key, int currPageNo, int pageSize) {
		NewsDao newsdao = new NewsDaoImpl();
		Page page = new Page();
		//����page����
		page.setCurrPageNo(currPageNo);
		page.setPageSize(pageSize);
		//��ѯ�ܼ�¼��
		int totalCount = newsdao.getNewsCount();
		//������ҳ��
		page.setTotalCount(totalCount);
		List<News> newsList = newsdao.getNewsListByKey(key, currPageNo, pageSize);
		page.setNewsList(newsList);
		return page;
	}

}

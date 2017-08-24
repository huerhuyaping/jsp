package util;

import java.util.List;

import entity.News;

public class Page {
	private int currPageNo = 1 ; //当前页
	private int pageSize = 5 ; //页面大小，每页的记录数
	private int totalCount;		// 总记录数
	private int totalPageCount;	//总页数
	List<News> newsList;		//新闻集合
	public int getCurrPageNo() {
		return currPageNo;
	}
	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize ==0 ? 5 :pageSize ;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if(totalCount > 0){
			//计算总页数
			totalPageCount = (this.totalCount%pageSize == 0) ?
					(this.totalCount/pageSize) :
						((this.totalCount/pageSize)+1);
		}else{
			totalPageCount = 0;
		}
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	
	

}

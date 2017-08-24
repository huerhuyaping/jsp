package util;

import java.util.List;

import entity.News;

public class Page {
	private int currPageNo = 1 ; //��ǰҳ
	private int pageSize = 5 ; //ҳ���С��ÿҳ�ļ�¼��
	private int totalCount;		// �ܼ�¼��
	private int totalPageCount;	//��ҳ��
	List<News> newsList;		//���ż���
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
			//������ҳ��
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

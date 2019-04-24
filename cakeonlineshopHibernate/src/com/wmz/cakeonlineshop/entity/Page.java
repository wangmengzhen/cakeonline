package com.wmz.cakeonlineshop.entity;

import java.util.List;

public class Page<T> {
	private List<Cake> list;
	private int prePageNum;//上一页
	private int nextPageNum;//下一页
	private int totalCount;//总共几条记录
	private int totalPageNum;//末页
	private int pageSize;//每页几条数据
	private int pageNum;//当前页码
	
	public Page(int pageSize, int pageNum) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
	}
	public List<Cake> getList() {
		return list;
	}
	public void setList(List<Cake> list) {
		this.list = list;
	}
	public int getPrePageNum() {
		return prePageNum;
	}
	public void setPrePageNum(int prePageNum) {
		this.prePageNum = prePageNum;
	}
	public int getNextPageNum() {
		return nextPageNum;
	}
	public void setNextPageNum(int nextPageNum) {
		this.nextPageNum = nextPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if(totalCount%pageSize==0) {
			totalPageNum=totalCount/pageSize;
		}else {
			totalPageNum=totalCount/pageSize+1;
		}
		if(pageNum>1)
			prePageNum=pageNum-1;
		else
			prePageNum=1;
		
		if(pageNum<totalPageNum)
			nextPageNum=pageNum+1;
		else
			nextPageNum=totalPageNum;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
}

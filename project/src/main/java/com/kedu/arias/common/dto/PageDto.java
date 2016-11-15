package com.kedu.arias.common.dto;

public class PageDto {
	private int firstBlock;
	private int lastBlock;

	private int prevPage;
	private int nextPage;
	private int isEmpty;
	private int curPage;
	
	private String searchType;
	private String keyword;
			
	
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getIsEmpty() {
		return isEmpty;
	}
	public void setIsEmpty(int isEmpty) {
		this.isEmpty = isEmpty;
	}
	public int getFirstBlock() {
		return firstBlock;
	}
	public void setFirstBlock(int firstBlock) {
		this.firstBlock = firstBlock;
	}
	public int getLastBlock() {
		return lastBlock;
	}
	public void setLastBlock(int lastBlock) {
		this.lastBlock = lastBlock;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	@Override
	public String toString() {
		return "PageDto [firstBlock=" + firstBlock + ", lastBlock=" + lastBlock + ", prevPage=" + prevPage
				+ ", nextPage=" + nextPage + ", isEmpty=" + isEmpty + ", curPage=" + curPage + ", searchType="
				+ searchType + ", keyword=" + keyword + "]";
	}
	
}

package co.makeu.up.common.view;

import lombok.Data;

@Data
public class PaginationFive {
	private int pageSize = 5; // 한 페이지당 보일 게시물 리스트 수
	private int rangeSize = 5; // 한 페이지당 보일 페이지 개수
	private int currPage = 1; // 현재 페이지 번호
	private int currRange = 1; // 현재 블럭
	private int listCnt; // 전체 게시물 개수
	private int pageCnt; // 전체 페이지 개수
	private int rangeCnt; // 총 블럭 수
	private int startPage = 1; // 시작 페이지
	private int endPage = 1; // 각 페이지 범위 끝 번호
	private int startIndex = 0;
	private int prev;
	private int next;
	
	public PaginationFive(int listCnt, int currPage) {
		setCurrPage(currPage);
		setListCnt(listCnt);
		setPageCnt(listCnt);
		setRangeCnt(pageCnt);
		rangeSetting(currPage);
		setStartIndex(currPage);
	}
	
	public void setPageCnt(int listCnt) {
	    this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
	}
	public void setRangeCnt(int pageCnt) {
	    this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
	}
	public void rangeSetting(int currPage) {
		setCurrPage(currPage);
		this.startPage = (currRange -1) * rangeSize +1;
		this.endPage = startPage + rangeSize - 1;
		if(endPage > pageCnt) {
			this.endPage = pageCnt;
		}
		this.prev = currPage - 1;
		this.next = currPage + 1;
	}
	public void setCurrRange(int currRange) {
		this.currRange = ((currPage - 1)/rangeSize) + 1;
	}
	public void setStartIndex(int currPage) {
		this.startIndex = (currPage -1) * pageSize;
	}
	
}

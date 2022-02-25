package co.makeu.up.page.vo;

import co.makeu.up.board.service.BoardVO;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVo {

	private int startpage;
	private int endpage;
	private boolean prev ,next;
	
	private int total;
	
	//vo에따라서 계속 만들어야함
	//private Vo클래스 vo;
	
	/* 
	public PageVo(Vo클래스 vo , int total) {
		this.vo  = vo;
		this.total = total;
		this.endpage = (int) (Math.ceil(vo.getPageNum() / 5.0)) *5;
		
		this.startpage = this.endpage - 4;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / vo.getAmount()));
		
		if(realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage > 1;
		this.next = this.endpage < realEnd;
	}
	*/
	
	//PageVo
	private BoardVO boardVo;
	
	public PageVo(BoardVO boardVo, int total) {
		this.boardVo = boardVo;
		this.total = total;
		this.endpage = (int) (Math.ceil(boardVo.getPageNum() / 5.0)) *5;
		
		this.startpage = this.endpage - 4;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / boardVo.getAmount()));
		
		if(realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage > 1;
		this.next = this.endpage < realEnd;
	}

	
}

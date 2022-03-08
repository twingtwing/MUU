package co.makeu.up.common.view;

import co.makeu.up.board.service.BoardVO;
import co.makeu.up.faq.service.FaqVO;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.refund.service.RefundVO;
import co.makeu.up.report.service.ReportVO;
import lombok.Getter;
import lombok.ToString;

@Getter 
@ToString
public class PageVo {

	private int startpage;
	private int endpage;
	private boolean prev, next;

	private int total;

	// vo�뿉�뵲�씪�꽌 怨꾩냽 留뚮뱾�뼱�빞�븿
	// private Vo�겢�옒�뒪 vo;

	/*
	 * public PageVo(Vo�겢�옒�뒪 vo , int total) { this.vo = vo; this.total = total;
	 * this.endpage = (int) (Math.ceil(vo.getPageNum() / 5.0)) *5;
	 * 
	 * this.startpage = this.endpage - 4;
	 * 
	 * int realEnd = (int) (Math.ceil((total * 1.0) / vo.getAmount()));
	 * 
	 * if(realEnd < this.endpage) { this.endpage = realEnd; } this.prev =
	 * this.startpage > 1; this.next = this.endpage < realEnd; }
	 */
	private BoardVO vo;

	public PageVo(BoardVO vo, int total) {
		this.vo = vo;
		this.total = total;
		this.endpage = (int) (Math.ceil(vo.getPageNum() / 5.0)) * 5;

		this.startpage = this.endpage - 4;
		int realEnd = (int) (Math.ceil((total * 1.0) / vo.getAmount()));

		if (realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage > 1;
		this.next = this.endpage < realEnd;
	}

	private RefundVO rvo;

	public PageVo(RefundVO rvo, int total) {
		this.rvo = rvo;
		this.total = total;
		this.endpage = (int) (Math.ceil(rvo.getPageNum() / 5.0)) * 5;

		this.startpage = this.endpage - 4;
		int realEnd = (int) (Math.ceil((total * 1.0) / rvo.getAmount()));

		if (realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage > 1;
		this.next = this.endpage < realEnd;
	}

	private ReportVO vot;
	
	public PageVo (ReportVO vot , int total) {
		this.vot = vot;
		this.total = total;
		this.endpage = (int) (Math.ceil(vot.getPageNum()/5.0)) *5;
		
		this.startpage = this.endpage -4;
		int realEnd = (int) (Math.ceil((total*1.0)/vot.getAmount()));
		
		if(realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage >1;
		this.next = this .endpage < realEnd;
	}
	
	private LectureVO lvo;

	public PageVo(LectureVO lvo, int total) {
		this.lvo = lvo;
		this.total = total;
		this.endpage = (int) (Math.ceil(lvo.getPageNum() / 5.0)) * 5;

		this.startpage = this.endpage - 4;
		int realEnd = (int) (Math.ceil((total * 1.0) / lvo.getAmount()));

		if (realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage > 1;
		this.next = this.endpage < realEnd;
	}
	
	private FaqVO fvo;

	public PageVo(FaqVO fvo, int total) {
		this.fvo = fvo;
		this.total = total;
		this.endpage = (int) (Math.ceil(fvo.getPageNum() / 5.0)) * 5;

		this.startpage = this.endpage - 4;
		int realEnd = (int) (Math.ceil((total * 1.0) / fvo.getAmount()));

		if (realEnd < this.endpage) {
			this.endpage = realEnd;
		}
		this.prev = this.startpage > 1;
		this.next = this.endpage < realEnd;
	}
}

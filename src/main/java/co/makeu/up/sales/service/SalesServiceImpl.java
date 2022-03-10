package co.makeu.up.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.makeu.up.sugang.service.SugangVO;

@Service("salesDao")
public class SalesServiceImpl implements SalesMapper{
	@Autowired SalesMapper map;
	
	@Override
	public List<SalesVO> salesByYear() {
		return map.salesByYear();
	}

	@Override
	public List<SalesVO> salesByMonth(String year) {
		return map.salesByMonth(year);
	}

	@Override
	public List<SalesVO> salesByCtgrYear() {
		return map.salesByCtgrYear();
	}

	@Override
	public List<SalesVO> salesByCtgrMonth(String year) {
		return map.salesByCtgrMonth(year);
	}

	@Override
	public List<SalesVO> salesCreator(SalesVO vo) {
		return map.salesCreator(vo);
	}

	@Override
	public List<SalesVO> salesCreMonth(SalesVO vo) {
		return map.salesCreMonth(vo);
	}

	@Override
	public List<SalesVO> salesGender(String year) {
		return map.salesGender(year);
	}

	@Override
	public List<SalesVO> salesAge(String year) {
		return map.salesAge(year);
	}
	
  @Override
	public List<SugangVO> lectureTop3() {
		return map.lectureTop3();
	}

	@Override
	public List<SugangVO> creatorTop3() {
		return map.creatorTop3();
	}

	@Override
	public List<SalesVO> countList() {
		return map.countList();
	}

	@Override
	public List<SalesVO> recent7days() {
		return map.recent7days();
	}

	@Override
	public List<SalesVO> thisYearSales() {
		return map.thisYearSales();
	}
}

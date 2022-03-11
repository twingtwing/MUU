package co.makeu.up.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("salesDao")
public class SalesServiceImpl implements SalesService{
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
	public SalesVO adminHome(SalesVO vo) {
		vo.setCountList(map.countList());
		vo.setLectureTop3(map.lectureTop3());
		vo.setCreatorTop3(map.creatorTop3());
		return vo;
	}

	@Override
	public List<SalesVO> recent7days() {
		return map.recent7days();
	}

	@Override
	public List<SalesVO> thisYearSales() {
		return map.thisYearSales();
	}

	@Override
	public List<SalesVO> genderList() {
		return map.genderList();
	}

	@Override
	public List<SalesVO> creYearExcel(SalesVO vo) {
		return map.creYearExcel(vo);
	}

	@Override
	public List<SalesVO> creMonthExcel(SalesVO vo) {
		return map.creMonthExcel(vo);
	}}

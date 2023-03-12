package co.makeu.up.sales.service;

import java.util.List;

import co.makeu.up.sugang.service.SugangVO;

public interface SalesMapper {
	List<SalesVO> salesByYear();
	List<SalesVO> salesByMonth(String year);
	List<SalesVO> salesByCtgrYear();
	List<SalesVO> salesByCtgrMonth(String year);
	List<SalesVO> salesCreator(SalesVO vo);
	List<SalesVO> salesCreMonth(SalesVO vo);
	List<SalesVO> salesGender(String year);
	List<SalesVO> salesAge(String year);

	
	// main
	List<SugangVO> lectureTop3();
	List<SugangVO> creatorTop3();
	
	List<SalesVO> genderList();
	List<SalesVO> countList();
	List<SalesVO> recent7days();
	List<SalesVO> thisYearSales();
	
	//excel
	List<SalesVO> creYearExcel(SalesVO vo);
	List<SalesVO> creMonthExcel(SalesVO vo);
	
}

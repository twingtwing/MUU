package co.makeu.up.sales.service;

import java.util.List;

public interface SalesMapper {
	List<SalesVO> salesByYear();
	List<SalesVO> salesByMonth(String year);
	List<SalesVO> salesByCtgrYear();
	List<SalesVO> salesByCtgrMonth(String year);
	
	List<SalesVO> salesCreator(SalesVO vo);
	List<SalesVO> salesCreMonth(SalesVO vo);
	
	List<SalesVO> salesGender(String year);
	List<SalesVO> salesAge(String year);
}

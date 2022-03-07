package co.makeu.up.sales.service;

import java.util.List;

public interface SalesMapper {
	List<SalesVO> salesByYear();
	List<SalesVO> salesByMonth(String year);
	List<SalesVO> salesByCtgrYear();
}

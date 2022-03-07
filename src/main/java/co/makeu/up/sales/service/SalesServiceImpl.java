package co.makeu.up.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}

package co.makeu.up.creator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.sales.service.SalesVO;

@Repository("creatorDao")
public class CreatorServiceImpl implements CreatorMapper {
	@Autowired
	CreatorMapper map;

	@Override
	public CreatorVO creatorSelect(CreatorVO vo) {
		return map.creatorSelect(vo);
	}

	@Override
	public int creatorUpdate(CreatorVO vo) {
		return map.creatorUpdate(vo);
	}

	@Override
	public List<SalesVO> creSaYear(String id) {
		return map.creSaYear(id);
	}

	@Override
	public List<SalesVO> creSalesMonth(SalesVO vo) {
		return map.creSalesMonth(vo);
	}

	@Override
	public List<SalesVO> creSaleLec(SalesVO vo) {
		return map.creSaleLec(vo);
	}
	
}

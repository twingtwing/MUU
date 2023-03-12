package co.makeu.up.creator.service;

import java.util.List;

import co.makeu.up.sales.service.SalesVO;

public interface CreatorMapper {
	CreatorVO creatorSelect(CreatorVO vo);
	int creatorUpdate(CreatorVO vo);
	List<SalesVO> creSaYear(String id);
	List<SalesVO> creSalesMonth(SalesVO vo);
	List<SalesVO> creSaleLec(SalesVO vo);
}

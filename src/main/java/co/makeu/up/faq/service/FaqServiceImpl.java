package co.makeu.up.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("faqDao")
public class FaqServiceImpl implements FaqService {
	@Autowired 
	private FaqMapper map;
	
	@Override
	public List<FaqVO> faqSelectList() {
		return map.faqSelectList();
	}

	@Override
	public List<FaqVO> faqList(FaqVO vo) {
		return map.faqList(vo);
	}

	@Override
	public int insertfaq(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.insertfaq(vo);
	}

	@Override
	public int upfaq(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.upfaq(vo);
	}

	@Override
	public int delfaq(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.delfaq(vo);
	}

	@Override
	public List<FaqVO> faqListPlus(FaqVO vo) {
		
		return map.faqListPlus(vo);
	}

	@Override
	public List<FaqVO> faqListSearch(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqListSearch(vo);
	}

}

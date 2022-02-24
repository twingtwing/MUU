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

}

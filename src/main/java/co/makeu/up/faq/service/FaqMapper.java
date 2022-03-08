package co.makeu.up.faq.service;

import java.util.List;

public interface FaqMapper {
	List<FaqVO> faqSelectList();
	
	List<FaqVO> faqList(FaqVO vo); //admin - faq list
	int insertfaq(FaqVO vo);
	int upfaq(FaqVO vo);
	int delfaq(FaqVO vo);
}

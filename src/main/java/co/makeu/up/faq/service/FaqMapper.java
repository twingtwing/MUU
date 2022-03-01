package co.makeu.up.faq.service;

import java.util.List;

public interface FaqMapper {
	List<FaqVO> faqSelectList();
	
	List<FaqVO> faqList(); //admin - faq list
}

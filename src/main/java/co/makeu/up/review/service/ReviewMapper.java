package co.makeu.up.review.service;

import java.util.List;

public interface ReviewMapper {
	List<ReviewVO> reviewSelectList(ReviewVO vo);
	int reviewInsert(ReviewVO vo);
}

package co.makeu.up.review.service;

import java.util.List;

public interface ReviewMapper {
	List<ReviewVO> reviewSelectList(ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	ReviewVO selectMyReview(ReviewVO vo);
	int deleteMyReveiw(int rvNo);
	int updateMyReview(ReviewVO vo);
	
	//admin
	List<ReviewVO> adminReviewList(ReviewVO vo);
}

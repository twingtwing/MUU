package co.makeu.up.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")
public class ReviewServiceImpl implements ReviewMapper {
	@Autowired ReviewMapper map;
	
	@Override
	public List<ReviewVO> reviewSelectList(ReviewVO vo) {
		return map.reviewSelectList(vo);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		return map.reviewInsert(vo);
	}

	@Override
	public ReviewVO selectMyReview(ReviewVO vo) {
		return map.selectMyReview(vo);
	}

	@Override
	public int deleteMyReveiw(int rvNo) {
		return map.deleteMyReveiw(rvNo);
	}

	@Override
	public int updateMyReview(ReviewVO vo) {
		return map.updateMyReview(vo);
	}

	@Override
	public List<ReviewVO> adminReviewList(ReviewVO vo) {
		return map.adminReviewList(vo);
	}

}

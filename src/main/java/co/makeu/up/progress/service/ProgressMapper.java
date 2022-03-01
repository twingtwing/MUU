package co.makeu.up.progress.service;

public interface ProgressMapper {
	int insertProgress(ProgressVO vo);
	ProgressVO selectProgress(ProgressVO vo);
	int updateProgress(ProgressVO vo);
	int wholeProgress(ProgressVO vo);
	int countBeforeRefund(ProgressVO vo);
}

package co.makeu.up.users.service;

import java.sql.Date;
import java.util.List;

public interface UsersMapper {
	int insertUsers(UsersVO vo);
	String ajaxChkId(String id);
	UsersVO selectUsers(UsersVO vo);
	int changePw(UsersVO vo);
	int updateUserInfo(UsersVO vo);
	int updateUserProfileImg(UsersVO vo);
	List<Date> chkCreFarewell(String creId);
	int deleteUsers(String id);
	
	int userPointUpdate(UsersVO vo);
	int userToCreator(UsersVO vo);
	String userPwChck(String id);
	int userPointAdd(UsersVO vo);
	
	// admin
	List<UsersVO> usersList(UsersVO vo);
}

package co.makeu.up.users.service;

import java.util.Date;
import java.util.List;

public interface UsersMapper {
	int insertUsers(UsersVO vo);
	String ajaxChkId(String id);
	UsersVO selectUsers(UsersVO vo);
	int changePw(UsersVO vo);
	int updateUserInfo(UsersVO vo);
	int updateUserProfileImg(UsersVO vo);
	Date chkCreFarewell(String creId);
	int deleteUsers(String id);
	
	// admin
	List<UsersVO> usersList(UsersVO vo);
	Integer usersCount();
	Integer creatorsCount();
}

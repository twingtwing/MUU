package co.makeu.up.users.service;

public interface UsersMapper {
	int insertUsers(UsersVO vo);
	String ajaxChkId(String id);
	int changePw(UsersVO vo);
}

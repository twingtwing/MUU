package co.makeu.up.users.service;

public interface UsersMapper {
	int insertUsers(UsersVO vo);
	String ajaxChkId(String id);
<<<<<<< HEAD
=======
	UsersVO selectUsers(UsersVO vo);
	int changePw(UsersVO vo);
>>>>>>> 1922133eb878c2588ff9db09d85fdcaf4b42f3f5
}

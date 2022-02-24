package co.makeu.up.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
@Repository
=======
@Repository("userDao")
>>>>>>> 1922133eb878c2588ff9db09d85fdcaf4b42f3f5
public class UsersServiceImpl implements UsersMapper {
	@Autowired
	UsersMapper map;
	
	@Override
	public int insertUsers(UsersVO vo) {
		return map.insertUsers(vo);
	}

	@Override
	public String ajaxChkId(String id) {
		return map.ajaxChkId(id);
	}

<<<<<<< HEAD
=======
	@Override
	public UsersVO selectUsers(UsersVO vo) {
		return map.selectUsers(vo);
	}
	
	public int changePw(UsersVO vo) {
		return map.changePw(vo);
	}

>>>>>>> 1922133eb878c2588ff9db09d85fdcaf4b42f3f5
}

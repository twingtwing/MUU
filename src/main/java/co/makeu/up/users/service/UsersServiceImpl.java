package co.makeu.up.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
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

	@Override
	public UsersVO selectUsers(UsersVO vo) {
		return map.selectUsers(vo);
	}
	
	public int changePw(UsersVO vo) {
		return map.changePw(vo);
	}

}

package co.makeu.up.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersServiceImpl implements UsersService {
	@Autowired
	UsersMapper map;
	
	@Override
	public int insertUsers(UsersVO vo) {
		return map.insertUsers(vo);
	}

}

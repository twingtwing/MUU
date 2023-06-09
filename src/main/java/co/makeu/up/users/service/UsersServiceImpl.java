package co.makeu.up.users.service;

import java.sql.Date;
import java.util.List;

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

	@Override
	public int updateUserInfo(UsersVO vo) {
		return map.updateUserInfo(vo);
	}

	@Override
	public int updateUserProfileImg(UsersVO vo) {
		return map.updateUserProfileImg(vo);
	}
	@Override
	public List<Date> chkCreFarewell(String creId) {
		return map.chkCreFarewell(creId);
	}

	@Override
	public int deleteUsers(String id) {
		return map.deleteUsers(id);
	}

	@Override
	public List<UsersVO> usersList(UsersVO vo) {
		return map.usersList(vo);
	}

	@Override
	public int userPointUpdate(UsersVO vo) {
		return map.userPointUpdate(vo);
	}

	@Override
	public int userToCreator(UsersVO vo) {
		return map.userToCreator(vo);
	}

	@Override
	public String userPwChck(String id) {
		return map.userPwChck(id);
	}

	@Override
	public int userPointAdd(UsersVO vo) {
		return map.userPointAdd(vo);
	}
}

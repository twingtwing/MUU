package co.makeu.up.creator.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("creatorDao")
public class CreatorServiceImpl implements CreatorMapper {
	@Autowired
	CreatorMapper map;

	@Override
	public CreatorVO creatorSelect(CreatorVO vo) {
		return map.creatorSelect(vo);
	}

	@Override
	public int creatorUpdate(CreatorVO vo) {
		return map.creatorUpdate(vo);
	}
	
	

}

package co.makeu.up.detafile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("detafileDao")
public class DetafileServiceImpl implements DetafileService{
	@Autowired DetafileMapper map;

	@Override
	public List<DetafileVO> detaFileList(int fileNo) {
		return map.detaFileList(fileNo);
	}

}

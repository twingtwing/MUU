package co.makeu.up.notice.service;

import java.sql.Date;
import java.util.List;

import co.makeu.up.detafile.service.DetafileVO;
import lombok.Data;

@Data
public class NoticeVO {
	//list뿌려주기 위해 추가한 값
	private String rn;
	private String noticeNo;
	
	//기본값
	private int ntNo;
	private Date wrDate;
	private String ttl;
	private String content;
	private int hits;
	private int ltNo;
	private int fileNo;
	private Date modDate;
	private String ntStCode;
	
	// for pagination
	private int page;
	private int count;
	
	// for search
	private String ttlSearchKey;
	private String contentSearchKey;
	
	//for deta_file
	private List<DetafileVO> fileList;
	
}

package co.makeu.up.common.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	@Autowired
	private String saveDir;
	
	@GetMapping("/download")
	public void download(@Param("phyPath")String phyPath, HttpServletResponse response) {
		String filePath = saveDir + phyPath;
		
		File file = new File(filePath);
		
		Tika tika = new Tika();
		String contentType = null;
		try {
			contentType = tika.detect(file);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		long fileLength = file.length();
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + phyPath + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        
        try {
        	FileInputStream fis = new FileInputStream(filePath);
			OutputStream out = response.getOutputStream();
			
			int readCount = 0;
			byte [] buffer = new byte[1024];
			
			while((readCount = fis.read(buffer)) != -1) {
				out.write(buffer,0,readCount);
			}
		} catch (IOException e) {
			throw new RuntimeException("file Save Error");
		}
		
	}
}

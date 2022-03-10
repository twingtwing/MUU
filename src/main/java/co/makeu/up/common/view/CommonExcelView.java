package co.makeu.up.common.view;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;


@Component("excelView")
public class CommonExcelView  extends  AbstractXlsxView {

	private static final Logger LOGGER  = LoggerFactory.getLogger(CommonExcelView.class);
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// map인경우는 그냥 맵아니면 reflection 

		Sheet sheet = workbook.createSheet("Datatypes in Java");
		Row row;
		Cell cell;
        int rowNum = 0;

        String file_name =(String) model.get("filename") + System.currentTimeMillis() + ".xlsx";
		response.setHeader("Content-Disposition", "attachment; filename=\""+ file_name+"\"");
		//header 출력
		String[] headers  = (String[])model.get("headers");
		if(headers != null) {
			row = sheet.createRow(rowNum++);
			int colNum = 0;
			for (String header : headers) {
				row.createCell(colNum++).setCellValue(header);
			}
		}
		
		//body 출력
        List<Map<String, Object>> list  = (List<Map<String, Object>>)model.get("datas");
        // Map 대신 Object로 받아서 따로 변환시켜줘도된다
        if(headers != null) {
        	for (Map<String, Object> map : list) {
        		row = sheet.createRow(rowNum++);
        		 int colNum = 0;
        		 for (String header : headers) {
        			cell = row.createCell(colNum++);
 					Object field = map.get(header);
 					if(field == null) {
 						field = "";
 					}
 					
 					if (field instanceof String) {
 						cell.setCellValue((String) field);
 					} else if (field instanceof BigDecimal) {
 						cell.setCellValue(((BigDecimal) field).doubleValue());
 					} else if (field instanceof Date) {
 						cell.setCellValue((Date) field);
 					} else {
 						cell.setCellValue(field.toString());
 					}
 					
        		 }
        	}
        } else {
	        for (Map<String, Object> map : list) {
	            row = sheet.createRow(rowNum++);
	            int colNum = 0;
	            Iterator<String> iter = map.keySet().iterator();
				while(iter.hasNext()) {
					cell = row.createCell(colNum++);
					Object field = map.get(iter.next());
					if (field instanceof String) {
						cell.setCellValue((String) field);
					} else if (field instanceof BigDecimal) {
						cell.setCellValue(((BigDecimal) field).doubleValue());
					} else if (field instanceof Date) {
						cell.setCellValue((Date) field);
					} else if(field!=null) {
						cell.setCellValue(field.toString());
					} else {
						cell.setCellValue("");
					}
					
				} 
	        }
        }

		LOGGER.debug("### buildExcelDocument Map : {} end!!");	
	}


	public static Map<String, Object> convertVOtoMap(Object obj) throws IllegalArgumentException, IllegalAccessException {
	      if(obj == null ) {
	         return Collections.emptyMap();
	      }
	      Map<String, Object> convertMap = new HashMap<String, Object>();
	      Field[] fields = obj.getClass().getDeclaredFields();
	      for(Field field : fields) {
	         field.setAccessible(true);
	         convertMap.put(field.getName(), field.get(obj));
	      }
	      return convertMap;
	   }

	public static List<Map<String,Object>> convertVOtoMaps(List<?> list) throws IllegalArgumentException, IllegalAccessException{
	      if (list == null || list.isEmpty()) {
	         return Collections.emptyList();
	      }
	      List<Map<String, Object>> convertList = new ArrayList<Map<String,Object>>();
	      for(Object obj : list) {
	         convertList.add(CommonExcelView.convertVOtoMap(obj));
	      }
	      return convertList;
	   }

}
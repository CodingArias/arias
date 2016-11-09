package com.kedu.arias.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploader {
	private static FileUploader instance = null;
	private FileUploader(){
		
	}
	
	public static FileUploader getInstance(){
		if(instance==null)
			instance=new FileUploader();
		return instance;
	}
	
	public String[] fileUpload(String attach_path, String imageName, MultipartHttpServletRequest multi){

		String root_path = multi.getSession().getServletContext().getRealPath("/");
		String uploadPath = root_path + attach_path;
		List<MultipartFile> files = multi.getFiles(imageName);
		String []result = new String[files.size()];

		
		for(int i=0;i<files.size();i++){

			String fileName = fileRename(files.get(i).getOriginalFilename());
			result[i]=fileName;
			new File(uploadPath).mkdirs();
		    File f = new File(uploadPath+fileName);
		    try {
		    	files.get(i).transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public String fileRename(String fileName){
		String reNameFile = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
		String getFileName[] = fileName.split("\\.");

		reNameFile = "arias_"+getFileName[0] + "_" + sdf.format(c.getTime()) + "." + getFileName[1];
        return reNameFile;
	}


}

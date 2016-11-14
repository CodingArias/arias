package com.kedu.arias.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	
	public List<String> fileUpload(String attach_path, String imageName, MultipartHttpServletRequest multi){

		String root_path = multi.getSession().getServletContext().getRealPath("/");
		String uploadPath = root_path + attach_path;
		List<MultipartFile> files = multi.getFiles(imageName);
		List<String> file_names =null;

		if(files.size()>0){
			file_names = new ArrayList<>();
			for(int i=0;i<files.size();i++){
				if(files.get(i).getSize()>0){
					String fileName = fileRename(files.get(i).getOriginalFilename());
					file_names.add(fileName);
					new File(uploadPath).mkdirs();
					System.out.println(uploadPath+fileName);
				    File f = new File(uploadPath+fileName);
				    try {
				    	files.get(i).transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		return file_names;
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

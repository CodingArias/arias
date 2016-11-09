package com.kedu.arias.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
	
	public boolean fileUpload(String uploadPath, String imageName, MultipartHttpServletRequest multi){
		boolean result = false;
		List<MultipartFile> files = multi.getFiles(imageName);
		
		for(int i=0;i<files.size();i++){
			System.out.println("저장 파일 이름 : "+files.get(i).getOriginalFilename());
			new File(uploadPath).mkdirs();
		    File f = new File(uploadPath+files.get(i).getOriginalFilename());
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



}

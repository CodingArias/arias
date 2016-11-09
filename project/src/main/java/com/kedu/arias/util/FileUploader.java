package com.kedu.arias.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	private static FileUploader instance = null;
	private FileUploader(){
		
	}
	
	public static FileUploader getInstance(){
		if(instance==null)
			instance=new FileUploader();
		return instance;
	}
	
	public boolean fileSave(String savePath, List<MultipartFile> files){
		boolean result = false;
		
		for(int i=0;i<files.size();i++){
			new File(savePath).mkdirs();
		    File f = new File(savePath+files.get(i).getOriginalFilename());
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

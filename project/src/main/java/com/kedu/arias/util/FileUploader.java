package com.kedu.arias.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
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
	
	
	// 숙영 : Thumbnail 생성하기
	public static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg	= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	public static String calcPath(String uploadPath) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}
	
	
	private static void makeDir(String uploadPath, String...paths) throws Exception {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	
	
	public static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}

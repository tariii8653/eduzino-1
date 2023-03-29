package com.edu.zino.util;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.edu.zino.exception.FileUploadException;

@Component
public class FileManager {

	//주문번호 생성시 필요한 메서드
	public String getRealTime() {
		return Long.toString(System.currentTimeMillis());
	}

	public String getFileName(String filename) {
		long time = System.currentTimeMillis();
		String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
		return time+"."+ext;
	}
	
	public String fileUpload(MultipartFile file,String path) throws FileUploadException{
		String filename = file.getOriginalFilename();
		filename = getFileName(filename);
		try {
			file.transferTo(new File(path+"/"+filename));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new FileUploadException("이미지 업로드 실패",e);
		}
		return filename;
	}
	
	public void deleteFile(String filename,String path) {
		File file = new File(path+"/"+filename);
		file.delete();
	}
	
}

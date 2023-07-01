package com.kosa.scheduleManagement.global.utils;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kosa.scheduleManagement.global.aws.S3Util;
import com.kosa.scheduleManagement.global.aws.UploadFileUtils;

@Service
public class S3Service {

	S3Util s3 = new S3Util();

	String bucketName = "skglim";
	
	public String fileToS3(MultipartFile file) {
		//프로필 이미지의 추가경로
		String uploadpath = "skglim/profileImage";

		String img_path="";
		try {
			img_path = UploadFileUtils.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 

		System.out.println(img_path);

		return img_path; 
	}
}
package com.kosa.scheduleManagement.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.utils.S3Service;
import com.kosa.scheduleManagement.mypage.service.mypageService;

@RestController
@RequestMapping("/mypage")
public class mypageAajxController {
	// 로거사용
	private static final Logger logger = LoggerFactory.getLogger(mypageAajxController.class);

	private mypageService mypageservice;

	// S3 서비스
	private S3Service s3service;

	@Autowired
	public void setMypageservice(mypageService mypageservice) {
		this.mypageservice = mypageservice;
	}

	@Autowired
	public void setS3Service(S3Service s3service) {
		this.s3service = s3service;
	}

	@PostMapping("/update.do")
	@ResponseBody
	public ResponseEntity<String> mypageUpdate(@RequestPart(value = "key") Emp emp,@RequestPart(value = "file", required=false) MultipartFile file) {
		System.out.println("controller");
		System.out.println(file);
		System.out.println(emp);
		logger.info("originalName: " + file.getOriginalFilename());
		if (file.isEmpty()) {
			return new ResponseEntity<String>("파일이 유효하지 않습니다", HttpStatus.BAD_REQUEST);
		}	
		
		try {
			String S3Path = s3service.fileToS3(file);
			emp.setEmp_pic(S3Path);
			System.out.println("S3Path" + S3Path);
			mypageservice.updateEmpInfo(emp);
			return new ResponseEntity<String>("insert sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		}
	}
}

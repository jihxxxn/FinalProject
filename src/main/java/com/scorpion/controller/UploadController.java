package com.scorpion.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scorpion.domain.PictureDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/upload/*")
@Log4j
public class UploadController {
	//첨부 파일 삭제
		@PreAuthorize("isAnonymous()")
		@PostMapping("/deleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName, String type){
			try {
				File file = new File("c:\\leaderPicture\\" + //원래 파일명으로 디코딩
								     URLDecoder.decode(fileName, "UTF-8"));
				file.delete();	//파일 삭제
				
				if(type.equals("image")) {	//이미지의 경우 원본 이미지 삭제
					//원본 파일명으로 변환
					String largeFileName = file.getAbsolutePath().replace("s_", "");
					file = new File(largeFileName);
					file.delete();	//원본 이미지 삭제
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		//업로드 시점의 연/월/일 폴더 경로 문자열 생성
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			
			return str.replace("-", File.separator);
		}
		
		//업로드 파일 검사 - 이미지 파일 여부
		private boolean checkImageType(File file) {
			try {
				String contenType = Files.probeContentType(file.toPath());
				
				//이미지 파일이면 true 반환
				return contenType.startsWith("image");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		
		//섬네일 이미지 데이터 전송
		@PreAuthorize("isAnonymous()")
		@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			File file = new File("c:\\leaderPicture\\" + fileName);
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", 
						   Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(
							FileCopyUtils.copyToByteArray(file),
							header,
							HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
		}

		@PreAuthorize("isAnonymous()")
		@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<PictureDTO>> 
				uploadAjaxPost(MultipartFile[] uploadFile) {
			List<PictureDTO> list = new ArrayList<>();
			log.info("uploadFormAction");
			log.info("getFolder : " + getFolder());
			String uploadFolder = "c:\\leaderPicture";	//업로드 경로
			
			//업로드 경로 = c:\\leaderPicture 폴더 밑에 연\월\일 폴더로 생성
			File uploadPath = new File(uploadFolder, getFolder());
			log.info("uploadPath : " + uploadPath);
			
			//uploadPath가 없으면 폴더 생성
			if(!uploadPath.exists()) {
				uploadPath.mkdirs();	//연\월\일 폴더 한꺼번에 생성
			}
			
			for (MultipartFile m : uploadFile) {
				
				log.info("-------------------------");
				log.info("upload file name : " + m.getOriginalFilename());
				log.info("upload file size : " + m.getSize());
				
				String uploadFileName = m.getOriginalFilename();
				PictureDTO pictureDTO = new PictureDTO();
				pictureDTO.setFileName(uploadFileName);	//1.업로드 파일명 저장
				
				//IE의 경우 경로를 제거하고 파일명만 저장 
				uploadFileName 
					= uploadFileName.substring(
							uploadFileName.lastIndexOf("\\") + 1);
				
				//UUID 이용 파일명 중복 방지 처리
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				
				File saveFile 
					= new File(uploadPath, uploadFileName);
				
				try {
					m.transferTo(saveFile);	//파일 업로드 
					pictureDTO.setUuid(uuid.toString());	 //2.UUID 값 저장
					pictureDTO.setUploadPath(getFolder());//3.업로드 경로 저장
					
					//이미지 파일이면 섬네일 이미지 파일 생성 
					if(checkImageType(saveFile)) {
						pictureDTO.setImage(true);  		 //4.이미지 여부 저장
						//섬네일 이미지 파일명 = s_ + 업로드파일명
						FileOutputStream thumbnail
							= new FileOutputStream(
								  new File(uploadPath, "s_" + uploadFileName)
							  );	
						
						//가로 100 * 세로 100 섬네일 이미지 생성
						Thumbnailator.createThumbnail(
							m.getInputStream(), thumbnail, 200, 200
						);
						thumbnail.close();
					}//END 섬네일 이미지 생성
					list.add(pictureDTO);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}//END 업로드 
			return new ResponseEntity<>(list, HttpStatus.OK);
		}//END uploadAjaxPost

		@GetMapping("/uploadAjax")	//AJAX 방식 업로드 화면 이동
		public void uploadAjax() {
			log.info("upload ajax");
		}
		
		@PostMapping("/uploadFormAction")	//업로드 처리
		public void uploadFormPost(MultipartFile[] uploadFile,
								   Model model) {
			log.info("uploadFormAction");
			
			String uploadFolder = "c:\\upload";	//업로드 경로

			for (MultipartFile m : uploadFile) {
				log.info("-------------------------");
				log.info("upload file name : " + m.getOriginalFilename());
				log.info("upload file size : " + m.getSize());
				
				File saveFile 
					= new File(uploadFolder, m.getOriginalFilename());
				
				try {
					m.transferTo(saveFile);	//파일 업로드 
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		@GetMapping("/uploadForm")	//업로드 화면 이동
		public void uploadForm() {
			log.info("upload form");
		}
}

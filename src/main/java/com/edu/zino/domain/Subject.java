package com.edu.zino.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Subject {
	private int subject_idx;
	private String subject_title;//제목
	private String subject_subTitle;//부제목
	private String subject_pic;//강의 이미지 경로
	private int subject_price;//가격
	private int subject_access;//공개유무 0:비공개(강사,관리자에게만 보임), 1:공개(모두에게보임),2:삭제요청(관리자에게만보임) 
	private String subject_detail;//강의 설명
	private int subject_permission;//0미승인,1승인
	private Teacher teacher;//강사
	private SubCategory sub_category;//소분류
	
	//regist에서 업로드할 MultiPartFile
	private MultipartFile subject_file;
	
	//학습목표 등록시 사용자가 동적으로 등록하는 학습목표 및 요구사항
	private List<Goal> goals;
	private List<Requirement> requirements;
	
	private List<Section> sectionList;
	
}

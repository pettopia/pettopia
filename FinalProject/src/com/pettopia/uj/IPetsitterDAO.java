package com.pettopia.uj;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPetsitterDAO
{
	// 펫시터 프로필 뷰 확인
	// public PetsitterDTO search(String sid);
	public String searchPsRegCode(String code);		// 세션 회원고유코드로 펫시터코드 조회
	
	public String search0(HashMap<Object, String> paramMap); // 회원고유코드 기준 프로필코드 확인
	
	public PetsitterDTO search1(HashMap<Object, String> paramMap); // 개인정보
	
	public ArrayList<PetsitterDTO> list1(HashMap<Object, String> paramMap); // 희망 견종크기 리스트
	
	public ArrayList<PetsitterDTO> list2(HashMap<Object, String> paramMap); // 돌봄비용 리스트
	public ArrayList<PetsitterDTO> list3(HashMap<Object, String> paramMap); // 돌봄서비스 리스트
	
	public PetsitterDTO search2(HashMap<Object, String> paramMap); // 자기소개 내용 
	
	public ArrayList<PetsitterDTO> list4(HashMap<Object, String> paramMap); // 돌봄환경(이용서비스)리스트
	public ArrayList<PetsitterDTO> list5(HashMap<Object, String> paramMap); // 돌봄환경 이미지 업로드 리스트
	
	public ArrayList<PetsitterDTO> list6(HashMap<Object, String> paramMap); // 펫시터 리뷰 
	
	public ArrayList<PetsitterDTO> list7(HashMap<Object, String> paramMap); // 펫시터에 맡길 회원 반려동물 리스트

	public void addcarereq(HashMap<Object, String> paramMap);	// 돌봄신청
	
	public void promiseagree(HashMap<Object, String> paramMap);	// 약관동의

	public PetsitterDTO promise(HashMap<Object, String> paramMap);

	public ArrayList<PetsitterDTO> bank(HashMap<Object, String> paramMap);	// 은행 관련 뷰
	
	public PetsitterDTO list9(HashMap<Object, String> paramMap);	// 프로필 공개 여부

	public ArrayList<PetsitterDTO> selectbank();

	public PetsitterDTO psaccount(HashMap<Object, String> paramMap);

	// 펫시터 프로필 수정용 뷰
	public PetsitterDTO updateView(HashMap<Object, String> paramMap);
	
}

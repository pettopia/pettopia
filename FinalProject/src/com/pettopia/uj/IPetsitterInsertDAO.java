package com.pettopia.uj;

import java.util.HashMap;

public interface IPetsitterInsertDAO
{
	public int add(PetsitterInsertDTO insertdto); 			// 펫시터 신청 -> PS_REQ 테이블에 추가
	//public int add(String pacareer, String code); 		// 펫시터 신청 -> PS_REQ 테이블에 추가
	public String search0(PetsitterInsertDTO insertdto);	// PS_REQ 테이블에 추가 후 생성된 SEQ 반환
	public int add0(PetsitterInsertDTO insertdto);			// 펫시터 신청 -> PS_DOCUMENT 테이블에 추가 
	public int add1(PetsitterInsertDTO insertdto);			// 약관 항목 동의
	
	public String search1(PetsitterInsertDTO insertdto);	// 회원고유코드로 펫시터코드 조회
	public int add4(PetsitterInsertDTO insertdto);			// 펫시터 프로필 INSERT
	
	public String search2(PetsitterInsertDTO insertdto);	// 회원고유코드로 펫시터 프로필 코드 조회
	
	public int add2(HashMap<Object, String> paramMap);			// 이용서비스 INSERT
	//public ArrayList<PetsitterInsertDTO> add2();
	
	public int add3(PetsitterInsertDTO insertdto);			// 돌봄 환경 이미지 등록 INSERT
	
	public int add5(HashMap<Object, String> paramMap);		// 펫시터 이용 요금 
}

package com.pettopia.uj;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPetsitterUpdateDAO
{

	// 로그인한 회원고유코드로 펫시터 프로필코드 얻기
	public String searchCode(String code);
	
	// 펫시터 기본 정보 업데이트
	public int psprofileupdate(PetsitterUpdateDTO petsitterUpdatedto);
	
	// 이용서비스 삭제
	public int removeservice(String pet_profile_seq);
	
	// 이용서비스 데이터 입력(수정했을 경우)
	public int serviceinsert(HashMap<Object, String> paramMap);
	
	// 돌봄이용 요금 삭제
	public int removecarepay(String pet_profile_seqs);
	
	// 돌봄이용 요금 재 입력(수정했을 경우)
	public int carepayinsert(HashMap<Object, String> paramMap);
	
	
	// 펫시터 견종 크기 및 돌봄비용 조회
	public HashMap<String, Object> selpscarepay(HashMap<String, Object> paramMap);

	// 펫시터 견종 크기 및 돌봄비용 업데이트
	public void uppscarepay(HashMap<String, Object> paramMap2);

	public Object ps_profile_seq(HashMap<Object, String> paramMap);

	



	
	

}

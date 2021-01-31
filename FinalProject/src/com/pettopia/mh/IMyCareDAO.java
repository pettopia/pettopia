/*===================
  IStudentDAO.java
 ===================*/

package com.pettopia.mh;

import java.util.ArrayList;

public interface IMyCareDAO
{
	//돌봄신청 리스트
	public ArrayList<MyCareDTO> carelist(String id);
	
	//돌봄환불신청 리스트
	public ArrayList<MyCareDTO> reflist(String id);
	
	//리뷰작성 팝업에 불러올 내용
	public PsReviewDTO psreviewlist(String care_req_seq);
	
	//돌봄신청코드로 돌봄코드 찾기
	public String findcareagreeseq(String care_req_seq);
	
	//리뷰insert
	public int addpsreview(PsReviewDTO dto);
	
	//예치금insert
	public int adddeposit(DepositDTO dto);
	
	//예치금 팝업에 불러올 내용
	public DepositDTO depositlist(String care_req_seq);
	
	//은행리스트
	public ArrayList<BankDTO> banklist(); 
	
	//내가 쓴 돌봄 리뷰 리스트
	public ArrayList<MyCareReviewDTO> mycarereview(String member_code_seq);

	
	//나의 돌봄 리뷰 리스트(펫시터)
	public ArrayList<MyCareReviewDTO> mypsreview(String member_code_seq);

	
	//돌봄신청 리스트(펫시터마이페이지)
	public ArrayList<MyCareDTO> pscarelist(String member_code_seq);
	
	
	//돌봄신청 승인/거절하기 팝업에 들어갈 예약정보
	public MyCareDTO carereqinf(String care_req_seq);
		
	//돌봄신청 승인하기
	public int addagree(String care_req_seq);
			
	//돌봄신청 거절하기
	public int addrefuse(String care_req_seq);
			
	
	
	//펫시터 총평점 계산
	public String calavg(String member_code_seq);
}

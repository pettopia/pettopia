/*================================
 	IpetProfileDTO.java
 	- 인터페이스 
==================================*/
package com.pettopia.jw;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IPetProfileDAO
{
	
	// 펫 프로필 조회
	public PetProfileDTO select(String petId);
	
	// 펫 체중 조회
	public String weight(String petId);
	
	// 펫 공유중인 회원 조회
	public ArrayList<String> petConnect(String petId);
	
	// 한 회원이 생성한 펫 조회
	public ArrayList<String> petSelect(String code);
	
	// 한 회원이 공유 받고 있는 펫 조회
	public ArrayList<String> petShare(String code);
	
	// 펫의 다이어리 내역 조회
	public ArrayList<PetDiarySelectDTO> petdiaryselect(String petId);
	
	// 펫의 다이어리 상세 내역 조회
	public PetDiarySelectDTO selectdetail(String diaryId);
	
	// 곧 있을 일정의 다이어리 내역 조회
	public ArrayList<PetDiarySelectDTO> sooncomediarylist(String code);
	
	// 펫 다이어리 작성
	public int petdiaryinsert(PetDiarySelectDTO diaryinsertdto);
	
	// 다이어리 대분류 조회
	public ArrayList<String> diarylarname();
	
	// 다이어리 중분류 조회
	public ArrayList<PetDiarySelectDTO> diarymidname(String s);
	
	// 펫연결코드 조회
	public String petconcode(PetDiaryInsertDTO BKdto);
	
	// 다이어리 등록
	public int adddiary(PetDiaryInsertDTO insertdto);
	
	// 다이어리 삭제
	public int removediary(String diaryId);
	
	// 다이어리 수정
	public int modifydiary(PetDiaryInsertDTO insertdto);
	
	// 견종 조회
	public ArrayList<String> breed();
	
	// 견종 크기 조회
	public ArrayList<String> petsize();
	
	// 펫 체중 조회
	public ArrayList<PetProfileDTO> petweight(String petId);
	
	// 펫 체중 등록
	public int addpetweight(PetDiaryInsertDTO insertdto);
	
	// 펫 등록
	public int addpet(PetprofileInsertDTO petprofileInsertdto);
	
	// 펫 프로필 수정
	public int petmodify(PetprofileInsertDTO petprofileInsertdto);
	
	// 펫 삭제
	public int petdelete(String petId);
	
	// 펫 공유 신청(공유신청테이블에 데이터 추가)
	public int addpetshare(PetshareDTO petsharedto);
	
	// 회원 고유 코드 값 조회
	public String membercodeselect(String memberNick);
	
	// 펫 공유 신청 후 펫공유신청코드 조회 (알람 전송)
	public String searchPetConReqCode(PetshareDTO dto);
	
	// 펫 연결 등록 (펫 공유 신청 수락)
	public int petConReg(String pet_con_req_seq);
	
	// 펫 프로필 이미지 등록
	public int imageupload(PetprofileInsertDTO petprofileInsertdto);
}

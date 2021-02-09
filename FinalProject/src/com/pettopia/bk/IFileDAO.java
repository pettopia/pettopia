package com.pettopia.bk;

public interface IFileDAO
{
	// 회원등록코드 조회 쿼리문
	public String memberRegSeq(FileDTO file);
	// 등록된 회원 프로필 이미지 수 조회 쿼리문
	public String profileImgCount(FileDTO file);
	// 회원 프로필 이미지 조회 쿼리문
	public FileDTO profileImgSearch(FileDTO file);
	// 회원 프로필 이미지 등록 쿼리문
	public int profileImgInsert(FileDTO file);
	// 회원 프로필 이미지 수정 쿼리문
	public int profileImgUpdate(FileDTO file);
	// 회원 프로필 이미지 삭제 쿼리문
	public int profileImgDelete(FileDTO file);
	
	// 등록된 펫 프로필 이미지 수 조회 쿼리문
	public String petProfileImgCount(FileDTO file);
	// 펫 프로필 이미지 조회 쿼리문
	public FileDTO petProfileImgSearch(FileDTO file);
	// 펫 프로필 이미지 등록 쿼리문
	public int petProfileImgInsert(FileDTO file);
	// 펫 프로필 이미지 수정 쿼리문
	public int petProfileImgUpdate(FileDTO file);
	// 펫 프로필 이미지 삭제 쿼리문
	public int petProfileImgDelete(FileDTO file);
}

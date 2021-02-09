package com.pettopia.bk;

public interface IFileDAO
{
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

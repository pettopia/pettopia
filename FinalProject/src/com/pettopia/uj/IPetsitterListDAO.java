package com.pettopia.uj;

import java.util.ArrayList;
import java.util.HashMap;

import com.pettopia.hj.WalkListDTO;
import com.pettopia.jw.PetDiaryInsertDTO;

public interface IPetsitterListDAO
{
	
	// 펫시터 리스트
	public ArrayList<PetsitterListDTO> petsitterlist();


	public ArrayList<PetsitterListDTO> profile();		// 펫시터 리스트 정보
	
	public PetsitterDTO psprofileview(String seq);	// 펫시터 프로필 뿌리기


	public ArrayList<HashMap<String, Object>> profilelistsearch(HashMap<String, Object> paramMap); // 펫시터 리스트 검색




}

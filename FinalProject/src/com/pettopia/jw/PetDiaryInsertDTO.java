package com.pettopia.jw;

public class PetDiaryInsertDTO
{
	
	private String diaryId , pet_con_reg_seq , diary_mid_id ;
	//			   스케줄코드	펫연결코드	    일지중분류 코드
	
	private String writedate, startdate, enddate, title, content, place;
	//		       작성일	  일정시작일 종료일   제목	  내용    장소
	private String code,petId, petconcode , petWeight; 
	//		   회원코드,펫코드,펫연결코드 
	// getter / setter 구성
	public String getDiaryId()
	{
		return diaryId;
	}
	public void setDiaryId(String diaryId)
	{
		this.diaryId = diaryId;
	}
	public String getPet_con_reg_seq()
	{
		return pet_con_reg_seq;
	}
	public void setPet_con_reg_seq(String pet_con_reg_seq)
	{
		this.pet_con_reg_seq = pet_con_reg_seq;
	}
	public String getDiary_mid_id()
	{
		return diary_mid_id;
	}
	public void setDiary_mid_id(String diary_mid_id)
	{
		this.diary_mid_id = diary_mid_id;
	}
	public String getWritedate()
	{
		return writedate;
	}
	public void setWritedate(String writedate)
	{
		this.writedate = writedate;
	}
	public String getStartdate()
	{
		return startdate;
	}
	public void setStartdate(String startdate)
	{
		this.startdate = startdate;
	}
	public String getEnddate()
	{
		return enddate;
	}
	public void setEnddate(String enddate)
	{
		this.enddate = enddate;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getPlace()
	{
		return place;
	}
	public void setPlace(String place)
	{
		this.place = place;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getPetId()
	{
		return petId;
	}
	public void setPetId(String petId)
	{
		this.petId = petId;
	}
	public String getPetconcode()
	{
		return petconcode;
	}
	public void setPetconcode(String petconcode)
	{
		this.petconcode = petconcode;
	}
	public String getPetWeight()
	{
		return petWeight;
	}
	public void setPetWeight(String petWeight)
	{
		this.petWeight = petWeight;
	}
	
	
}
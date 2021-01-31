/*============================
 	PetProfileDTO.java
==============================*/
package com.pettopia.jw;

public class PetProfileDTO
{
	private String petName, petGender; 
	private String breed,breedId,sizeName,sizeId;
	private String birth,neutral,petRegNum,petId;
	
	private String petWeight;
	private String memberNick;
	
	private String diaryTitle;
	private int rowNum;
	private String larName,midName,writeDay;
	private String code;
	private String membercode;
	private String petconcode; // 펫 연결코드
	private String p_open; // 공개여부
	
	// getter / setter 구성
	
	
	public String getCode()
	{
		return code;
	}
	
	public String getP_open()
	{
		return p_open;
	}

	public void setP_open(String p_open)
	{
		this.p_open = p_open;
	}

	public String getSizeName()
	{
		return sizeName;
	}

	public void setSizeName(String sizeName)
	{
		this.sizeName = sizeName;
	}

	public String getSizeId()
	{
		return sizeId;
	}
	public void setSizeId(String sizeId)
	{
		this.sizeId = sizeId;
	}
	public String getBreedId()
	{
		return breedId;
	}
	public void setBreedId(String breedId)
	{
		this.breedId = breedId;
	}
	public String getPetconcode()
	{
		return petconcode;
	}
	public void setPetconcode(String petconcode)
	{
		this.petconcode = petconcode;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getMembercode()
	{
		return membercode;
	}
	public void setMembercode(String membercode)
	{
		this.membercode = membercode;
	}
	public String getMemberId()
	{
		return code;
	}
	public void code(String code)
	{
		this.code = code;
	}
	public String getPetRegNum()
	{
		return petRegNum;
	}
	public void setPetRegNum(String petRegNum)
	{
		this.petRegNum = petRegNum;
	}
	public String getMemberNick()
	{
		return memberNick;
	}
	public void setMemberNick(String memberNick)
	{
		this.memberNick = memberNick;
	}
	public String getDiaryTitle()
	{
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle)
	{
		this.diaryTitle = diaryTitle;
	}
	public int getRowNum()
	{
		return rowNum;
	}
	public void setRowNum(int rowNum)
	{
		this.rowNum = rowNum;
	}
	public String getLarName()
	{
		return larName;
	}
	public void setLarName(String larName)
	{
		this.larName = larName;
	}
	public String getMidName()
	{
		return midName;
	}
	public void setMidName(String midName)
	{
		this.midName = midName;
	}
	public String getWriteDay()
	{
		return writeDay;
	}
	public void setWriteDay(String writeDay)
	{
		this.writeDay = writeDay;
	}
	//getter / setter 구성
	public String getPetId()
	{
		return petId;
	}
	public void setPetId(String petId)
	{
		this.petId = petId;
	}
	public String getPetName()
	{
		return petName;
	}
	public void setPetName(String petName)
	{
		this.petName = petName;
	}
	public String getPetGender()
	{
		return petGender;
	}
	public void setPetGender(String petGender)
	{
		this.petGender = petGender;
	}
	public String getBreed()
	{
		return breed;
	}
	public void setBreed(String breed)
	{
		this.breed = breed;
	}
	public String getBirth()
	{
		return birth;
	}
	public void setBirth(String birth)
	{
		this.birth = birth;
	}
	public String getNeutral()
	{
		return neutral;
	}
	public void setNeutral(String neutral)
	{
		this.neutral = neutral;
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

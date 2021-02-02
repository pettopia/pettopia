package com.pettopia.jw;

public class PetprofileInsertDTO
{
	private String breedId,breedName;
	private String sizeId,sizeName;
	private String petId,code,petName,petGender,petBirth
				   ,petNum,neutral,writeDay,imageUpload,imageUploadDay;
	
	// getter / setter 구성	
	public String getBreedId()
	{
		return breedId;
	}
	public String getImageUploadDay()
	{
		return imageUploadDay;
	}
	public void setImageUploadDay(String imageUploadDay)
	{
		this.imageUploadDay = imageUploadDay;
	}
	public void setBreedId(String breedId)
	{
		this.breedId = breedId;
	}
	public String getBreedName()
	{
		return breedName;
	}
	public void setBreedName(String breedName)
	{
		this.breedName = breedName;
	}
	public String getSizeId()
	{
		return sizeId;
	}
	public void setSizeId(String sizeId)
	{
		this.sizeId = sizeId;
	}
	public String getSizeName()
	{
		return sizeName;
	}
	public void setSizeName(String sizeName)
	{
		this.sizeName = sizeName;
	}
	public String getPetId()
	{
		return petId;
	}
	public void setPetId(String petId)
	{
		this.petId = petId;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
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
	public String getPetBirth()
	{
		return petBirth;
	}
	public void setPetBirth(String petBirth)
	{
		this.petBirth = petBirth;
	}
	public String getPetNum()
	{
		return petNum;
	}
	public void setPetNum(String petNum)
	{
		this.petNum = petNum;
	}
	public String getNeutral()
	{
		return neutral;
	}
	public void setNeutral(String neutral)
	{
		this.neutral = neutral;
	}
	public String getWriteDay()
	{
		return writeDay;
	}
	public void setWriteDay(String writeDay)
	{
		this.writeDay = writeDay;
	}
	public String getImageUpload()
	{
		return imageUpload;
	}
	public void setImageUpload(String imageUpload)
	{
		this.imageUpload = imageUpload;
	}
	
}

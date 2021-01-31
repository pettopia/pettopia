package com.pettopia.jw;

public class PetshareDTO
{
	String petshareId , membercode , petId;
	String memberNick;

	
	
	public String getMemberNick()
	{
		return memberNick;
	}

	public void setMemberNick(String memberNick)
	{
		this.memberNick = memberNick;
	}

	public String getPetshareId()
	{
		return petshareId;
	}

	public void setPetshareId(String petshareId)
	{
		this.petshareId = petshareId;
	}

	public String getMembercode()
	{
		return membercode;
	}

	public void setMembercode(String membercode)
	{
		this.membercode = membercode;
	}

	public String getPetId()
	{
		return petId;
	}

	public void setPetId(String petId)
	{
		this.petId = petId;
	}
	
}

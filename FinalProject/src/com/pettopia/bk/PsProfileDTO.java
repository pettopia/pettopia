package com.pettopia.bk;

public class PsProfileDTO
{
	private String profile_code, reqcode, care, ps_addr, open_type;
	//-- 펫시터프로필코드, 펫시터신청코드, 돌봄형태, 펫시터주소, 공개여부
	private String content, bank, depositor, account_num, writedate;  
	//-- 내용, 은행, 예금주, 계좌번호, 작성일
	public String getProfile_code()
	{
		return profile_code;
	}
	public void setProfile_code(String profile_code)
	{
		this.profile_code = profile_code;
	}
	public String getReqcode()
	{
		return reqcode;
	}
	public void setReqcode(String reqcode)
	{
		this.reqcode = reqcode;
	}
	public String getCare()
	{
		return care;
	}
	public void setCare(String care)
	{
		this.care = care;
	}
	public String getPs_addr()
	{
		return ps_addr;
	}
	public void setPs_addr(String ps_addr)
	{
		this.ps_addr = ps_addr;
	}
	public String getOpen_type()
	{
		return open_type;
	}
	public void setOpen_type(String open_type)
	{
		this.open_type = open_type;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getBank()
	{
		return bank;
	}
	public void setBank(String bank)
	{
		this.bank = bank;
	}
	public String getDepositor()
	{
		return depositor;
	}
	public void setDepositor(String depositor)
	{
		this.depositor = depositor;
	}
	public String getAccount_num()
	{
		return account_num;
	}
	public void setAccount_num(String account_num)
	{
		this.account_num = account_num;
	}
	public String getWritedate()
	{
		return writedate;
	}
	public void setWritedate(String writedate)
	{
		this.writedate = writedate;
	}
	
}

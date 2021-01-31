package com.pettopia.bk;

public class FileDTO
{
	private String reqcode, doc_type;
	// 펫시터신청코드, 서류구분, 파일경로
	private String profile_code;
	//-- 펫시터프로필코드
	private String filepath, filename, regdate;
	//-- 파일경로, 파일이름, 등록일
	private String code;
	//-- 회원신고접수코드 등 코드 담는 용도
	
	// getter / setter 
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getReqcode()
	{
		return reqcode;
	}
	public void setReqcode(String reqcode)
	{
		this.reqcode = reqcode;
	}
	public String getDoc_type()
	{
		return doc_type;
	}
	public void setDoc_type(String doc_type)
	{
		this.doc_type = doc_type;
	}
	public String getProfile_code()
	{
		return profile_code;
	}
	public void setProfile_code(String profile_code)
	{
		this.profile_code = profile_code;
	}
	public String getFilepath()
	{
		return filepath;
	}
	public void setFilepath(String filepath)
	{
		this.filepath = filepath;
	}
	public String getFilename()
	{
		return filename;
	}
	public void setFilename(String filename)
	{
		this.filename = filename;
	}
	public String getRegdate()
	{
		return regdate;
	}
	public void setRegdate(String regdate)
	{
		this.regdate = regdate;
	}
}

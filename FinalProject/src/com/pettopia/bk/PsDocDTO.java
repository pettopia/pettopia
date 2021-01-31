package com.pettopia.bk;

public class PsDocDTO
{
	private String reqcode, doc_type, filepath;
	// 펫시터신청코드, 서류구분, 파일경로

	// getter / setter
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

	public String getFilepath()
	{
		return filepath;
	}

	public void setFilepath(String filepath)
	{
		this.filepath = filepath;
	}
	
}

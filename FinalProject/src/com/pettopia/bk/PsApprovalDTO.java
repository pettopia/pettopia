package com.pettopia.bk;

// 펫시터 신청 처리 관련하여 사용
public class PsApprovalDTO
{
	private String ps_code, mg_code, reqcode;
	private String ref_reason_code, content;
	//-- 펫시터 등록 : 펫시터코드, 관리자코드, 펫시터신청코드, 등록일자
	//-- 펫시터 반려 : 펫시터신청코드, 사유코드, 처리일시, 사유상세내용, 관리자코드
	
	// getter / setter
	public String getPs_code()
	{
		return ps_code;
	}
	public void setPs_code(String ps_code)
	{
		this.ps_code = ps_code;
	}
	public String getMg_code()
	{
		return mg_code;
	}
	public void setMg_code(String mg_code)
	{
		this.mg_code = mg_code;
	}
	public String getReqcode()
	{
		return reqcode;
	}
	public void setReqcode(String reqcode)
	{
		this.reqcode = reqcode;
	}
	public String getRef_reason_code()
	{
		return ref_reason_code;
	}
	public void setRef_reason_code(String ref_reason_code)
	{
		this.ref_reason_code = ref_reason_code;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	
}

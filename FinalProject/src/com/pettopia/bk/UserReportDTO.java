package com.pettopia.bk;

public class UserReportDTO
{
	private String code, defendantid, nick, reason, content;
	//-- 회원신고접수코드, 신고받은ID, 닉네임, 신고사유, 신고내용 
	private String declarantid, report_date, state;
	//-- 신고한ID, 신고일, 신고처리상태
	private String reg_date, reg_mg, ref_date, ref_mg, mgcontent;
	//-- 신고처리일, 신고처리담당, 신고제재불가처리일, 제재불가담당, 담당내용
	private String restrict_reason_code, restrict_reason_content, mg_code;
	//-- 제재불가사유코드, 처리관리자코드
	
	// getter / setter
	public String getCode()
	{
		return code;
	}
	public String getRestrict_reason_content()
	{
		return restrict_reason_content;
	}
	public void setRestrict_reason_content(String restrict_reason_content)
	{
		this.restrict_reason_content = restrict_reason_content;
	}
	public String getMg_code()
	{
		return mg_code;
	}
	public void setMg_code(String mg_code)
	{
		this.mg_code = mg_code;
	}
	public String getRestrict_reason_code()
	{
		return restrict_reason_code;
	}
	public void setRestrict_reason_code(String restrict_reason_code)
	{
		this.restrict_reason_code = restrict_reason_code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getDefendantid()
	{
		return defendantid;
	}
	public void setDefendantid(String defendantid)
	{
		this.defendantid = defendantid;
	}
	public String getNick()
	{
		return nick;
	}
	public void setNick(String nick)
	{
		this.nick = nick;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason = reason;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getDeclarantid()
	{
		return declarantid;
	}
	public void setDeclarantid(String declarantid)
	{
		this.declarantid = declarantid;
	}
	public String getReport_date()
	{
		return report_date;
	}
	public void setReport_date(String report_date)
	{
		this.report_date = report_date;
	}
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getReg_mg()
	{
		return reg_mg;
	}
	public void setReg_mg(String reg_mg)
	{
		this.reg_mg = reg_mg;
	}
	public String getRef_date()
	{
		return ref_date;
	}
	public void setRef_date(String ref_date)
	{
		this.ref_date = ref_date;
	}
	public String getRef_mg()
	{
		return ref_mg;
	}
	public void setRef_mg(String ref_mg)
	{
		this.ref_mg = ref_mg;
	}
	public String getMgcontent()
	{
		return mgcontent;
	}
	public void setMgcontent(String mgcontent)
	{
		this.mgcontent = mgcontent;
	}
	
}

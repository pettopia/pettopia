package com.pettopia.bk;

public class MemberReportRegDTO
{
	private String num, code, defendantId, reason, declarantId, report_date, state;
	//-- 번호, 회원신고접수코드, 피고ID(신고당한), 신고사유, 원고(신고한), 신고일, 처리상태
	private String reg_date, reg_mg, ref_date, ref_mg;
	//-- 제재처리일, 제재처리담당, 반려처리일, 반려처리담당
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getDefendantId()
	{
		return defendantId;
	}
	public void setDefendantId(String defendantId)
	{
		this.defendantId = defendantId;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason = reason;
	}
	public String getDeclarantId()
	{
		return declarantId;
	}
	public void setDeclarantId(String declarantId)
	{
		this.declarantId = declarantId;
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
	
}

package com.pettopia.bk;

public class PetsitterRegDTO
{
	private String num, reqcode, code, id, nick, age, sex, reqdate, state, content;
	//-- 행번호, 펫시터신청코드, 회원고유코드, 아이디, 닉네임, 나이, 성별, 신청일, 처리상태, 경력소개
	private String approval_date, approval_mg, disapproval_date, disapproval_mg;
	//-- 승인일, 승인담당, 거절일, 거절담당
	private String regcode;
	//-- 펫시터코드
	private String ref_reason_code, ref_reason, pscontent;
	//-- 거절 사유코드, 거절사유, 담당자 답변내용
	
	// getter / setter
	public String getRef_reason_code()
	{
		return ref_reason_code;
	}

	public void setRef_reason_code(String ref_reason_code)
	{
		this.ref_reason_code = ref_reason_code;
	}

	public String getRef_reason()
	{
		return ref_reason;
	}

	public void setRef_reason(String ref_reason)
	{
		this.ref_reason = ref_reason;
	}

	public String getPscontent()
	{
		return pscontent;
	}

	public void setPscontent(String pscontent)
	{
		this.pscontent = pscontent;
	}
	
	public String getRegcode()
	{
		return regcode;
	}

	public void setRegcode(String regcode)
	{
		this.regcode = regcode;
	}
	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public String getReqcode()
	{
		return reqcode;
	}

	public void setReqcode(String reqcode)
	{
		this.reqcode = reqcode;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getNick()
	{
		return nick;
	}

	public void setNick(String nick)
	{
		this.nick = nick;
	}

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getSex()
	{
		return sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	public String getReqdate()
	{
		return reqdate;
	}

	public void setReqdate(String reqdate)
	{
		this.reqdate = reqdate;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getApproval_date()
	{
		return approval_date;
	}

	public void setApproval_date(String approval_date)
	{
		this.approval_date = approval_date;
	}

	public String getApproval_mg()
	{
		return approval_mg;
	}

	public void setApproval_mg(String approval_mg)
	{
		this.approval_mg = approval_mg;
	}

	public String getDisapproval_date()
	{
		return disapproval_date;
	}

	public void setDisapproval_date(String disapproval_date)
	{
		this.disapproval_date = disapproval_date;
	}

	public String getDisapproval_mg()
	{
		return disapproval_mg;
	}

	public void setDisapproval_mg(String disapproval_mg)
	{
		this.disapproval_mg = disapproval_mg;
	}
	
	
}

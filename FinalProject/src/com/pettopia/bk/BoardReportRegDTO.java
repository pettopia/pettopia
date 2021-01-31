package com.pettopia.bk;

public class BoardReportRegDTO
{
	private String num, code, board_code, id, nick, reason_code, reason;
	//-- 번호, 게시물신고접수코드, 게시물코드, 작성자id, 작성자닉네임, 신고사유코드, 신고사유
	private String declarantId, report_date, state, content;
	//--신고자ID, 신고일, 처리상태, 신고내용
	private String blind_date, blind_mg, ref_date, ref_mg, mgcontent;
	//-- 블라인드처리일, 블라인드처리담당, 반려처리일, 반려처리담당, 담당내용
	private String restrict_reason_code, restrict_reason_content, mg_code;
	//-- 제재불가사유코드, 제재불가내용, 처리관리자코드
	
	// getter / setter
	public String getNum()
	{
		return num;
	}
	public String getReason_code()
	{
		return reason_code;
	}
	public void setReason_code(String reason_code)
	{
		this.reason_code = reason_code;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
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
	public String getMgcontent()
	{
		return mgcontent;
	}
	public void setMgcontent(String mgcontent)
	{
		this.mgcontent = mgcontent;
	}
	public String getRestrict_reason_code()
	{
		return restrict_reason_code;
	}
	public void setRestrict_reason_code(String restrict_reason_code)
	{
		this.restrict_reason_code = restrict_reason_code;
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
	public String getBoard_code()
	{
		return board_code;
	}
	public void setBoard_code(String board_code)
	{
		this.board_code = board_code;
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
	public String getBlind_date()
	{
		return blind_date;
	}
	public void setBlind_date(String blind_date)
	{
		this.blind_date = blind_date;
	}
	public String getBlind_mg()
	{
		return blind_mg;
	}
	public void setBlind_mg(String blind_mg)
	{
		this.blind_mg = blind_mg;
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

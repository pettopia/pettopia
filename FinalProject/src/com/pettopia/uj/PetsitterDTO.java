package com.pettopia.uj;

public class PetsitterDTO
{
	// 주요 속성 구성
	private String sid, nickname, gender, age;		//-- 닉네임, 성별, 나이
	//--펫시터코드 / 견종크기 / 돌봄형태 / 돌봄비용 / 자기소개 / 주소
	private String petsittercode, sizetype, caretype, carepay, pscontent, service, filepath, addr;
	// 우편번호 / 주소1 / 주소2 / 주소3
	private String psaddrnumber, psaddr1, psaddr2, psaddr3;
	private String psscore, reviewdate, reviewcontent; // 펫시터점수, 펫시터리뷰작성일, 펫시터리뷰내용
	private String petname;
	private String ps_service_seq;
	private String ps_open_seq;	// 공개여부
	private String ps_profile_seq;	//-- 펫시터프로필코드
	private String code; //-- 회원 고유코드

	// 은행명 , 예금주명, 계좌번호
	private String bankname, psaccountname, psaccountnumber ,bank_seq;
	
	private String ps_care_pay_seq, pet_size_seq, pet_con_reg_seq, startdate, enddate; // -- 펫시터 신청

	private String promise_seq, agree, seq, content;	//-- 약관 동의
	
	private String caretype_seq, sizename;
	
	
	
	// getter / setter 구성
	
	
	
	



	public String getSizename()
	{
		return sizename;
	}



	public void setSizename(String sizename)
	{
		this.sizename = sizename;
	}



	public String getCaretype_seq()
	{
		return caretype_seq;
	}



	public void setCaretype_seq(String caretype_seq)
	{
		this.caretype_seq = caretype_seq;
	}



	public String getPsaddrnumber()
	{
		return psaddrnumber;
	}

	

	public String getBank_seq()
	{
		return bank_seq;
	}



	public void setBank_seq(String bank_seq)
	{
		this.bank_seq = bank_seq;
	}



	public String getPs_service_seq()
	{
		return ps_service_seq;
	}



	public void setPs_service_seq(String ps_service_seq)
	{
		this.ps_service_seq = ps_service_seq;
	}



	public String getBankname()
	{
		return bankname;
	}

	public void setBankname(String bankname)
	{
		this.bankname = bankname;
	}

	public String getPsaccountname()
	{
		return psaccountname;
	}

	public void setPsaccountname(String psaccountname)
	{
		this.psaccountname = psaccountname;
	}

	public String getPsaccountnumber()
	{
		return psaccountnumber;
	}

	public void setPsaccountnumber(String psaccountnumber)
	{
		this.psaccountnumber = psaccountnumber;
	}

	public String getPet_size_seq()
	{
		return pet_size_seq;
	}

	public void setPet_size_seq(String pet_size_seq)
	{
		this.pet_size_seq = pet_size_seq;
	}

	public void setPsaddrnumber(String psaddrnumber)
	{
		this.psaddrnumber = psaddrnumber;
	}

	public String getPsaddr1()
	{
		return psaddr1;
	}

	public void setPsaddr1(String psaddr1)
	{
		this.psaddr1 = psaddr1;
	}

	public String getPsaddr2()
	{
		return psaddr2;
	}

	public void setPsaddr2(String psaddr2)
	{
		this.psaddr2 = psaddr2;
	}

	public String getPsaddr3()
	{
		return psaddr3;
	}

	public void setPsaddr3(String psaddr3)
	{
		this.psaddr3 = psaddr3;
	}

	public String getPs_open_seq()
	{
		return ps_open_seq;
	}

	public void setPs_open_seq(String ps_open_seq)
	{
		this.ps_open_seq = ps_open_seq;
	}

	public String getSeq()
	{
		return seq;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public void setSeq(String seq)
	{
		this.seq = seq;
	}

	public String getPromise_seq()
	{
		return promise_seq;
	}

	public void setPromise_seq(String promise_seq)
	{
		this.promise_seq = promise_seq;
	}

	public String getAgree()
	{
		return agree;
	}

	public void setAgree(String agree)
	{
		this.agree = agree;
	}

	public String getPs_care_pay_seq()
	{
		return ps_care_pay_seq;
	}

	public void setPs_care_pay_seq(String ps_care_pay_seq)
	{
		this.ps_care_pay_seq = ps_care_pay_seq;
	}

	public String getPet_con_reg_seq()
	{
		return pet_con_reg_seq;
	}

	public void setPet_con_reg_seq(String pet_con_reg_seq)
	{
		this.pet_con_reg_seq = pet_con_reg_seq;
	}

	public String getStartdate()
	{
		return startdate;
	}

	public void setStartdate(String startdate)
	{
		this.startdate = startdate;
	}

	public String getEnddate()
	{
		return enddate;
	}

	public void setEnddate(String enddate)
	{
		this.enddate = enddate;
	}

	public String getPetname()
	{
		return petname;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public void setPetname(String petname)
	{
		this.petname = petname;
	}

	public String getPs_profile_seq()
	{
		return ps_profile_seq;
	}

	public void setPs_profile_seq(String ps_profile_seq)
	{
		this.ps_profile_seq = ps_profile_seq;
	}
	public String getPsscore()
	{
		return psscore;
	}

	public void setPsscore(String psscore)
	{
		this.psscore = psscore;
	}

	public String getReviewdate()
	{
		return reviewdate;
	}

	public void setReviewdate(String reviewdate)
	{
		this.reviewdate = reviewdate;
	}

	public String getReviewcontent()
	{
		return reviewcontent;
	}

	public void setReviewcontent(String reviewcontent)
	{
		this.reviewcontent = reviewcontent;
	}

	public String getFilepath()
	{
		return filepath;
	}

	public void setFilepath(String filepath)
	{
		this.filepath = filepath;
	}

	public String getService()
	{
		return service;
	}

	public void setService(String service)
	{
		this.service = service;
	}

	public String getNickname()
	{
		return nickname;
	}

	public String getPetsittercode()
	{
		return petsittercode;
	}

	public void setPetsittercode(String petsittercode)
	{
		this.petsittercode = petsittercode;
	}

	public String getSizetype()
	{
		return sizetype;
	}

	public void setSizetype(String sizetype)
	{
		this.sizetype = sizetype;
	}

	public String getCaretype()
	{
		return caretype;
	}

	public void setCaretype(String caretype)
	{
		this.caretype = caretype;
	}

	public String getCarepay()
	{
		return carepay;
	}

	public void setCarepay(String carepay)
	{
		this.carepay = carepay;
	}

	public String getPscontent()
	{
		return pscontent;
	}

	public void setPscontent(String pscontent)
	{
		this.pscontent = pscontent;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}

	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
	{
		this.sid = sid;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	
	
	

}


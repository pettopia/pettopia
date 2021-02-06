package com.pettopia.uj;

public class PetsitterUpdateDTO
{
	// 주요 속성 구성
	
	// 회원고유코드 , 펫시터프로필코드
	private String code, ps_profile_seq;	

	// 펫시터 프로필 업데이트 컬럼
	private String ps_care_type_seq, pscontent, psaddrnumber
				 , psaddr1, psaddr2, psaddr3, ps_open_seq, bank_seq
				 , psaccountnumber, psaccountname
				 , ps_care_pay_seq, ps_size_seq
				 , size1, size2, size3
				 , pet_size_seq1, pet_size_seq2, pet_size_seq3;
     
	
	public String getPet_size_seq1()
	{
		return pet_size_seq1;
	}

	public void setPet_size_seq1(String pet_size_seq1)
	{
		this.pet_size_seq1 = pet_size_seq1;
	}

	public String getPet_size_seq2()
	{
		return pet_size_seq2;
	}

	public void setPet_size_seq2(String pet_size_seq2)
	{
		this.pet_size_seq2 = pet_size_seq2;
	}

	public String getPet_size_seq3()
	{
		return pet_size_seq3;
	}

	public void setPet_size_seq3(String pet_size_seq3)
	{
		this.pet_size_seq3 = pet_size_seq3;
	}

	public String getSize1()
	{
		return size1;
	}

	public void setSize1(String size1)
	{
		this.size1 = size1;
	}

	public String getSize2()
	{
		return size2;
	}

	public void setSize2(String size2)
	{
		this.size2 = size2;
	}

	public String getSize3()
	{
		return size3;
	}

	public void setSize3(String size3)
	{
		this.size3 = size3;
	}

	public String getPs_care_pay_seq()
	{
		return ps_care_pay_seq;
	}

	public void setPs_care_pay_seq(String ps_care_pay_seq)
	{
		this.ps_care_pay_seq = ps_care_pay_seq;
	}

	public String getPs_size_seq()
	{
		return ps_size_seq;
	}

	public void setPs_size_seq(String ps_size_seq)
	{
		this.ps_size_seq = ps_size_seq;
	}

	// 펫크기코드 , 돌봄비용
	private String pet_size_seq, carepay;
	
	// 이용 서비스
	private String ps_service_seq;

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getPs_profile_seq()
	{
		return ps_profile_seq;
	}

	public void setPs_profile_seq(String ps_profile_seq)
	{
		this.ps_profile_seq = ps_profile_seq;
	}

	public String getPs_care_type_seq()
	{
		return ps_care_type_seq;
	}

	public void setPs_care_type_seq(String ps_care_type_seq)
	{
		this.ps_care_type_seq = ps_care_type_seq;
	}

	public String getPscontent()
	{
		return pscontent;
	}

	public void setPscontent(String pscontent)
	{
		this.pscontent = pscontent;
	}

	public String getPsaddrnumber()
	{
		return psaddrnumber;
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

	public String getBank_seq()
	{
		return bank_seq;
	}

	public void setBank_seq(String bank_seq)
	{
		this.bank_seq = bank_seq;
	}

	public String getPsaccountnumber()
	{
		return psaccountnumber;
	}

	public void setPsaccountnumber(String psaccountnumber)
	{
		this.psaccountnumber = psaccountnumber;
	}

	public String getPsaccountname()
	{
		return psaccountname;
	}

	public void setPsaccountname(String psaccountname)
	{
		this.psaccountname = psaccountname;
	}

	public String getPet_size_seq()
	{
		return pet_size_seq;
	}

	public void setPet_size_seq(String pet_size_seq)
	{
		this.pet_size_seq = pet_size_seq;
	}

	public String getCarepay()
	{
		return carepay;
	}

	public void setCarepay(String carepay)
	{
		this.carepay = carepay;
	}

	public String getPs_service_seq()
	{
		return ps_service_seq;
	}

	public void setPs_service_seq(String ps_service_seq)
	{
		this.ps_service_seq = ps_service_seq;
	}	
}

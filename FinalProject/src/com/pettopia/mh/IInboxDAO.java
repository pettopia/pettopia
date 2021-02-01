/*===================
  IStudentDAO.java
 ===================*/

package com.pettopia.mh;

import java.util.ArrayList;

public interface IInboxDAO
{
	//받은쪽지함 목록 리스트
	public ArrayList<InboxDTO> receivelist(String member_code_seq);
	
	//보낸쪽지함 목록 리스트
	public ArrayList<InboxDTO> sendlist(String member_code_seq);
	
	//받은쪽지갯수
	public int inboxcount(String member_code_seq);
	
	//보낸쪽지갯수
	public int sendcount(String member_code_seq);
}

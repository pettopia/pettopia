/*===================
	INotifyDAO.java
	- 인터페이스
===================*/

package com.pettopia.bk;

import java.util.ArrayList;

public interface INotifyDAO
{
	// 새 알람 조회
	public ArrayList<NotifyDTO> newNotifyList(String code);
	
	// 읽은 알람 읽은날짜 변경
	public int notifyUpdate(NotifyDTO notify);
	
	// 새 알람 갯수 조회
	public int newNotifyCount(String code);
}

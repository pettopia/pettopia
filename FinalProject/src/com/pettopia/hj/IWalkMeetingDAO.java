/*
 * IWalkMeetingDAO.java
 * */

package com.pettopia.hj;


public interface IWalkMeetingDAO
{
	//산책모임게시물 정보 확인
	public WalkMeetingDTO list(String walk_meeting_seq);
	
	//이전글 다음글 확인
	public String before(String walk_meeting_seq);
	public WalkMeetingDTO beforelist(String walk_meeting_seq);
	public String next(String walk_meeting_seq);
	public WalkMeetingDTO nextlist(String walk_meeting_seq);
	
	//조회수 증가처리
	public int views(String walk_meeting_seq);
	
	
}

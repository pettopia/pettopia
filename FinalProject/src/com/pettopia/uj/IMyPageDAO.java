/*===================
  IStudentDAO.java
 ===================*/

package com.pettopia.uj;


public interface IMyPageDAO
{
	public String searchCode(String id);
	public MyPageDTO list(String id);
	
	public String login(LoginDTO dto);
}

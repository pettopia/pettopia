/*================================
 	ISampleDAO.java
 	- 인터페이스 
==================================*/
package com.pettopia.jw;

public interface ILoginDAO
{
	public String login(LoginDTO dto);
	
	public String searchCode(String id);
}

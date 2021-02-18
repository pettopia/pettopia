/*====================
	FileManager.java
====================*/

package com.pettopia.bk;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

public class FileManager
{
	// 파일 다운로드
	// saveFileName : 서버에 저장된 파일 이름
	// originalFileName : 클라이언트가 업로드한 파일 이름
	// path : 서버에 저장된 경로
	public static boolean doFileDownload(String saveFileName, String originalFileName, String path, HttpServletResponse response)
	{
		// 경로 설정
		String load_dir = path + File.separator + saveFileName;
		
		// 확인
		System.out.println(load_dir);
		
		try
		{
			// 클라이언트가 전달한 파일 이름이 null 이거나 비어있으면 저장된 이름으로 사용
			if (originalFileName == null || originalFileName.equals(""))
			{
				originalFileName = saveFileName;
			}
			// 쪼개고 합치고
			originalFileName = new String(originalFileName.getBytes("EUC-KR"), "8859_1" );
			
		} catch (UnsupportedEncodingException e)	// 인코딩방식 지원하지 않을 때 예외 발생
		{
			System.out.println(e.toString());
		}
		
		try
		{
			File file = new File(load_dir);
			
			if(file.exists())
			{
				byte[] readByte = new byte[4096];	// 2의 12승
				
				// 기존 서버에서 사용되는 컨텐트 타입 받아쓰기?
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition", "attachment;filename=" + originalFileName);
				
				BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
				
				// 클라이언트가 받을 수 있도록
				OutputStream os = response.getOutputStream();
				
				int read;
				while ((read = fis.read(readByte, 0, 4096)) != -1)
				{
					os.write(readByte, 0, read);
				}
				
				os.flush();	// 버퍼 구성되어있으니 flush 로 밀어줌
				os.close();	// 리소스 반납
				fis.close();
				
				return true;
				
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return false;
		
	}
	
	
	
	// 실제 파일 삭제(제거)
	public static void doFileDelete(String fullFileName)
	{
		try
		{			
			// 파일 이름 찾아서 지우기
			File file = new File(fullFileName);
			if (file.exists())
				file.delete();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

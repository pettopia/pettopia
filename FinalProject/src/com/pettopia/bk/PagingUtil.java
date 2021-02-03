/*========================
    PagingUtil.java
    - 게시글 페이징 처리
    
	getPageCount(페이지당 보여줄 게시글 수, 전체 데이터 수)
	- 총 페이지 수 구하는 메소드
	
	getIndexList(현재페이지번호, 총페이지수, 전처리된페이징url)
	- 페이징 처리 기능 메소드
	
	* 사용한 예제 : com.pettopia.bk.BoardController.java
 ========================*/

package com.pettopia.bk;

public class PagingUtil
{
   // ■ 전체 페이지 수를 구하는 메소드
   // numPerPage : 한 페이지에 표시할 데이터(게시물) 수, totalData : 전체 데이터(게시물) 수
   public int getPageCount(int numPerPage, int totalData)
   {
      int totalPage = 0;	// 전체 페이지 수
      
      totalPage = totalData / numPerPage;	// 만약 전체 데이터가 32개라면 3
      
      if (totalData % numPerPage != 0)	// 32개 중 나머지 2개에 대한 페이지
         totalPage++;
      
      return totalPage;
   }
   
   // ■ 페이징 처리 기능의 메소드
   // currentPage : 현재 표시할 페이지, totalPage : 총 페이지 수, listUrl : 페이징 URL(? 또는 &로 전처리 된 상태)
   public String getIndexList(int currentPage, int totalPage, String listUrl)
   {
      // 페이징 처리가 필요하지 않은 경우에는 페이징 처리를 할 필요가 없다.
	  // (데이터가 존재하지 않거나, 데이터 수가 1페이지도 못 채우는 경우)
      if (currentPage == 0)
         return "";
		 
      // 실제 페이징을 저장할 변수
      StringBuffer strList = new StringBuffer();
      
      int numPerBlock = 10;		//-- 페이징 처리 시 게시물 하단에 보여줄 페이징 갯수(10개씩)
      
      int currentPageSetup;		// currentPageSetup = 표시할 첫 페이지 -1
	  // ex) 하단 페이징list가  1  2  3 ... 10 인 경우 currentPageSetup = 0
	  // ex) 하단 페이징list가 21 22 23 ... 30 인 경우 currentPageSetup = 20
	  
      int page;		// 페이지 변수
      int n;		//-- prev, next 로 이동했을 경우 이전 페이지 블럭과 같은 순번의 위치로 이동하기 위한 변수
					//   ex) 페이지 16에서 다음 next 클릭 시 이동하고 26으로 보통가는데, 그 값을 말함
      
      // 페이지 요청을 처리하는 과정에서 URL 경로의 패턴에 대한 처리
      if (listUrl.indexOf("?") != -1)   // 링크를 설정할 URL 에 ? 가 있는 경우...
         listUrl = listUrl + "&";
      else                     // 링크를 설정할 URL 에 ? 가 없는 경우...
         listUrl = listUrl + "?";
      //-- 검색하여 페이지를 요청한 경우 이미 request 값에
      //   search_type 값과 search_text 값이 들어있는 상황이므로 & 를 붙여서 추가해 주어야 한다.
      
      // currentPageSetup = 표시할 첫 페이지 -1
	  // ex) 하단 페이징list가  1  2  3 ... 10 인 경우 currentPageSetup = 0
	  // ex) 하단 페이징list가 11 12 13 ... 20 인 경우 currentPageSetup = 10
	  
      currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
      //-- 만약 현재 페이지가 5페이지이고, 게시물 하단에 보여줄 페이지 갯수가 10이면
      //   (5/10)*10 = 0 이다. 이대 currentPageSetup 은 0.
      //   하지만, 현재 페이지가 21페이지면
      //   (21/10)*10 = 20 이다. 이때 currentPageSetup 은 20.
      
      /*
       :      
       20         ...
       10   *11  12  13  14  15  16  17  18  19   20
       0      1   2   3   4   5   6   7   8   9   10
       ↑
       currentPageSetup
      */
	  
      if (currentPage % numPerBlock == 0)	// 현재 페이지가 10의 배수라면 setup 조정
         currentPageSetup = currentPageSetup - numPerBlock;
      //-- 현재 페이지가 20페이지였다면 (20/10)*10 = 20 (setup)
      //   10개씩 출력할 때 20 페이지의 setup 은 10 이여야하므로 - numPerBlock 해서 조정해준다.
            
     
	  //=================================================== 여기서부터 페이징 list 처리
	  
      // 1페이지로 가기 버튼 url (맨 앞으로 가기)
      if ( (totalPage > numPerBlock) && (currentPageSetup > 0))		// 총 페이지 수가 10 페이지를 초과하고 현재 페이지가 11 페이지 이상일 때 의미있는 버튼
         strList.append(" <a href='" + listUrl + "pageNum=1'><img src=\"/FinalProject/img/all_prev.png\"></a>");
      //-- listUrl은 전처리한 url 을 받아온다고 가정 (? 또는 & 가 붙은 상태)
      
	  
      // Prev 버튼 url(페이징 블럭 10단위 전으로 이동)
      n = currentPage - numPerBlock;	// 블럭단위로 같은 순번째 페이지 ex) 현재 16페이지라면 n = 6
      if ( (totalPage > numPerBlock) && (currentPageSetup > 0))		// 총 페이지 수가 10 페이지를 초과하고 현재 페이지가 11 페이지 이상일 때 의미있는 버튼
         strList.append(" <a href='" + listUrl + "pageNum=" + n + "'><img src=\"/FinalProject/img/prev.png\"></a>");
      //-- currentPageSetup > 0 == 이미 페이지가 10을 초과하고 현재 페이지(currentPage)가 11 페이지 이상이다.
      //-- 『Prev』를 클릭할 경우 n 변수 페이지로 이동.
	  //   ex) 22 페이지에서 Prev 클릭할 경우 12 페이지로 이동
      
      
      // 페이지 바로가기 버튼들(페이지 숫자)
      page = currentPageSetup + 1;
      //--  +1 을 하는 이유 : currentPageSetup 는 0, 10, 20, ... 이기 때문에 
      //    실제 그려주어야 하는 바로가기 페이지는 +1 부터 시작해야 하기 때문이다.
      //    20을 가져왔다면 21부터, 30을 가져왔다면 31부터 처리하는 방식
      
      while ( (page <= totalPage) && (page <= currentPageSetup + numPerBlock) )
      {
         if (page==currentPage)		// 현재 페이지 강조효과 + 링크 없음
            strList.append(" <a class=\"active\">" + page + "</a>");
         else
            strList.append(" <a href='" + listUrl + "pageNum=" + page + "'>" + page + "</a>");
         
         page++;
      }
      
      
      // Next 버튼 url(페이징 블럭 10단위 후로 이동)
      n = currentPage + numPerBlock;	// 블럭단위로 같은 순번째 페이지 ex) 현재 16페이지라면 n = 26
      if ( (totalPage - currentPageSetup) > numPerBlock )		// (총페이지수-현재setup) > 페이징단위블럭. 현재 페이징 블럭 다음이 있을 때 의미있음.
         strList.append(" <a href='" + listUrl + "pageNum=" + n + "'><img src=\"/FinalProject/img/next.png\"></a>");
   
   
      // 마지막 페이지로 가기 버튼 url (맨 뒤으로 가기)
	  // (총페이지수가 페이징블럭단위)보다 크고 (현재페이지setup+페이징단위블럭)이 총 페이지수보다 작아야 맨 뒤로가기 버튼에 의미있음
      if ( (totalPage > numPerBlock) && (currentPageSetup + numPerBlock) < totalPage )
         strList.append(" <a href='" + listUrl + "pageNum=" + totalPage + "'><img src=\"/FinalProject/img/all_next.png\"></a>");
      
      
      // 저장된 페이징을 문자열의 형태로 반환
      return strList.toString();
      
   }// end getIndexList()
   
}
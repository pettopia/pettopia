

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>walkmeetingroom.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
#list
{
	float:right;
	margin-left:10px;
	font-size:20px;
}
#wrapper
{
	width:1150px;
	margin: 0 auto;
   
   margin-top: 182px;
   margin-bottom: 30px;
}
#title
{
	font-size: 50px;
}
#article_info
{
	float:right;
	font-size:20px;
}
#content
{
	font-size:25px;
}

#content
{
	margin-top:20px;
	margin-bottom:20px;
}
.bo_v_nb
{
	margin-top:10px;
	margin-bottom:10px;
	font-size:30px;
}

#bo_v_top
{
	margin-top:10px;
	margin-bottom:10px;
}
</style>
</head>
<body>

<!-- 헤더 -->
<div>
      <c:import url="header.jsp"></c:import>
</div>

<!-- 콘텐츠 시작  -->
<div id="wrapper">
    <div id="container_wr">
    <div id="container">


<!-- 게시물 읽기 시작 { -->

<article id="article" style="width:100%">
    	<!-- 게시물 제목 -->
    	
        <h1 id="title">
            인천 계양구 산책모임가요~
        </h1>
   

    <section id="article_info">
<!--   <h2>페이지 정보</h2> -->
         <span class="sound_only">작성자</span>
      <strong> 박해진123 </strong>&nbsp;
        <span class="sound_only">댓글</span>
        <strong><a href="#bo_vc"> <i class="fa fa-commenting-o" aria-hidden="true"></i> 1건</a></strong>&nbsp;
        <span class="sound_only">조회</span><strong><i class="fa fa-eye" aria-hidden="true"></i> 745회</strong>&nbsp;
        <strong class="if_date"><span class="sound_only">작성일</span><i class="fa fa-clock-o" aria-hidden="true"></i> 20-12-02 18:55</strong>
    </section>
	
    <section id="article_content">
		<br><br>
		<hr>
        <!-- 본문 내용 시작 { -->
        <div id="content">
	        
	        <table id="tbl" style="border-collapse:collapse; float:right;">
			<tr >  
				<th style="width:80px;">망치엄마 : </th>
				<td style="width: 450px;">
				안녕하세요~~~~~~~~
				</td>
				<td>
				오전 7:59
				</td> 
				<td bgcolor="FFC0CB" align="center">
				- 현재참여회원 -
				</td>
			</tr>
			<tr>
				<th>망치엄마 : </th>
				<td>
				아무도 없나요??
				</td>
				<td>
				오전 8:00
				</td>
				<td bgcolor="FFC0CB" align="center">
				망치엄마
				</td>
			</tr>
			<tr>
				<th>토르맘 : </th>
				<td>
				저있어용ㅎㅎ
				</td>
				<td>
				오후 12:24
				</td>
				<td bgcolor="FFC0CB" align="center">
				토르맘
				</td>
			</tr>
			<tr>
				<th> </th>
				<td align="center">
				 - 꿀비가죠아 님이 참여하셨습니다. -</td>
				<td>
				</td>
				<td bgcolor="FFC0CB"; align="center">
				꿀비가죠아
				</td>
				
			</tr>
		
			<tr>
				<th></th>
				<td rowspan="7">
				</td>
				<td>
				</td>
				<td bgcolor="FFC0CB"; align="center">
				박해진123 *방개설자
				</td>
			</tr>
		
			<tr>
				<th>&nbsp; </th>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		
			<tr>
				<th>&nbsp; </th>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		
			<tr>
				<th> &nbsp;</th>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>&nbsp; </th>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>&nbsp; </th>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>&nbsp; </th>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>&nbsp; </th>
				<td>
				</td>
				<td>
				</td>
			</tr>
			
			<tr bgcolor="FFC0CB">
				<th>채팅입력 : </th>
				<td>
				ㅇㅅㅇ하위~
				</td>
				<td></td> 
			</tr>

		
			
		</table>
		<h2> [모임 정보] </h2>
	           <strong>함께할 댕댕이</strong> : 강정강정 <br>
	           <strong>모임 인원 수</strong> : 2인<br>
	           <strong>모임 목적</strong> : 산책<br>
	           <strong>날짜</strong> : 2020-12-29<br>
	           <strong>산책 시간</strong> : 17시 30분<br>
	           <strong>지역</strong> : 계양구 계산동<br>
	           <strong>위치</strong> : 오조산공원<br>
	           <img src="images/map.png" width="200" height="200"
	                  alt="map" id="map">
	                  <br>
	           <strong>주인 성별</strong> : 동성만(여)<br>
	           
	           <br>
	        인천 계양구 산책가실분 구합니다~!><♥♥♥
         </div>
                 
        
                <!-- } 본문 내용 끝 -->
              
        <ul class="bo_v_com">
           <li id="list"><a href="" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 댓글쓰기</a></li>
           <li id="list"><a href="" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 목록으로</a></li>
           <li id="list"><a href="" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 참여취소</a></li>
        </ul>
        <br><br>

    </section>


    
    
    
    <!-- 게시물 상단 버튼 시작 { -->
    <div id="bo_v_top">
        
        <ul class="bo_v_left">
                                            </ul>

        <ul class="bo_v_com">
          
        </ul>
			<hr>
            <ul class="bo_v_nb">
	            <li class="btn_prv">
	            
	            	<span class="nb_tit">
	            		<i class="fa fa-caret-up" aria-hidden="true"></i> 이전글&nbsp;&nbsp;&nbsp;
	            	</span><a href="./board.php?bo_table=word&amp;wr_id=447"><strong>대전 은행동 산책가실분!</strong></a> 
	            	
	            </li>            
	            <li class="btn_next">
	            	<span class="nb_tit">
	            		<i class="fa fa-caret-down" aria-hidden="true"></i> 다음글&nbsp;&nbsp;&nbsp;
	            	</span><a href="./board.php?bo_table=word&amp;wr_id=441"><strong>꿀비가 심심해하네요 ㅜㅠ</strong></a>  
	            
	            </li>  
	                  
            </ul>
            <hr>
    </div>
    <!-- } 게시물 상단 버튼 끝 -->


<button type="button" class="cmt_btn"><i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록</button><br>
<!-- 댓글 시작 { -->
<section id="bo_vc">
    <h1>댓글목록</h1>
    
    <article id="c_446" >
        <header style="z-index:2">
            <h2>관리자님의  댓글</h2>
            <span class="member">정의진</span>                        <span class="sound_only">작성일</span>
            <span class="bo_vc_hdinfo"><i class="fa fa-clock-o" aria-hidden="true"></i> <time datetime="2020-12-03T12:08:00+09:00">20-12-03 12:08</time></span>
                    </header>

        <!-- 댓글 출력 -->
        <div class="cmt_contents">
            <p> 저 가고시퍼요~~~~~~~토르도 가고싶대요~~</p>
                    </div>
        <span id="edit_446" class="bo_vc_w"></span><!-- 수정 -->
        <span id="reply_446" class="bo_vc_w"></span><!-- 답변 -->

        <input type="hidden" value="" id="secret_comment_446">
        <input type="hidden" value="관리자" id="save_comment_name_446">
      <input type="hidden" value="2020-12-03 12:08:28" id="save_comment_date_446">
      <textarea id="save_comment_446" style="display:none">저 가고싶어요~~
</textarea>
      

    </article>
        
</section>
<!-- } 댓글 끝 -->

<!-- } 댓글 쓰기 끝 --><script src="https://www.ehnh.co.kr/main/js/md5.js"></script>


</article>
<!-- } 게시판 읽기 끝 -->



<!-- } 게시글 읽기 끝 --></div>
</div>
<!-- } 콘텐츠 끝 -->
</div>
   

<!-- 하단 시작 { -->
<div>
      <c:import url="footer.jsp"></c:import>
  </div>

<!-- } 하단 끝 -->
























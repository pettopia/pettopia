<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String code = (String) session.getAttribute("code");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>walkmeeting.jsp</title>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
        function popup(){
            var url = "walkuserprofile.action?walk_meeting_seq=${list.walk_meeting_seq}";
            var name = "popup test";
            var option = "width = 800, height = 800, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }

   
      
      
      
        function popup2(){
            var url = "walkselectpet.action?code=<%=code %>&walk_meeting_seq=${list.walk_meeting_seq}";
            var name = "popup test";
            var option = "width = 800, height = 400, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
    
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
   font-size: 30px;
}
#article_info
{
   float:right;
   font-size:17px;
}
#content
{
   font-size:17px;
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
   font-size:20px;
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
            ${list.walktitle}
        </h1>

    <section id="article_info">
<!--   <h2>페이지 정보</h2> -->
         <span class="sound_only">작성자</span>
      <strong> <a href = "javascript:popup()">${list.nick}</a> </strong>&nbsp;
        <span class="sound_only">조회</span><strong><i class="fa fa-eye" aria-hidden="true"></i> ${list.views} 회</strong>&nbsp;
        <strong class="if_date"><span class="sound_only">작성일</span><i class="fa fa-clock-o" aria-hidden="true"></i> ${list.writedate   }</strong>
    </section>
   
    <section id="article_content">
      <br><br>
      <hr>
        <!-- 본문 내용 시작 { -->
        <div id="content">
        <div>
           <img src="images/map.png" width="450" height="400" 
                     alt="map" id="map" style="float: left; margin-right: 30px;">
        </div>
           <table class="table" style="width: 600px;">
              <tr>
                 <th>모임 인원 수 : </th>
                 <td>
                    ${list.numpeople}
                 </td>
              </tr>
              
              <tr>
                 <th>모임 목적 : </th>
                 <td>
                    ${list.walkaim}
                 </td>
              </tr>
              
              <tr>
                 <th>날짜 : </th>
                 <td>
                    ${list.walkdate}
                 </td>
              </tr>
              
              <tr>
                 <th>산책 시간 : </th>
                 <td>
                    ${list.walkdate }
                 </td>
              </tr>
              
              <tr>
                 <th>지역 : </th>
                 <td>
                    ${list.larname} ${list.midname}
                 </td>
              </tr>
              
              <tr>
                 <th>위치 : </th>
                 <td>
                    ${list.walkplace}
                 </td>
              </tr>
              
              <tr>
                 <th>성별제한옵션 : </th>
                 <td>
                    ${list.genderoption}
                 </td>
              </tr>
              
              <tr>
                 <th>나이제한옵션 : </th>
                 <td>
                    ${list.ageoption}
                 </td>
              </tr>
              
              <%-- <strong>모임 인원 수</strong> : ${list.numpeople}<br>
              <strong>모임 목적</strong> : ${list.walkaim}<br>
              <strong>날짜</strong> : ${list.walkdate}<br>
              <strong>산책 시간</strong> : ${list.walkdate }<br>
              <strong>지역</strong> : ${list.larname} ${list.midname}<br>
              <strong>위치</strong> : ${list.walkplace}<br>
              <!-- <img src="images/map.png" width="200" height="200"
                     alt="map" id="map"> -->
                     <br>
              <strong>성별제한옵션</strong> : ${list.genderoption}<br>
              <strong>나이제한옵션</strong> : ${list.ageoption}<br> --%>
           </table>     
              
           <strong>산책 내용 : ${list.contents}</strong>
         </div>
                 
        
                <!-- } 본문 내용 끝 -->
              
        <ul class="bo_v_com">
           <li id="list"><a href="walklistboard.action" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 목록으로</a></li>
           <li id="list"><a href = "javascript:popup2()"><i class="fa fa-list" aria-hidden="true"></i> 참여하기</a></li>
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
	            
	            <li class="btn_next">
	            	<span class="nb_tit">
	            		<i class="fa fa-caret-up" aria-hidden="true"></i> 다음글&nbsp;&nbsp;&nbsp;
	            	</span><a href="walkmeeting.action?walk_meeting_seq=${nextlist.walk_meeting_seq}"><strong><span class="wtitle">${next }</span></strong></a>  
	            
	            </li>  
	            
	      
	            <li class="btn_prv">
	            
	            	<span class="nb_tit">
	            		<i class="fa fa-caret-down" aria-hidden="true"></i> 이전글&nbsp;&nbsp;&nbsp;
	            	</span><a href="walkmeeting.action?walk_meeting_seq=${beforelist.walk_meeting_seq}"><strong><span class="wtitle">${before }</span></strong></a> 
	            	
	            </li>            
	            
	                  
            </ul>
            <hr>
    </div>
    <!-- } 게시물 상단 버튼 끝 -->


<!-- 댓글 시작 { -->


<!-- } 게시판 읽기 끝 -->


</article>
<!-- } 게시글 읽기 끝 --></div>
</div>
<!-- } 콘텐츠 끝 -->
</div>
   

<!-- 하단 시작 { -->
<div>
      <c:import url="footer.jsp"></c:import>
  </div>

<!-- } 하단 끝 -->
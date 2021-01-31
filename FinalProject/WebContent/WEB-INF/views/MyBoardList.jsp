<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄 신청 내역</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

#wrapper {
	margin: 0 auto;
	width: 1150px;
	margin-top: 160px;
	
}

.main_content .header
{
	margin-bottom: 20px;
}

.my_image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	float: left;
} 
.following_user_form
{
	width:950px;
	height: 200px;
}
#my-inf
{
	width:80%;
	height:500px; 
}
#title
{
	float: left;
    max-width: 400px;
    width:400px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}




</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
   
   
   $(document).ready(function()
   {
      $("#리뷰쓰기").click(function()
       {
           window.open("reviewpopup.action?care_req_seq=","popup test", "width = 500, height = 500, top = 100, left = 200, location = no");
       });
      
      
      $("#state3").click(function()
       {
          $(location).attr('href','state3popup.action');
       });
      
   });
   
   /* 
    function review_popup(){
       
        window.open("write_review.jsp","popup test", "width = 500, height = 500, top = 100, left = 200, location = no");
    } */
    
    
</script>

</head>
<body>


<div id="header">
	<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

	<c:import url="sidemenu.jsp"></c:import>

	<div class="main_content" style="margin-left: 240px; padding-top: 60px;">
   
      <div class="header">
         <span style="font-weight:bold; font-size: 20pt;">내가 쓴 게시물</span>
      </div>

      <div class="comment_list">

         <table class="table">
            <thead>
            <tr>
               <th>
               <input type="checkbox" class="chk" id="chk_all">
               </th>
               <th>제목</th>
               <th>닉네임</th>
               <th>추천수</th>
               <th>날짜</th>
               <!-- 신청 / 펫시터승인 / 신청 확정 / 돌봄중 / 돌봄 완료 / 돌봄 확정 / 돌봄 취소  -->
               <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            
               <c:forEach var="dto" items="${list }">
                  <tr>
                     <td>
                     <input type="checkbox" class="chk" >
                     <!-- 쪽지 선택 체크박스 -->
                     </td>
                     <td style="text-align:left;">&nbsp;<span style="color:red;">[${dto.head}]</span>&nbsp;${dto.title }&nbsp;<span style="font-size:12pt; color:blue;">(${dto.reply })</span></td>
                     <td>${dto.nick }</td>
                     <td>${dto.recom_num}</td>
                     <td>${dto.reg_date }</td>
                     <td>${dto.view_num }</td>
                     
                     
                  </tr>
               </c:forEach>
            
            </tbody>
         </table>
      </div>
      
      
      <div class="paginate">
         <!-- 첫 페이지로 이동 -->
         <a href="javascript:;" class="pre_end_n _ccr(lbp.first)" title="첫 페이지로 이동">처음</a>
         <!-- 이전 페이지로 이동 -->
         <a href="javascript:;" class="pre_n _ccr(lbp.prev)" title="이전 페이지로 이동">이전</a> 
         <strong>1</strong>
         <a href="#" class="_click(nList|movePage|2) _stopDefault">2</a>
         <a href="#" class="_click(nList|movePage|3) _stopDefault">3</a>
         <a href="#" class="_click(nList|movePage|4) _stopDefault">4</a>
         <a href="#" class="_click(nList|movePage|5) _stopDefault">5</a>
         <a href="#" class="_click(nList|movePage|6) _stopDefault">6</a>
         <a href="#" class="_click(nList|movePage|7) _stopDefault">7</a>
         <a href="#" class="_click(nList|movePage|8) _stopDefault">8</a>
         <a href="#" class="_click(nList|movePage|9) _stopDefault">9</a>
         <a href="#" class="_click(nList|movePage|10) _stopDefault">10</a>
         <!-- 다음 페이지로 이동 -->
         <a href="javascript:;" class="next _click" title="다음 페이지로 이동">다음</a>
         <!-- 마지막 페이지로 이동 -->
         <a class="next_end _click" title="마지막 페이지로 이동" href="javascript:;">마지막</a>
      </div>
      
      
   </div>



</div>

<div id="footer"></div>
</body>
</html>
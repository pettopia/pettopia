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
<title>나의 돌봄 리뷰(펫시터)</title>
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
.table1 {
    float: left;
    height: 50px;
    margin-top: 40px;
    margin-left: 30px;
    text-align: center;
}
.table1 th
{
   width:100px;
}

#my-inf
{
   width:80%;
   height:500px; 
}
/* 글자수 길면 줄이기(...) */
#content{
  width        : 400px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
}

</style>



</head>
<body>
   <div id="header">
<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

   <c:import url="sidemenu_ps.jsp"></c:import>

   <div class="main_content" style="margin-left: 240px; padding-top: 60px;">

         <div class="header">
            <i class="fas fa-home" style="font-size: 30px;"></i> <span
               style="font-weight: bold; font-size: 20pt;">펫시터 돌봄내역</span>
         </div>

      <div class="comment_list">

         <table class="table">
            <thead>
            <tr>
               <th></th>
               <th>돌봄일자</th>
               <th>돌봄아이</th>
               <th>신청일</th>
               <th>신청인</th>
               <th>예약상태</th>
               <th> </th>
            </tr>
            </thead>
            <tbody>
            
               <c:forEach var="dto" items="${list }">
                  <tr>
                     <td></td>
                     <td>${dto.caredate}</td>
                     <td>${dto.petname}</td>
                     <td>${dto.reqdate }</td>
                     <td>${dto.nick}</td>
                     <td>${dto.state1 }</td>
                     <td>
                        <div id="state2" ${dto.state2=="환불승인하기" || dto.state2=="승인/거절" ||dto.state2=='일지작성하기' ? "class=\"btn btn-primary\"" : ""}
                         onclick="window.open('statepopup.action?care_req_seq=${dto.care_req_seq }&state=${dto.state2 }', '', 'width=500, height=400, top=100, left=300');"><span class="noselect">${dto.state1=="돌봄거절" ? "" : dto.state2 }</span></div>
                     
                     </td>
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


</body>
</html>
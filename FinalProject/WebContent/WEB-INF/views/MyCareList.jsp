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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
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

</style>



<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
   
   
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
         <span style="font-weight:bold; font-size: 20pt;">돌봄 신청 내역</span>
      </div>

      <div class="comment_list">

         <table class="table">
            <thead>
            <tr>
               <th>
               <input type="checkbox" class="chk" id="chk_all">
               </th>
               <th>펫시터</th>
               <th>돌봄신청일</th>
               <th>돌봄 일자</th>
               <th>예약상태</th>
               <!-- 신청 / 펫시터승인 / 신청 확정 / 돌봄중 / 돌봄 완료 / 돌봄 확정 / 돌봄 취소  -->
               <th>예약정보</th>
               <th>결제내역</th>
            </tr>
            </thead>
            <tbody>
            
               <c:forEach var="dto" items="${list }">
                  <tr>
                     <td>
                     <input type="checkbox" class="chk" >
                     <!-- 쪽지 선택 체크박스 -->
                     </td>
                     <td>${dto.psnick }</td>
                     <td>${dto.reqdate }</td>
                     <td>${dto.caredate}</td>
                     <td>${dto.state1 }</td>
                     <td >
                        <div id="state2" ${dto.state2=="리뷰완료" ? "" : dto.state1=="돌봄거절" ? "" : dto.state2=="예약카드" ? "class=\"btn btn-primary\"" : "class=\"btn btn-success\""}
                         onclick="window.open('statepopup.action?care_req_seq=${dto.care_req_seq }&state=${dto.state2 }', '', 'width=500, height=400, top=100, left=300');"><span class="noselect">${dto.state1=="돌봄거절" ? "" : dto.state2 }</span></div>
                     </td>
                     <td>
                        <div id="state3" ${dto.state3=="승인대기중" ? "" : dto.state1=="돌봄거절" ? "" : dto.state1=="돌봄승인" ? "class=\"btn btn-success\"" : "class=\"btn btn-primary\""}
                         onclick="window.open('statepopup.action?care_req_seq=${dto.care_req_seq }&state=${dto.state3 }', '', 'width=500, height=400, top=100, left=300');"><span class="noselect">${dto.state1=="돌봄거절" ? "" : dto.state3 }</span></div>
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

<div id="footer"></div>
</body>
</html>
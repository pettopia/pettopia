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
<title>Diary.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Diary.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
   
   $(function()
   {
      $(".petSelect").click(
            function()
            {
               /* alert($(this).val()); */

               $(location).attr("href",
                     "petprofilelist.action?petId=" + $(this).val());

            });
      
      $(".petCon").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petdiarydetail.action?diaryId=" + $(this).val());
               
            });
      
      $(".petInsert").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petprofileinsertform.action?code=" + $(this).val());
               
            });
      
      $(".petShare").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petprofileshareform.action?code=" + $(this).val());
               
            });
   });
   
</script>
</head>
<body>
   <!-- 메뉴 구성영역 -->
   <div>
      <c:import url="header.jsp"></c:import>
   </div>


   <div id="Diary" style="margin-top: 152px;">

      <p class="Diary_text">PET DIARY</p>
      <p class="Diary_text_small">나의 반려견을 등록하여 관리하고 공유해보세요!!</p>

      <div class="Diary_select">
         <div class="Diary_information">
            <a href="petdiary.action">Information</a>
         </div>
         <div class="Diary_start">
            <a href="Diary.jsp">Start</a>
         </div>
      </div>
<!-- petdiarydetail.action?diaryId=" + $(this).val()); -->
      <br>
      <br>
      <br>
      <div class="mypet_name">
         <h2 class="tit_name">나의 펫</h2>
         <div class="inner_snb">
         
            <ul class="list_menu">
               <c:forEach var="petSelect" items="${petSelect}">                                 
                        
                     <!--  오픈 넘버가 0인경우(이용자가 펫을 삭제한 경우) -->
                     <c:if test="${petSelect.p_open == 0 }">
                        
                        <span style="display: none;">${petSelect.petName }</span>
                        
                     </c:if>   
                        
                     
                     <c:if test="${petSelect.p_open == 1 }">      
                        <li>      
                        <span>${petSelect.petName }</span>
                        <button type="button" class="btn btn-default btn-xs petSelect"
                               value="${petSelect.petId }" style="float: right; border: 0px; padding-right:20px; ">더 보기</button>
                        </li>
                     </c:if> <%-- ${petSelect.p_open } --%>
                                          
                  
               </c:forEach>
               
               <li>펫 추가하기
                  <button type="button" class="btn btn-default btn-xs petInsert"
                         value="${code }" style="float: right; border: 0px; padding-right:20px; ">추가하기</button>
                    </li>
                    
                    <li>펫 공유하기
                  <button type="button" class="btn btn-default btn-xs petShare"
                         value="${code }" style="float: right; border: 0px; padding-right:20px; ">공유하기</button>
                    </li>
                    
            </ul>
         </div>

         <h2 class="tit_name">공유받은 펫</h2>
         <div class="inner_snb">

            <ul class="list_menu">
               <c:forEach var="petshare" items="${petShare}">
                  
                  <!--  오픈 넘버가 0인경우(이용자가 펫을 삭제한 경우) -->
                     <c:if test="${petshare.p_open == 0 }">
                        
                        <span style="display: none;">${petshare.petName }</span>
                        
                     </c:if>   
                  
                  <c:if test="${petshare.p_open == 1 }">
                  <li>
                     ${petshare.petName }
                        <button type="button" class="btn btn-default btn-xs petSelect"
                               value="${petshare.petId }" style="float: right; border: 0px; padding-right:20px; ">더 보기</button>
                        </li>
                        </c:if>
               </c:forEach>
            </ul>
         </div>
      </div>
      
         
         <h2 class="diarySelect">곧 있을 일정</h2>
         <table class="table table-hover table-striped diaryselect"
          style="width:800px;">
            <thead>
               <tr class="trTitle">
                  
                  <th>펫 이름</th>
                  <th>제목</th>
                  <th>분류</th>
                  <th>작성자</th>
                  <th>시작일</th>
               </tr>
            </thead>
            <tbody>
            
            <c:forEach var="sooncome" items="${sooncome}">   
               <c:if test="${sooncome.p_open == 1 }">
               <tr class="trTitle">
                  
                  <th>${sooncome.petName }</th>
                  <th>${sooncome.midName }</th>
                  <th>${sooncome.diaryTitle }</th>
                  <th>${sooncome.memberNick }</th>
                  <th>${sooncome.startDate }</th>
                  <td> 
                     <button type="button" class="btn btn-default btn-xs petCon"
                           value="${sooncome.diaryId }">상세보기</button>
                  </td>         
               </tr>
               </c:if>
            </c:forEach>
            
            </tbody>
         </table>
      </div>


      <!-- <table class="blueText" border="1" id="tab">
         <tr>
            <td align="center" id="prev"><label onclick="prevmonth()">≤</td>
            <td colspan="5" align="center" id="Ymd"></td>
            <td align="center" id="next"><label onclick="nextmonth()">≥</td>
         </tr>


         <tr align="center">
            <td align="center">일</td>
            <td align="center">월</td>
            <td align="center">화</td>
            <td align="center">수</td>
            <td align="center">목</td>
            <td align="center">금</td>
            <td align="center">토</td>

         </tr>

      
      </tbody>
   </table>
   -->
   

   
   
   
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <!-- 푸터 구성 -->
      <div>
         <c:import url="footer.jsp"></c:import>
      </div>
      <script src="js/scripts.js"></script>
</body>
</html>


















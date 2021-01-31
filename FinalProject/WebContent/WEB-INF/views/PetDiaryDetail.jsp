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
<title>PetProfire.jsp</title>
<link rel="stylesheet" type="text/css" href="css/PetProfile.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">


   $(function()
   {
      $(".deleteBtn").click(
            function()
            {
               /* alert($(this).val()); */
               if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
                  {
                  $(location).attr("href",
                        "petdiaryremove.action?diaryId=" + $(this).val());
                  }
            });
      $(".updateBtn").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petdiaryupdateform.action?diaryId=" + $(this).val());
               
            });
      
      $(".backBtn").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "mypetdiary.action?code=" + $(this).val());
               
            });
            
   });
</script>
<body>
   <!-- 메뉴 구성영역 -->
   <div>
      <c:import url="header.jsp"></c:import>
   </div>

   <div id="Diary" style="margin-top:152px;">
   
      <p class="Diary_text">PET DIARY</p>
      <p class="Diary_text_small">나의 반려견을 등록하여 관리하고 공유해보세요!!</p>
      
   <div class="Diary_select">
         <div class="Diary_information"><a href="#">펫 다이어리 상세 조회</a></div>
   </div>
      
      
      <div id="Petprofile">
               
      

         <div class="btn_diaryinsert">
            <button class="btn btn-success updateBtn" value="${petdiarydetail.diaryId }">수정하기</button>
            <button class="btn btn-danger deleteBtn" value="${petdiarydetail.diaryId }">삭제하기</button>
            <button class="btn btn-primary backBtn" value="${code }">돌아가기</button>
         </div>
         
      
      <h2 class="diarySelect">다이어리 상세 조회</h2>
         <table class="table table-hover table-striped diaryselect"
          style="width:800px;">
            <tr>
               <th>제목</th>
               
               <td>${petdiarydetail.diaryTitle }</td>
            </tr>
            <tr>
               <th>장소</th>
               
               <td>${petdiarydetail.place }</td>
            </tr>
            
            <tr>
               <th>시작일</th>
               
               <td>${petdiarydetail.startDate }</td>
            </tr>
            
            <tr>
               <th>종료일</th>
               
               <td>${petdiarydetail.endDate }</td>
            </tr>
            
            <tr>
               <th>대분류</th>
               
               <td>${petdiarydetail.larName }</td>
            </tr>
            
            <tr>
               <th>중분류</th>
               
               <td>${petdiarydetail.midName }</td>
            </tr>
            
            <tr>
               <th>내용</th>
               
               <td>${petdiarydetail.diaryContent }</td>
            </tr>
            
            <tr>
               <th>작성자</th>
               
               <td>${petdiarydetail.memberNick }</td>
            </tr>
         </table>



      </div>
      <!-- end #petprofile -->
   </div>
   <!-- end #Diary  -->
   <br><br><br><br><br><br><br><br><br><br><br><br>
   <!-- 푸터 구성 -->
   <div>
      <c:import url="footer.jsp"></c:import>
   </div>

   
</body>
</html>
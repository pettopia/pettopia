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
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">


   $(function()
   {
      $(".petCon").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petdiarydetail.action?diaryId=" + $(this).val());
               
            });
      
      $(".petUpdate").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petprofileupdateform.action?petId=" + $(this).val());
               
            });
      
      $(".diaryInsert").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petdiaryinsertform.action?petId=" + $(this).val());
               
            });
      
      $(".petweight").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "petweightlistform.action?petId=" + $(this).val());
               
            });
      
      $(".petdelete").click(
            function()
            {
               var text = confirm("정말 삭제하시겠습니까?");
                  if(text == true)
                  {
                     $(location).attr("href",
                        "petprofiledelete.action?petId=" + $(this).val());
                  }
                  else
                  {
                     return;
                  }               
            });
      
      $(".back").click(
            function()
            {
               /* alert($(this).val()); */

                  $(location).attr("href",
                        "mypetdiary.action?code=" + $(this).val());
               
            });
   });
</script>

</head>
<body>
   <!-- 메뉴 구성영역 -->
   <div>
      <c:import url="header.jsp"></c:import>
   </div>

   <div id="Diary" style="margin-top:152px;">
   
      <p class="Diary_text">PET DIARY</p>
      <p class="Diary_text_small">나의 반려견을 등록하여 관리하고 공유해보세요!!</p>
      
   <div class="Diary_select">
         <div class="Diary_information"><a href="#">펫 프로필</a></div>
   </div>
      
      
      <div id="Petprofile">
         
         <div class="profile_image">
	        <div class="pet_profile_img">
	        	<img src="${img.filepath }" >
	        </div>
            
            <div class="btn">
	            <button class="btn btn-primary petUpdate" style="width:180px; margin-top: 5px;" 
	               value="${select.petId }">프로필 수정</button>
            </div>
            
         </div>
         
         <div class="profile_table">
         <table class="table" style="margin-top: 20px; font-size: 15px; font-weight: bold;">
            <tr>
               <td>이름</td>   
               <td>${select.petName }</td>
            </tr>
            <tr>
               <td>성별</td>
                        
              <c:if test="${select.petGender == 1 }">
                    <td>남</td>                  
              </c:if>
              <c:if test="${select.petGender == 2 }">
                    <td>여</td>                  
              </c:if>
                    
            </tr>
            <tr>
               <td>견종</td>
               <td>${select.breed } (${select.sizeName })</td>
               
            </tr>
            <tr>
               <td>생일</td>
               <td>${birth }</td>
            </tr>
            <tr>
               <td>중성화유무</td>
               <c:if test="${select.neutral == 1 }">
                    <td>유</td>                  
                    </c:if>
                    <c:if test="${select.neutral == 0 }">
                    <td>무</td>                  
                    </c:if>
            </tr>
            <tr>
               <td>체중</td>                              
               <td>${weight }(kg)</td>               
            </tr>
            <tr>
            
               <td>동물 등록번호</td>
               <td>${select.petRegNum }</td>
            </tr>
            <tr>
               <td>공유중인 회원</td>
                <td>
                  <c:forEach var="petcon" items="${connect }">
                     ${petcon.memberNick } 
                  </c:forEach> 
               </td> 
            </tr>
            
         </table>
      </div>

         <div class="btn_diaryinsert">
            <button class="btn btn-success diaryInsert" value="${select.petId }">다이어리 작성하기</button>
            <button class="btn btn-primary petweight" value="${select.petId }">펫 체중 확인하기</button>
            <button class="btn btn-danger  petdelete" value="${select.petId }">펫 삭제하기</button>
            <button class="btn btn-default  back" value="${code } ">돌아가기</button>
            
         </div>
         
      
      <h2 class="diarySelect">다이어리 조회</h2>
         <table class="table table-hover table-striped diaryselect"
          style="width:800px;">
            <thead>
               <tr class="trTitle">
                  <th>번호</th>
                  <th>닉네임</th>
                  <th>분류</th>
                  <th>제목</th>
                  <th>작성일</th>
               </tr>
            </thead>
            <tbody>
               
               <c:forEach var="diaryselect" items="${petdiaryselect}">                           
                     <tr class="petdiarydetail">
                        <td> ${diaryselect.num}</td>
                        <td> ${diaryselect.memberNick}</td>                  
                        <td> ${diaryselect.larName}</td>                                    
                        <td> ${diaryselect.diaryTitle}</td>
                        <td> ${diaryselect.writeDay}</td>
                        <td> 
                        <button type="button" class="btn btn-default btn-xs petCon"
                               value="${diaryselect.diaryId }">상세보기</button>
                        </td>
                     </tr>
                                                
               </c:forEach>
               
            </tbody>
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
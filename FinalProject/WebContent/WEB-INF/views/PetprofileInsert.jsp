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
<title>PetprofileInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/DiaryInsert.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function() {

    $("#breed").change(function() {

        var v = $("#breed").val();

       a/* lert("셀렉트값 : "+ v); */

    });
    
    $("#size").change(function() {

        var v = $("#size").val();

       /* alert("셀렉트값 : "+ v); */

    });
    
    
    $("input:radio[name=petGender]").click(function(){
      var radioVal = $('input[name="petGender"]:checked').val();
      alert(radioVal);
    });
    
    $("input:radio[name=neutral]").click(function(){
        var radioVal = $('input[name="neutral"]:checked').val();
        alert(radioVal);
      });
    
    $("#submitBtn").click(function()
       {
          //1.데이터 검사
          //-- 공란(입력항목 누락)이 있는지에 대한 여부 확인
          if( $("#petName").val() == "" || $("#birth").val() == "" || $("#petNum").val() == "")
          {
             /* $("#err").html("입력된 항목이 누락되었습니다");
             $("#err").css("display","inline"); */
             alert("입력된 항목이 누락되었습니다");
             return;      // submit 액션 처리 중단
          }
          
          $("#form").submit();
          
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
         <div class="Diary_information"><a href="">Information</a></div>
         <div class="Diary_start"><a href="Diary.jsp">Start</a></div>
      </div>

      <!-- 다이어리 생성 폼 -->
      <div id="InsertDiary">
         <p class="InsertDiary_text">반려견 등록하기</p>
         
         <form action="petprofileinsert.action" class="input form-inline" role="form" id="form" enctype="multipart/form-data">
            <input type="hidden" name="code" value="${code }">
            <table class="table" style="margin-top: 30px;">
               <tr>
                  <th>반려견 이름</th>
                  <th><input type="text" class="form-control" name="petName" id="petName"
                     style="width: 500px;"></th>
               </tr>

               <tr>
                  <th>견종</th>
                  <th>
                     <select class="form-control" style="width:300px;" name="breedId" id="breed">
                        <c:forEach var="breed" items="${breed }">
                           <option value="${breed.breedId }">${breed.breedName }</option>
                        </c:forEach>
                     </select>
                  </th>
               </tr>
               
               <tr>
                  <th>견종크기</th>
                  <th>
                     <select class="form-control" style="width:300px;" name="sizeId" id="size">
                        <c:forEach var="petsize" items="${petsize }">
                           <option value="${petsize.sizeId}">${petsize.sizeName }</option>
                        </c:forEach>
                     </select>
                  </th>
               </tr>

               <tr>
                  <th>성별</th>
                  <th>
                  남<input type="radio" name="petGender" value="1" checked>
                  여<input type="radio" name="petGender" value="2">
                  </th>
               </tr>
               
               <tr>
                  <th>생일</th>
                  <th><input type="date" class="form-control" name="petBirth" id="birth"></th>
               </tr>
               
               <tr>
                  <th>중성화</th>
                  <th>
                  유<input type="radio" name="neutral" value="1" checked> 
                  무<input type="radio" name="neutral" value="0">
                  </th>
               </tr>   
                           
               <!-- <tr>
                  <th>사진</th>
                  <th><input type="file" class="form-control"></th>
               </tr> -->
               
               <tr>
                  <th>동물등록번호</th>
                  <th><input type="text" class="form-control" name="petNum"
                     style="width: 500px;" placeholder="1234567890" id="petNum">
                  </th>
               </tr>
               
               <tr>
               		<th>프로필 이미지 등록</th>
               		<th><input type="file" class="form-control"></th>
               </tr>                      		
            </table>
         </form>
         <div class="button">
            <button type="submit" id="submitBtn" class="btn btn-success" style="width:300px; height:50px;">등록하기</button>
            <button type="reset"  class="btn btn-danger" style="width:300px; height:50px;">돌아가기</button>
         </div>
      </div>
      <!--end 다이어리 생성 폼 -->
   </div>
      <!-- end #Diary  -->
      
   <br><br><br>
   <div>
         <c:import url="footer.jsp"></c:import>
   </div>

   <script src="js/jquery-3.1.1.min.js"></script>
      <script src="js/scripts.js"></script>
</body>
</html>
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
<title>PetProfileShare.jsp</title>
<link rel="stylesheet" type="text/css" href="css/PetProfile.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

$(function() {

    $("#sharepet").change(function() {

        var v = $("#sharepet").val();

       /* alert("셀렉트값 : "+ v); */

    });
    
    $(".reset").click(
          function()
          {
             alert($(this).val());
          
                $(location).attr("href",
                      "mypetdiary.action?code=" + $(this).val());
             
          });
    
    $("#submitBtn").click(function()
           {
              //1.데이터 검사
              //-- 공란(입력항목 누락)이 있는지에 대한 여부 확인
              if( $("#nick").val() == "")
              {
                 /* $("#err").html("입력된 항목이 누락되었습니다");
                 $("#err").css("display","inline"); */
                 alert("닉네임을 입력해야 합니다");
                 return;      // submit 액션 처리 중단
              }
              
              $("#form").submit();
              
           });
       
});




$(document).ready(function()
{
      
         //에러(span 엘리먼트) 안내 초기화
         $("#err").css("display", "none");
         $("#err2").css("display", "none");
         
         //닉네임이 입력될 경우 수행할 코드 처리
         $("#nick").on("keyup", function()
         {
            //keyup 이벤트가 발생할 때 마다
            //실시간으로 입력값을 담아둘 변수 search
            var search = $(this).val();
            
            //입력 내용이 있을 경우에만 전송할 수 있도록 처리
            if(search.replace(" ", "") == "")
            {
               $("#err").css("display", "none");
               return;
            }
                        
            ajaxRequest();
         });         
});


function ajaxRequest()
{
   $.post("nickajax1.action", {nickName : $("#nick").val()}, function(data)
   {
      $("#err").html(data).css("display", "inline");
   });
}

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
            <a href="#">펫 공유하기</a>
         </div>
      </div>

      <div id="Petprofile">
         <form action="petprofileshare.action" method="post"  class="input form-inline" role="form" id="form" >
            <input type="hidden" name="code" value="${code }">

            <table class="table">
               <tr>
                  <th style="width: 190px;">다이어리 공유자 닉네임</th>
                  <th><input type="text" class="form-control"
                     style="width: 200px;" id="nick" name="memberNick">
                  <span id="err" style="color:red; font-weight:bold; display:none;"></span>
                  </th>
               </tr>

               <tr>
                  <th>공유할 나의 펫</th>
                  <th><select class="form-control" style="width: 200px;"
                     id="sharepet" name="petId">
                        <c:forEach var="petSelect" items="${petSelect}">
                           <c:if test="${petSelect.p_open == 1 }">
                              <option value="${petSelect.petId }">${petSelect.petName }</option>
                           </c:if>
                        </c:forEach>
                  </select>
                  </th>
               </tr>

               <tr>
                  <td colspan="2"><span id="err"
                     style="color: red; font-weight: bold; display: none;"></span></td>
               </tr>
            </table>            
            
         </form>
            <button class="btn btn-success"  id="submitBtn"
               style="width: 150px; float: right;">공유하기</button>
            <%-- <button class="btn btn-danger" style="width: 150px; float: right; margin-right: 10px;" class="reset" value="${code }">취소하기</button> --%>
      </div>
   </div>
   <!-- end Diary  -->

   <!-- 푸터 구성 -->

   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/scripts.js"></script>

</body>
</html>
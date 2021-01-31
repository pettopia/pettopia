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
<title>PetScheduleUpdate.jsp</title>
<link rel="stylesheet" type="text/css" href="css/DiarySchedual.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
/*    $(document).ready(function()
   {
      $("#daily").click(function()
      {
         //alert("호츌");
         $("#Daily").toggle();
         $("#Regular").css("display", "none");
         $("#Care").css("display", "none");

      });
   });

   $(document).ready(function()
   {
      $("#regular").click(function()
      {
         //alert("호츌");
         $("#Regular").toggle();
         $("#Daily").css("display", "none");
         $("#Care").css("display", "none");

      });
   });

   $(document).ready(function()
   {
      $("#care").click(function()
      {
         //alert("호츌");
         $("#Care").toggle();
         $("#Regular").css("display", "none");
         $("#Daily").css("display", "none");
      });
   }); */ 
   

   
   
         
   $(function()
   {      
      $("#submitBtn").click(function()
              {
                 //1.데이터 검사
                 //-- 공란(입력항목 누락)이 있는지에 대한 여부 확인
                 if( $("#title").val() == "" || $("#startdate").val() == ""
                    || $("#enddate").val() == "" || $("#Daily2").val() == null)
                 {
                    /* $("#err").html("입력된 항목이 누락되었습니다");
                    $("#err").css("display","inline"); */
                    alert("입력된 항목이 누락되었습니다");
                    return;      // submit 액션 처리 중단
                 }
                 
                 $("#form").submit();
                 
              });
   
      $(".larBtn1").click(function()
      {
         /* alert($(this).val()); */
         ajaxRequest1();
      });

      $(".larBtn2").click(function()
      {
         /* alert($(this).val()); */
         ajaxRequest2();
      });

      $(".larBtn3").click(function()
      {
         /* alert($(this).val()); */
         ajaxRequest3();
      });
            
      $(function() {

          $("#Daily2").change(function() {

              var v = $("#Daily2").val();

             /* alert("셀렉트값 : "+ v); */

          });

      });

      
   });

   function ajaxRequest1()
   {
      $.post("midnameajax.action",
      {
         s : $(".larBtn1").val()
      }, function(data)
      {
         $("#Daily2").html(data).css("display", "inline");
      });
   }
   
   function ajaxRequest2()
   {
      $.post("midnameajax.action",
      {
         s : $(".larBtn2").val()
      }, function(data)
      {
         $("#Daily2").html(data).css("display", "inline");
      });
   }
   
   function ajaxRequest3()
   {
      $.post("midnameajax.action",
      {
         s : $(".larBtn3").val()
      }, function(data)
      {
         $("#Daily2").html(data).css("display", "inline");
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
   <br><br><br>
      <div>
         <h1 style="font-weight: bold;">펫 일정 수정</h1>
         <hr>
      </div>
   
   <form action="petdiaryupdate.action" method="post" class="input form-inline" role="form" id="form">
      <input type="hidden" name="diaryId" value="${diaryId }">
      <!-- <form class="input form-inline" role="form"> -->

         제목 : <input type="text" class="form-control" style="width:500px;" name="title" id="title" value="${petdiarydetail.diaryTitle }"> <br>
         <br> 장소 : <input type="text" class="form-control" style="width:500px;" name="place" id="place" value="${petdiarydetail.place }"> <br>
         <br> 일시 : 
             <input type="datetime-local" class="form-control" style="width:230px;" name="startdate" id="startdate" value="${startdate }">
            &nbsp;-&nbsp;
            <input type="datetime-local" class="form-control" style="width:230px;" name="enddate" id="enddate" value="${enddate }">

      <!-- </form> -->


      <h3>유형</h3>
      <c:forEach var="larname" items="${larname }">
         
         <input type="button" id="daily" class="btn btn-success larBtn${larname.diary_lar_id }" 
         value="${larname.diary_lar_id }" > ${larname.larName }
         
         <!-- <button id="regular" class="dailyBtn btn btn-info">정기관리</button>
         <button id="care" class="dailyBtn btn btn-primary">수의학케어</button> -->
      </c:forEach>
      
   
      <br><br>
      <div id="Daily">
                  
         분류 : <select class="form-control" id="Daily2" style="width:300px;" name="diary_mid_id"></select>
                  
         
         <h2>내용</h2>
         <textarea class="form-control" rows="5" cols="10" style="width:550px;" name="content">${petdiarydetail.diaryContent }</textarea>
         
         
         
      
      </div> 
   </form>
   <br>
          <button class="dailyBtn btn btn-success" id="submitBtn">등록하기</button>

      <!-- <div id="Regular" style="display: none;">
      <form class="input form-inline" role="form">
         <h3>일상관리</h3>
         제목 : <input type="text" class="form-control" style="width:500px;"> <br><br>
         분류 : <select class="form-control">
            <option>산책</option>
            <option>먹이</option>
            <option>물</option>
            <option>간식</option>
            <option>영양제</option>
            <option>복용약</option>
            <option>양치</option>
            <option>빗질</option>
            <option>귀청소</option>
            <option>변상태</option>
         </select> 
         
         <h2>내용</h2>
         <textarea class="form-control" rows="5" cols="10" style="width:550px;" ></textarea>
         
         <br>
          <button class="dailyBtn btn btn-success">등록하기</button>
         
      </form>
      </div> -->
      <!-- end #Regular -->
   
      <!-- 수의학 케어 -->
      
      <!-- <div id="Care" style="display: none;">
      <form class="input form-inline" role="form">
         <h3>일상관리</h3>
         제목 : <input type="text" class="form-control" style="width:500px;"> <br><br>
         분류 : <select class="form-control">
            <option>산책</option>
            <option>먹이</option>
            <option>물</option>
            <option>간식</option>
            <option>영양제</option>
            <option>복용약</option>
            <option>양치</option>
            <option>빗질</option>
            <option>귀청소</option>
            <option>변상태</option>
         </select> 
         
         <h2>내용</h2>
         <textarea class="form-control" rows="5" cols="10" style="width:550px;" ></textarea>
         
         <br>
          <button class="dailyBtn btn btn-success">등록하기</button>      
      </form>
      </div>
 -->      <!-- end #Care -->

   </div>
   <!-- end #Diary -->
   <div>
      <c:import url="footer.jsp"></c:import>
   </div>
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/scripts.js"></script>
</body>
</html>
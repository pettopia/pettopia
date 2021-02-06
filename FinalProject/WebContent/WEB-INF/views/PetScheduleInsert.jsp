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
<title>PetScheduleInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/DiarySchedual.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

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
      
   });
            
  $(function() {

          $("#Daily2").change(function() {

              var v = $("#Daily2").val();

             /* alert("셀렉트값 : "+ v); */

          });      
   });
      
  
  $(document).ready(function () {
	  
      /* 달력 선택 function - jqueryUI - datepicker 함수*/
      var dateFormat = "yy-mm-dd",

          from = $("#startdate").datepicker({
              dateFormat: "yy-mm-dd",
              defaultDate: 0,
              changeMonth: true,
              /* minDate: 0, 전체 선택하고 싶으면 주석 / 현재와 미래만 선택하고 싶으면 min / 현재와 과거만 선택하고 싶으면 max*/
              numberOfMonths: 1,
              closeText: "닫기",
              prevText: "이전달",
              nextText: "다음달",
              currentText: "오늘",
              monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                  "7월", "8월", "9월", "10월", "11월", "12월"],
              monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                  "7월", "8월", "9월", "10월", "11월", "12월"],
              dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
              dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
              dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]
          })
              .on("change", function () {
            	  
            	  var curDate = $('#startdate').datepicker("getDate");
            	  
                  curDate.setDate(curDate.getDate());
                  $("#enddate").datepicker("option", "minDate", curDate);
					
              }),
          to = $("#enddate").datepicker({
              dateFormat: "yy-mm-dd",
              defaultDate: 0,
              changeMonth: true,
              numberOfMonths: 1,
              closeText: "닫기",
              prevText: "이전달",
              nextText: "다음달",
              currentText: "오늘",
              monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                  "7월", "8월", "9월", "10월", "11월", "12월"],
              monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                  "7월", "8월", "9월", "10월", "11월", "12월"],
              dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
              dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
              dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]

          })
              .on("change", function () {
                  from.datepicker("option", "maxDate", getDate(this));
              });
      	  
      $("#startdatetime").timepicker({
    	  step:30,  
    	  timeFormat: "H:mm"
    	    
    	    /* interval: 60,
    	    minTime: '10',
    	    maxTime: '6:00pm',
    	    defaultTime: '11',
    	    startTime: '10:00',
    	    dynamic: false,
    	    dropdown: true,
    	    scrollbar: true */
    	});
      
      $("#enddatetime").timepicker({
    	  step:30,  
    	  timeFormat: "H:mm"
    	    
    	    /* interval: 60,
    	    minTime: '10',
    	    maxTime: '6:00pm',
    	    defaultTime: '11',
    	    startTime: '10:00',
    	    dynamic: false,
    	    dropdown: true,
    	    scrollbar: true */
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
         <h1 style="font-weight: bold;">펫 일정 등록</h1>
         <hr>
      </div>
   
   <form action="petdiaryinsert.action" method="post" class="input form-inline" role="form" id="form">
      <input type="hidden" name="petId" value="${petId }">
      <!-- <form class="input form-inline" role="form"> -->

         제목 : <input type="text" class="form-control" style="width:500px;" name="title" id="title"> <br>
         <br> 장소 : <input type="text" class="form-control" style="width:500px;" name="place" id="place" > <br>
         <br> 일시 : 
             <input type="text" class="form-control" style="width:100px;" name="startdate" id="startdate" readonly="readonly" placeholder="날짜를 입력하세요">
             <input type="text" class="form-control" style="width:100px;" name="startdate" id="startdatetime" readonly="readonly" placeholder="시간을 입력하세요">
            &nbsp;-&nbsp;
            <input type="text" class="form-control" style="width:100px;" name="enddate" id="enddate" readonly="readonly" placeholder="날짜를 입력하세요">
            <input type="text" class="form-control" style="width:100px;" name="enddate" id="enddatetime" readonly="readonly" placeholder="시간을 입력하세요">

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
         <textarea class="form-control" rows="5" cols="10" style="width:550px;" name="content" ></textarea>
         
         
         
      
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

   <script src="js/scripts.js"></script>
</body>
</html>
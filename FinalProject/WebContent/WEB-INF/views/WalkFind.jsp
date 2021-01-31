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
<title>WalkFind.jsp</title>
<style type="text/css">
#wrapper
{
	width:1150px;
	margin: 0 auto;
   
   margin-top: 150px;
   margin-bottom: 20px;
}
.title
{
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
   
}

h2
{
	   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
   
}
</style>

<script type="text/javascript">

	$(function()
	{
		$("#createbtn").click(function()
		{
		
			$("#myForm").submit();
			
		});
		
		$("#canclebtn").click(function()
		{
			$(location).attr('href','walklistboard.action');
		
		});
		
	});
	
</script>

<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<!-- 헤더 -->
<div>
      <c:import url="header.jsp"></c:import>
</div>

<div class="ec-base-tab">
    <ul class="menu">
        <li><a href="#none">마이페이지</a></li>
        <li class="selected"><a href="#none">산책모임</a></li>
        <li><a href="#none">펫시터</a></li>
        <li><a href="#none">자유게시판</a></li>
        <li><a href="#none">고객센터</a></li>
    </ul>
</div>
<div id="wrapper">
<h1 align="center" class="title">원하시는 조건에 체크하세요!</h1>


	<div align="center">
	
	<form action="walkfindsubmit.action" method="post" id="myForm">
	<br>

		<hr>
			<br>
			<div> 
			 <h2>모임 인원수를 선택하세요</h2> 
			 <input type="checkbox" name="walk_nop_seq" value="1" > 2~3인 
			 <input type="checkbox" name="walk_nop_seq" value="2" > 4인 
			 <input type="checkbox" name="walk_nop_seq" value="3" > 무관 
			
			 </div>
		
		  <br>
		 <div>
			 <h2>모임 목적을 선택하세요</h2>
			 <input type="checkbox" name="walk_aim_seq" value="1" > 산책 
			 <input type="checkbox" name="walk_aim_seq" value="2"> 소통 
			 <input type="checkbox" name="walk_aim_seq" value="3"> 훈련 
			 <br>
		</div>
		
		  <br>
		    <div>
		     <h2>원하시는 지역을 선택하세요</h2>
			  <select name="region_lar_seq" id="region_lar_seq">
			    	<option value="" selected disabled hidden>==[시/도]를 선택하세요==</option>
				    <c:forEach var="addrlarname" items="${addrlarname }" varStatus="i">
				    	<option value="${addrlarname.region_lar_seq }">${addrlarname.larname }</option>
				    </c:forEach>
			   </select>
			 
			   </div>
			   
			   
		
		
		
			 <br>
			<div> 
			 <h2>나와 같은 성별의 주인과 산책하고 싶다면 체크하세요</h2> 
			 <input type="checkbox" name="gender_op_seq" value="1" >동성만 
			 
			</div> 
			
			  <br>
		   <div> 
			 <h2>원하는 상대 강아지 크기를 선택하세요</h2> 
			 <input type="checkbox" name="pet_size_seq" value="1" > 대형
			 <input type="checkbox" name="pet_size_seq" value="2" > 중형
			 <input type="checkbox" name="pet_size_seq" value="3" > 소형
			 
			</div> 
		
		   <br>
		   <div>
			 <h2>나와 비슷한 연령대를 원하시면 체크하세요</h2>
			 <input type="checkbox" name="age_op_seq" value="0">비슷한 연령대를 원합니다. 
		   </div>
			  
			
		 
		<br>

	<span style="color: red;">※안전을 위하여 반려견은 명당 최대 1마리로 제한합니다.</span>
	
	 
	<div align="center">
		<br>
		<button type="submit" class="btn" id="createbtn">모임 검색하기</button>&nbsp;
		<a href='walklistboard.action'><button type="button" class="btn" id="canclebtn">취소</button></a>
	</div>
	
	</form>
</div>

</div>






<!-- 하단 시작 { -->
<div>
      <c:import url="footer.jsp"></c:import>
  </div>
</body>
</html>
















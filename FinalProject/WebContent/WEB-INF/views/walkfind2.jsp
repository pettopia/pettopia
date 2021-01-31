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
<title>Insert title here</title>
<style type="text/css">
#wrapper
{
	width:1150px;
	margin: 0 auto;
   
   margin-top: 200px;
   margin-bottom: 20px;
}

</style>
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
<h1 align="center">나에게 맞는 산책모임방을 찾아보세용~!!</h1>
<hr>
<div class="div">
	<div align="center">
		
		<input type="radio" name="meeting" value="2인" > 2인
		<input type="radio" name="meeting" value="3인" > 3인
	</div>
	
	<div align="center">
		<input type="radio" name="object" value="산책" > 산책
		<input type="radio" name="object" value="소통"> 소통
		<input type="radio" name="object" value="훈련"> 훈련
	</div>
	
	<div align="center">
		<select name="year" >
			<option value="">년도</option>
			<option value="2020">2020</option>
			<option value="2019">2019</option>
			<option value="2018">2018</option>
			<option value="2017">2017</option>
		</select>
		
		<select name="month">
			<option value="">월</option>
			<option value="12">12</option>
			<option value="11">11</option>
			<option value="10">10</option>
			<option value="9">9</option>
		</select>
	
		<select name="month">
			<option value="">일</option>
			<option value="30">30</option>
			<option value="29">29</option>
			<option value="28">28</option>
			<option value="27">27</option>
		</select>
	</div>
	
	<div align="center">
		<select name="si">
			<option value="">시</option>
		</select>
		<select name="gun">
			<option value="">읍/면/동</option>
		</select>
	
	</div>
	
	<div align="center">
		<input type="radio" name="character" value="외향"> 외향
		<input type="radio" name="character" value="내향"> 내향
		<input type="radio" name="character" value="무관"> 무관
		<br>
		<hr>
	</div>
	
	<div align="center">
	
	</div>
	
	<div align="center">
		<button type="button" class="btn">찾기</button>&nbsp;
		<button type="button" class="btn">취소</button>
	</div>
</div>
</div>
<!-- 하단 시작 { -->
<div>
      <c:import url="footer.jsp"></c:import>
  </div>
</body>
</html>
















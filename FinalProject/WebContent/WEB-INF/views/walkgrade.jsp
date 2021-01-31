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
.star-rating { width:205px; }
.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
.btn{height:30px; width:100px;}
</style>

<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body> 
	

	<div>
		<h2>산책에 참여한 사람들 목록</h2> 
		 <br>
		
		
		박해진(컹컹)
		<div class='star-rating'>
	        <span style ="width:30%"></span>
	    </div><br>
	    
		김보경(꿀비)
		<div class='star-rating'>
	        <span style ="width:50%"></span>
	    </div><br>
	    
		정의진(토르)
		<div class='star-rating'>
	        <span style ="width:80%"></span>
	    </div>
	    <br>
		
	
	</div>

<div class="button">
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn">제출</button> &nbsp;
	<button type="button" class="btn">취소</button>
</div>


</body>
</html>
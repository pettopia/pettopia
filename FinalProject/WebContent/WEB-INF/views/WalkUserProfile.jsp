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
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="css/main_master.css">
<style type="text/css">

#tblAdd
{
	font-size : 20px;
}

th
{
	text-align:center;
	width : 200px;
}


</style>
<script type="text/javascript">
$(function(){
    $('#btn_close').click(function(){
        window.close();
    });
});

</script>
</head>
<body>

<div>
	<h2 align="center"><strong>${list.nick }</strong>님의 프로필</h2>
</div>
<div>	

<table class="table table-bordered"  id="tblAdd" style="border-collapse:collapse; text-align: center; ">
			<tr>
				<th style="text-align: center">거주지</th>
				<td>
					${list.addr1 }
				</td>
			</tr>
			<tr>
				<th style="text-align: center">나이</th>
				<td>
					${list.age}세
				</td>
			</tr>
			<tr>
				<th style="text-align: center">성별</th>
				<td>
					${list.gender }
				</td>
			</tr>
			<tr>
				<th style="text-align: center">산책모임평점</th>
				<td>
					${list.ascore } / 5.0 [ ★★★★☆ ]
				</td>
			</tr>
</table>

<div>
	 <h2 align="center">반려견 <strong>${list.petname }</strong>의 프로필</h2>
</div>
<div id="profile_img_dog" align="center">
	<img src="images/dog.jpg" width="200" height="200" alt="dog" id="dog">
</div>
	 <br>
	<table class="table table-bordered"  id="tblAdd" style="border-collapse:collapse; text-align: center;">
			
			<tr>
				<th style="text-align: center">[참여]반려견이름</th>
				<td>
					${list.petname }
				</td>
			</tr>
			<tr>
				<th style="text-align: center">견종</th>
				<td>
					${list.breed }
				</td>
			</tr>
			<tr>
				<th style="text-align: center" >반려견성별</th>
				<td>
					${list.petgender }
				</td>
			</tr>
			<tr>
				<th style="text-align: center">중성화여부</th>
				<td>
					${list.neutral }
				</td>
			</tr>
			
			<tr>
				<th style="text-align: center">반려견나이</th>
				<td>
					${list.petage} 세
				</td>
			</tr>
			
		</table>
		
</div>
<div id="button_area" style="text-align: center;">
	
	<button type="button" id ="btn_follow" class="btn btn-info" ><span class="glyphicon glyphicon-remove" aria-hidden="true"> 차단</span></button>
	<button type="button" id ="btn_follow" class="btn btn-info" ><span class="glyphicon glyphicon-heart" aria-hidden="true"> 팔로우</span></button>
	<button type="button" id = "btn_close" class="btn btn-info" ><span class="glyphicon glyphicon-log-out" aria-hidden="true"> 닫기</span></button>
</div>
	<br><br>
</body>
</html>
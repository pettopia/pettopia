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
	font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
   font-size: 25px;
}
h2
{
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
   font-size: 40px;
}

</style>
<script type="text/javascript">

	$(function()
		{
			$("#btn_close").click(function()
			{
			
				window.close();
				
			});


			$("#btn_submit").click(function ()
			{
				
				$("#myForm").submit();
			});
			
		});
</script>
</head>
<body>

<div class="title_selectdog">
	<h2 align="center"><strong>함께할 강아지를 선택해주세요</strong></h2>
	<br>
</div>
<div>	
<form action="walkjoin.action" method="post" id="myForm">
<input type="hidden" name="walk_meeting_seq" value="${walk_meeting_seq}"> 
<input type="hidden" name="res" value="${walkjoinpart.res }">
	<table class="table table-bordered"  id="tblAdd" style="border-collapse:collapse; text-align: center; ">
			<tr>
				<th>함께할 댕댕이</th>
				
				
				<td>
					<select name="pet_con_reg_seq" id="pet_con_reg_seq"> 
						<option value="" selected disabled hidden>==강아지를 선택하세요==</option>
						<c:forEach var="doglist" items ="${doglist }" varStatus="i">
						<option value="${doglist.pet_con_reg_seq }" >${doglist.petname }</option>
						</c:forEach>
					</select> 
				</td>
				
			</tr>
	</table>
	
	
</form>
</div>
<div id="button_area" style="text-align: center;">
	
	<button type="button" id ="btn_submit" class="btn btn-info" ><span class="glyphicon glyphicon-heart" aria-hidden="true"> 확인</span></button>
	<button type="button" id ="btn_close" class="btn btn-info" ><span class="glyphicon glyphicon-log-out" aria-hidden="true"> 닫기</span></button>
</div>
	<br><br>
</body>
</html>
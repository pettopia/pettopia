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
<title>PetWeightList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/PetProfile.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<script type="text/javascript">


	$(function()
	{
		$(".weightInsert").click(
			function()
			{
				alert($(this).val());

				$(location).attr("href",
				"petweightinsertform.action?petId=" + $(this).val());
					
		});
		$(".backprofile").click(
				function()
				{
					
					$(location).attr("href",
					"petprofilelist.action?petId=" + $(this).val());
						
			});
	});
</script>
<body>
	<div>
		<c:import url="header.jsp"></c:import>
	</div>

	<div id="Diary" style="margin-top:152px;">
	
		<p class="Diary_text">PET DIARY</p>
		<p class="Diary_text_small">나의 반려견을 등록하여 관리하고 공유해보세요!!</p>
		
	<div class="Diary_select">
			<div class="Diary_information"><a href="#">펫 체중 조회 및 등록</a></div>
	</div>
		
		
		<div id="Petprofile">
			
			<div class="profile_image">
				<img src="images/dog.jpg">
								
			</div>
			
			<div class="profile_table">
			<table class="table" style="margin-top: 20px; font-size: 15px; font-weight: bold;">
			<thead>
				<tr>
					<th>등록자</th>
					<th>체중</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="petweight" items="${petweight }">
					<tr>
						<td>${petweight.memberNick}</td>
						<td>${petweight.petWeight}kg</td>
						<td>${petweight.writeDay}</td>
					</tr>
				</c:forEach>
			</tbody>
				
			</table>
		</div>

			<div class="btn_diaryinsert">
				
				<button class="btn btn-success weightInsert" value="${select.petId }">체중 등록하기</button>
				<button class="btn btn-danger backprofile" value="${select.petId }">돌아가기</button>		
				
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<!-- 푸터 구성 -->
	<div>
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>
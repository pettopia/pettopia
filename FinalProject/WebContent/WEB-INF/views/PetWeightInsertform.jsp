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
<title>PetWeightInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/PetProfile.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


 	$(function()
	{
		$(".weightInsert").click(
			function()
			{
				//alert($(this).val());

				/* $(location).attr("href",
				"petweightinsert.action?petId=" + $(this).val()); */
					
		});
	}); 
</script>

<style type="text/css">

.profile_table
{
	margin-top: 80px;	
}

</style>
</head>
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
				<div class="pet_profile_img">
					<img src="${img.filepath }" >
				</div>
			</div>
			
			<form action="petweightinsert.action" method="post">
				<input type="hidden" name="petId" value="${petId }">
				<div class="profile_table">
					<table style="margin-top: 20px; font-size: 20px; font-weight: bold;">
						<tr>
							<th>${select.petName }의 현재체중은?</th>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" name="petWeight">
							</td>
							<td>
								kg
							</td>
						</tr>
										
					</table>
				</div>
			
				<div class="btn_diaryinsert">
					<button class="btn btn-success weightInsert" value="${select.petId }">체중 등록하기</button>				
				</div>
			</form>
		</div>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 푸터 구성 -->
	<div>
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>
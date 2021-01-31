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
<title>PetsitterView.jsp</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

#wrapper {
	margin: 0 auto;
	width: 1150px;
	margin-top: 160px;
}

.main_content .header
{
	margin-bottom: 20px;
}

.my_image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	float: left;
} 
.following_user_form
{
	width:950px;
	height: 200px;
}
.table1 {
    float: left;
    height: 50px;
    margin-top: 40px;
    margin-left: 30px;
    text-align: center;
}
.table1 th
{
	width:100px;
}

#my-inf
{
	width:80%;
	height:500px; 
}


</style>

<script type="text/javascript">

$(".backList").click(
      function()
      {
         alert($(this).val());
      
            $(location).attr("href","petsitterview.action");
         
      });
            
$(".modifyBtn").click(
		function()
		{
			alert($(this).val());
		      
            $(location).attr("href","psprofileupdateform.action");
		});


</script>
</head>
<body>
	<div id="header">
<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

	<c:import url="sidemenu_ps.jsp"></c:import>

	<div class="main_content" style="margin-left: 240px; padding-top: 60px;">

			<div class="header">
				<i class="fas fa-home" style="font-size: 30px;"></i> <span
					style="font-weight: bold; font-size: 20pt;">펫시터 마이페이지</span>
			</div>
		
	<div id="content">

		<table class="table table-borderless">


			<tr>
				<th colspan="2"><h3>기본정보</h3></th>
			</tr>
			<tr>
				<th>닉네임 :</th>
				<td>${petsitter.nickname }</td>
			</tr>

			<tr>
				<th>나이 :</th>
				<td>${petsitter.age }</td>
			</tr>
			<tr>
				<th>성별 :</th>
				<td>${petsitter.gender }</td>
			</tr>


			<tr>
				<th colspan="2"><h3>세부사항</h3></th>
			</tr>


			<tr>
				<th style="width: 120px;">희망 반려동물 :</th>
				<td><c:forEach var="sizetype" items="${sizetype }"
						varStatus="status">
						<span style="display: none;">${status.count}</span>
						${sizetype.sizetype }
         			</c:forEach></td>
			</tr>

			<tr>
				<th>돌봄 비용 :</th>
				<td><c:forEach var="carepay" items="${carepay }"
						varStatus="status">
						<span style="display: none;">${status.count}</span>
						${carepay.carepay }
         			</c:forEach></td>
			</tr>


			<tr>
				<th>돌봄 형태 :</th>
				<td><c:forEach var="caretype" items="${caretype }"
						varStatus="status">
						<span style="display: none;">${status.count}</span>
						${caretype.caretype }
         </c:forEach></td>

			</tr>


			<tr>
				<th>자기소개 :</th>
				<td>${pscontent.pscontent }</td>
			</tr>

			<tr>
				<th>돌봄환경 :</th>
				<td><c:forEach var="service" items="${service }"
						varStatus="status">
						<span style="display: none;">${status.count}</span>
						${service.service }, 
         </c:forEach></td>

			</tr>



			<tr>
				<th>돌봄 환경 이미지</th>
				<td><c:forEach var="filepath" items="${filepath }"
						varStatus="status">
						<span style="display: none;">${status.count}</span>
         				${filepath.filepath } 
         </c:forEach></td>
			</tr>

			<tr>
				<th>이용후기</th>
				<td><c:forEach var="review" items="${review }"
						varStatus="status">
						<span style="display: none;">${status.count}</span>
                  ${review.psscore }<br> 
                  ${review.reviewcontent }<br>
                  ${review.reviewdate } 
                  </c:forEach></td>
			</tr>

			<tr>
				<th>주소 :</th>
				<td>${petsitter.addr }</td>
		</table>		
	</div>



	
	
	<!-- end content -->


	<!-- footer -->
	

	<!-- 제이쿼리,스크립트 -->
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/scripts.js"></script>
</div>
</div>
<div>
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
<br>


</html>
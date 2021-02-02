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
<title>PetsitterList.jsp</title>
<link rel="stylesheet" href="css/PetsitterList.css">
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
		$(".psView").click(
				function()
				{
					alert($(this).val());
					$(location).attr("href",
							"petsitterview.action?seq=" + $(this).val());
				});
		
	});
	
	
	
	

</script>
<script type="text/javascript">
//검색 버튼 클릭 액션
	$(".search").click(function()
	{
		if($("#search_text").val() == "")
		{
			alert("검색어를 입력하세요.");
			return;
		}
		
		
	});

</script>




<!--아이콘 링크 -->


</head>
<body>


	<!-- header -->
	<c:import url="header.jsp"></c:import>


	<!-- 콘텐츠 영역 -->
	<div id="content" style="margin-top: 182px;">

		<p class="Diary_text">PETSITTER</p>
		<p class="Diary_text_small">펫시터를 찾아 돌봄 신청을 하세요.<br>펫시터가 되어 보세요-!</p>

		<div class="Diary_select">
			<div class="Diary_information">
				<a href="petsitter.action">펫시터 찾기</a>
			</div>
			<div class="Diary_start">
				<%
					//로그인 되어있을 때
					String code = null;
					if (session.getAttribute("id") != null)
					{
						code = (String) session.getAttribute("code");
				%>
				<c:if test="${psregcode == null }">
				<a href="petsitterreq.action">펫시터 신청</a>
				</c:if>
				<c:if test="${psregcode != null }">
				<a href="javascript:void(0);" onclick="alert('이미 펫시터인 회원입니다.');">펫시터 신청</a>
				</c:if>
				<%
					}
					else
					{
				%>
					<a href="petsitterloginform.action">펫시터 신청</a>
				<%
					}
				%>
			</div>

		</div>
		
							


		 	<div class="menu">
			<input type="text" name="search_text" id="search_text" value="${search_text }"
				placeholder="동 이름을 검색하세요 (예. 논현동)" onKeypress="search()"> 
			<!-- <input type="date" id="now_date"> <a>~</a> <input type="date" id="now_date"> -->
			<div id="btn">
				<span class="noselect">Search
				<a href="javascript:void(0);" class="search">
				</span>
				
				<div id="circle"></div>
			</div>


		</div> 

		<br> <br> <br>



		<div class="far_best" style="height: 1000px;">
			<!--같은동네모임-->

			<div class="sub_far_best"></div>


			<table class="table table-hover table-striped profile"
				>
				<thead>
					<tr class="pprofileTitle">
						<th>닉네임</th>
						<th>연령</th>
						<th>지역</th>
						<th>자기소개</th>
					</tr>
				</thead>
				<tbody>
			
					<c:forEach items="${profile }" var="profile">
						<tr class="pprofilecontext">
							<td>${profile.nick }</td>
							<td>${profile.age }</td>
							<td>${profile.addr1 }</td>
							<td><a href="petsitterview.action?seq=${profile.seq }">${profile.pscontent }</a></td>
							<td><button type="button" class="btn btn-default btn-xs psView"
							name="seq" value="${profile.seq }">상세보기</button></td>
						</tr>
				</c:forEach>
				</tbody>
				
			</table>


			<!-- 
						<div class="qwe" style="float:left; height: 330px;">
							<img src="images/a12.jpg"> <strong class="best_name">
								<span class="best_product_name">인천시 계양구</span>
							</strong>
						</div>

						<div class="qwe" style="float:left; height: 330px;">
							<img src="images/a12.jpg"> <strong class="best_name">
								<span class="best_product_name">인천시 계양구</span>
							</strong>
						</div>

						<div class="qwe" style="float:left; height: 330px;">
							<img src="images/a12.jpg"> <strong class="best_name">
								<span class="best_product_name">인천시 계양구</span>
							</strong>
						</div> -->

			<div class="mid" style="margin-left: 400px; float: left;">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="">이전</a></li>
					<li class="page-item"><a class="page-link" href="">1</a></li>
					<li class="page-item"><a class="page-link" href="">2</a></li>
					<li class="page-item"><a class="page-link" href="">3</a></li>
					<li class="page-item"><a class="page-link" href="">다음</a></li>
				</ul>
			</div>






		</div>




		<!-- footer -->
		<div>
			<c:import url="footer.jsp"></c:import>
		</div>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/scripts.js"></script>
</body>
</html>
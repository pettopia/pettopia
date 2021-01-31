<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
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
	$(document).ready(function()
	{
		$("#modifyBtn").click(function()
	    {
	    	$(location).attr('href','checkpwform.action?n=1');
	    });
		
	});
</script>
</head>
<body>

<div id="header">
<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

	<c:import url="sidemenu.jsp"></c:import>

	<div class="main_content" style="margin-left: 240px; padding-top: 60px;">
	
		<div class="header">
			<i class="fas fa-home" style="font-size: 30px;"></i>
			<span style="font-weight:bold; font-size: 20pt; ">마이페이지 홈</span>
		</div>

		<div class="info">

		<!-- 팔로잉 유저 리스트 -->
		<div class="following_user_form">
			
			<img class="my_image" src="images/me.jpg" alt="profile_img">
			
			<table class="table table1" style="width: 30%;">
			<tr>
				<th>팔로잉</th>
				<th>팔로우</th>
			</tr>
			<tr>
				<th>${list.following }</th>
				<th>${list.follower }</th>
			</tr>
			</table>
				
		</div>	

		<div id="my-inf">
			<h3>회원 로그인 정보</h3>
				<form id="form" name="form" action="myinfedit.action" method="post">
					<input type="hidden" value="${member_code_seq }" name="member_code_seq">
					<table class="table">
						<tr>
							<th><label for="userid" >아이디</label></th>
							<td>
								<input type="text" value="${list.id }" title="아이디 입력" id="id" name="id"
									class="form-control" readonly="readonly">
							</td>
						</tr>
						
						<tr>
							<th><label for="username" >닉네임</label></th> 
							<td>
								<input type="text" value="${list.nick }"  readonly="readonly" id="nick" name="nick" title="닉네임 입력" class="form-control" > 
							</td>
						</tr>
					</table>

					<h3 class="tit font-black">연락처 정보</h3>
									
					<div class="table-wrap mb50">
						<table class="table">
							
							
								<tr>
									<th>거주지 주소</th>
									<td>
										<div class="zip-wrap">

											<p>
												<input type="text" class="form-control" title="우편번호 입력" readonly="readonly" id="addrnumber"  name="addrnumber" value="${list.addrnumber }">
											</p>
											<p>
												<input type="text" class="form-control" title="시명"
													placeholder="시명" readonly="readonly" id="addr1"  name="addr1"  value="${list.addr1 }">
											</p>
											<p class="mt10">
												<input type="text" class="form-control" title="도로명" placeholder="도로명" readonly="readonly" id="addr2"  name="addr2" value="${list.addr2}"> 
												<input type="text" class="form-control" title="상세주소 입력 "
													placeholder="상세주소" id="addr3"  name="addr3"  value="${list.addr3 }" readonly="readonly">
											</p>

										</div>
									</td>
								</tr>
							
								<tr>
									<th>연락처</th>
									<td>
										<div class="tel-wrap mt05">
											<input type="tel" class="form-control" id="phonenumber" name="phonenumber" readonly="readonly"  value="${list.phonenumber }" > 
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<div class="email-wrap mt05">
											<input type="email" name="email" id="email" value="${list.email }"
												maxlength="40" class="form-control" readonly="readonly" >
										</div>
									</td>
								</tr>
							
							
						</table>
					</div>
					
				</form>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<%-- 
		<table>
			<th>
				<div class="form-group">
					<label for="nick">닉네임</label> <input type="text" id="nick"
						value="${list.nick }" class="txt form-control" readonly="readonly">
				</div>
				<br>

				<div class="form-group">
					<label for="tel">연락처</label> <input type="text" id="tel"
						value="${list.phonenumber }" class="txt form-control" readonly="readonly">
				</div>
				<br>

				<div class="form-group">
					<label for="email">이메일</label> 
					<input type="text" id="email"
						value="${list.email }" class="txt form-control" readonly="readonly">
				</div>
				<br>

				<div class="form-group">
					<label for="addr2">우편번호</label> 
					<input type="text" id="addrnumber"
						value="${list.addrnumber }" class="txt form-control" readonly="readonly">
						<label for="addr2">시/도</label> 
					<input type="text" id="addr1"
						value="${list.addr1 }" class="txt form-control" readonly="readonly">
						<label for="addr2">도로명주소</label> 
					<input type="text" id="addr2"
						value="${list.addr2 }" class="txt form-control" readonly="readonly">
						<label for="addr2">상세주소</label> 
					<input type="text" id="addr3"
						value="${list.addr3 }" class="txt form-control" readonly="readonly">
				</div>
				<br>
				
				<div id="modifyBtn" class="btn"><span class="noselect">회원정보 변경</span></div>

	
		</table>
		 --%>
		
		
		</div>

		</div>
	</div>


</div>
	
	<c:import url="footer.jsp"></c:import>
	<script src="js/scripts.js"></script>

</body>
</html>
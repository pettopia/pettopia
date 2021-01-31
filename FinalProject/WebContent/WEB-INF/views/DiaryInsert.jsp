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
<title>DiaryInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/DiaryInsert.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 메뉴 구성영역 -->
	<div>
		<c:import url="header.jsp"></c:import>
	</div>


	<div id="Diary" style="margin-top: 152px;">
	
		<p class="Diary_text">PET DIARY</p>
		<p class="Diary_text_small">나의 반려견을 등록하여 관리하고 공유해보세요!!</p>
		
		<div class="Diary_select">
			<div class="Diary_information"><a href="#">Information</a></div>
			<div class="Diary_start"><a href="Diary.jsp">Start</a></div>
		</div>

		<!-- 다이어리 생성 폼 -->
		<div id="InsertDiary">
			<p class="InsertDiary_text">반려견 등록하기</p>
			<form class="input form-inline" role="form">
				<table class="table" style="margin-top: 30px;">
					<tr>
						<th>반려견 이름</th>
						<th><input type="text" class="form-control"
							style="width: 500px;" name="petName"></th>
					</tr>

					<tr>
						<th>견종</th>
						<th><select class="form-control" style="width: 500px;">
								<option>진돗개</option>
								<option>푸들</option>
								<option>불독</option>
						</select></th>
					</tr>

					<tr>
						<th>성별</th>
						<th>남<input type="radio" name="sex"> 
						    여<input type="radio" name="sex">
						</th>
					</tr>
					
					<tr>
						<th>생일</th>
						<th><input type="date" class="form-control" placeholder="date input" style="width: 500px;"></th>
					</tr>
					
					<tr>
						<th>중성화</th>
						<th>
						유<input type="radio" name="Neutralization"> 
						무<input type="radio" name="Neutralization">
						</th>
					</tr>	
					
					<tr>
						<th>체중</th>
						<th><input type="text" class="form-control"></th>
					</tr>
					
					<tr>
						<th>사진</th>
						<th><input type="file" class="form-control"></th>
					</tr>
					
					<tr>
						<th>동물등록번호</th>
						<th><input type="text" class="form-control"
							style="width: 500px;">
						</th>
					</tr>
				</table>
				<div class="button">
				<button class="btn btn-success" style="width:300px; height:50px;">등록하기</button>
				<button class="btn btn-danger" style="width:300px; height:50px;">취소하기</button>
				</div>
				
			</form>
		</div>
		<!--end 다이어리 생성 폼 -->
	</div>
		<!-- end #Diary  -->
		
	<br><br><br>
	<div>
			<c:import url="footer.jsp"></c:import>
	</div>

	<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/scripts.js"></script>
</body>
</html>
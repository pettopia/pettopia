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
<title>DiaryInfo</title>
<link rel="stylesheet" type="text/css" href="css/DiaryInfo.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 메뉴 구성영역 -->
	<div>
		<c:import url="header.jsp"></c:import>
	</div>
	
	<!-- <div id="Diary" style="margin-top:152px;"> -->
	<div id="Diary">
		
		<p class="Diary_text">PET DIARY</p>
		<p class="Diary_text_small">나의 반려견을 등록하여 관리하고 공유해보세요!!</p>
		
		<div class="Diary_select">
			<div class="Diary_information"><a href="#">Information</a></div>
			<div class="Diary_start">

				<%
					//로그인 되어있을 때
					String code = null;
					if (session.getAttribute("id") != null)
					{
						code = (String) session.getAttribute("code");
				%>
					<a href="mypetdiary.action?code=<%=code%>">Start</a>
				<%
					}
					else
					{
				%>
					<a href="loginanddiary.action">Start</a>
				<%
					}
				%>
				
			</div>
		</div>
		
		<div class="Diary_coment">
			<p class="line1"></p>
			<p class="Diary_coment_text">" #.펫 다이어리가 필요한 이유 4가지"</p>
			<p class="line2"></p>
		</div>
		
		<div class="Diary_info1">
			<img src="images/Diary.jpg" style="width: 500px; height: 350px; float: left; margin: 20px 30px 20px 30px;">
			<div class="Diary_info_text">
			<p class="Diary_info1_text">"반려동물이 아프지 않고 오랫동안 함께 하기를 원한다면"</p>
			<p class="Diary_info1_text2">한 번도 병원에 가지 않고 튼튼하였으면 좋겠지만, 반려동물도 사람처럼 
			종합접종부터 예방접종까지 아프지 않도록 준비를 잘하여야 합니다.<br> 누적되지 않고 여기 저기 방치된 병력 히스토리를 
			한데 모을 수 있도록 만들어진 펫다이어리로 보다 효율적인 건강관리를 가능하게 합니다.</p>
			</div>
		</div>
		
		<div class="Diary_info2">
			<img src="images/Diary_info2.jpg" style="width: 500px; height: 350px; float: right; margin: 20px 30px 20px 30px;">
			<div class="Diary_info_text">
			<p class="Diary_info1_text">"함께하는 시간이 조금 더 색다른 추억들로 채워지기를<br> 원한다면"</p>
			<p class="Diary_info1_text2">그저 찍어 놓은 사진들만 정리하고 모아두는 것이 아니라, 
			펫토피아 다이어리 에서는 재미있는 추억을 만들 수 있도록 촬영 컨셉이나 스토리를 미션처럼 제시하여 새로운 경험이나 색다른 기회를 만들 수 있게
			제안을 합니다.그 속에서 반려동물과의 우연한 경험들과 함께 한다면 더욱 즐거운 우리들의 재미이지 않을까 생각됩니다</p>
			</div>
		</div>
		
		<div class="Diary_info3">
			<img src="images/Diary_info3.jpg" style="width: 500px; height: 350px; float: left; margin: 20px 30px 20px 30px;">
			<div class="Diary_info_text">
			<p class="Diary_info1_text">"반려동물이 아프지 않고 오랫동안 함께 하기를 원한다면"</p>
			<p class="Diary_info1_text2">한 번도 병원에 가지 않고 튼튼하였으면 좋겠지만, 반려동물도 사람처럼 
			종합접종부터 예방접종까지 아프지 않도록 준비를 잘하여야 합니다.<br> 누적되지 않고 여기 저기 방치된 병력 히스토리를 
			한데 모을 수 있도록 만들어진 펫다이어리로 보다 효율적인 건강관리를 가능하게 합니다.</p>
			</div>
		</div>
		
		<div class="Diary_info4">
			<img src="images/Diary_info1.jpg" style="width: 500px; height: 350px; float: right; margin: 20px 30px 20px 30px;">
			<div class="Diary_info_text">
			<p class="Diary_info1_text">"함께하는 시간이 조금 더 색다른 추억들로 채워지기를<br> 원한다면"</p>
			<p class="Diary_info1_text2">그저 찍어 놓은 사진들만 정리하고 모아두는 것이 아니라, 
			펫토피아 다이어리 에서는 재미있는 추억을 만들 수 있도록 촬영 컨셉이나 스토리를 미션처럼 제시하여 새로운 경험이나 색다른 기회를 만들 수 있게
			제안을 합니다.그 속에서 반려동물과의 우연한 경험들과 함께 한다면 더욱 즐거운 우리들의 재미이지 않을까 생각됩니다</p>
			</div>
		</div>
		
			
	</div>
	
	
	
	
<!-- 푸터 구성영역 -->
	<div>
		<c:import url="footer.jsp"></c:import>
	</div>



	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
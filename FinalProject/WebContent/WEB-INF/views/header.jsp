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
<title>menu.jsp</title>
<link rel="stylesheet" href="css/main_master.css">
<script src="https://kit.fontawesome.com/d0c252d761.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/scripts.js"></script>
<style type="text/css">
	ol, ul { margin-bottom: 0px; }
</style>



</head>
<body>

<header id="main-header">

		<nav class="header_inner">

			<div class="header_menu">
				<!--헤더 메뉴-->

				<div class="logo">
					<a href="main.action"> <img src="images/logo3.png" width="280"
						alt="Logo" id="logo">
					</a>
				</div>


				<!----검색버튼 누른후 회색 화면 -->
				<div id="myOverlay" class="overlay">


					<div class="overlay-content">
						<p class="closebtn" onclick="closeSearch()" title="Close Overlay">X</p>
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fas fa-search"></i>
						</button>


					</div>

				</div>
				<!----검색버튼 누른후 회색 화면 닫기-->



				<!-- 로그인 -->
            <ul class="head_btn">

               <%
                  //로그인 되어있을 때
               String id = null;
               String nick = null;
               String code= null;
               if (session.getAttribute("id") != null)
               {
                  id = (String) session.getAttribute("id");
                  nick = (String)session.getAttribute("nick");
                  code = (String)session.getAttribute("code");
               %>
               <li><a href="logout.action"> <span>로그아웃</span></a></li>


               <li><a href="mypage.action"> <span>마이페이지</span></a></li>
               <li><a href="#" onclick="window.open('inbox.action', '', 'width=700, height=600, top=100, left=300');"> <span>톡톡</span></a></li>
               <li><a href="javascript:void(0)" onclick="window.open('notify.action', '', 'width=600, height=500, top=300, left=400');"> <span>알림</span></a></li>
               <li><a href="#"> <span><%=nick%></span></a></li>
               <%
                  } else
               {
               %>
               <li><a href="checkjoin.action"> <span>회원가입</span></a></li>
               <li><a href="loginform.action"> <span>로그인</span></a></li>

               <%
                  }
               %>
               <li class="button">
                  <button class="openBtn" onclick="openSearch()">
                     <i class="fas fa-search"></i>
                  </button>

               </li>
            </ul>
            <!-- 로그인 닫기-->




				<!-- 서브메뉴 -->
				<ul class="head_sub">

					<li><a href="help.action"> <span>고객센터</span></a></li>
					<li><a href="board.action"> <span>자유 게시판</span></a></li>
					<li><a href="petsitter.action"> <span>펫시터 찾기</span></a></li>
					<li><a href="petdiary.action"> <span>펫 다이어리</span></a></li>
					<% if (session.getAttribute("id") != null)
						{
	                  code = (String) session.getAttribute("code"); 
	                %>
	                  <li><a href="walklist.action"> <span>강아지 산책</span></a></li>
	                  <% } else
	                     {
	                  %>
	                  <li><a href="loginform.action"> <span>강아지 산책</span></a></li>
	                  
	                  <%
	                     }
	                  %>
				</ul>
				<!-- 서브메뉴 닫기-->


			</div>
			<!--헤드인-->
			<!--헤더 메뉴닫기-->
			<!--헤더닫기-->

		</nav>
	</header>

	<body>
		<div id="msgStack"></div>
	</body>

</body>
</html>
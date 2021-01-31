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
<title>고객센터 | 공지사항</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

</head>
<body>

	<div id="wrap"><!-- 바디 전체 -->
		
		<div class="header" style="background-color: #ccc; height: 100px;">
			헤더 영역
		</div>

		<div id="container">
			<!-- 게시판 공통사항 -->
			<div class="div_inner">
				<div class="contents_wrap">
					<!-- 게시글 -->
					<h1 class="con_title">
						공지사항
						<span class="con_title_btn">
							<a href="#a" class="back_btn" style="width:56px; text-align:center;">목록</a>
						</span>
					</h1>
					
					<p class="qs_title" style="margin-top:30px">
						<em class="notice_icon"><img src="<%=cp%>/img/notice.png"></em>
						<span>연휴 고객센터 운영 중단 안내</span>
					</p>
					<div class="qs_info_wrap">
						<div class="qs_info">
							<p><img src="<%=cp%>/img/eye_cnt.png">123</p>
							<p class="last"><img src="<%=cp%>/img/date_cnt.png">2020.12.23</p>
						</div><!-- .qs_info end -->
					</div><!-- .qs_info_wrap end --> 
					
					<div class="qs_text">
						<p>안녕하세요.</p>
						<p>펫토피아 운영관리팀입니다.</p>
						<p>크리스마스 연휴 기간(2020.12.25 09:00 ~ 2020.12.27 18:00) 동안</p>
						<p>고객센터 통화 품질 향상을 위한 서비스 점검이 있을 예정입니다.</p>
						<p>점검 기간동안 불편을 드려 죄송합니다.</p>
						<p><br></p>
						<p>서비스 이용에 대한 긴급한 문의 사항은 master@petopia.com 으로 메일 주시면</p>
						<p>신속하게 처리해드리겠습니다.</p>
						<p><br></p>
						<p>감사합니다</p>
						<p><br></p>
						<p><br></p>
						<p><br></p>
					</div>
					
					<div class="page_move">
						<ul>
							<li>
								<span class="page_move_btn">
									<a href="#a"><img src="<%=cp%>/img/page_up.png">이전글</a>
								</span>
								<p class="notice_title">
									이전글이 없습니다.
								</p>
							</li>
							<li>
								<span class="page_move_btn">
									<a href="#a"><img src="<%=cp%>/img/page_down.png">다음글</a>
								</span>
								<p class="notice_title">
									<a href="#a">모임 에티켓 안내</a>
								</p>
								<ul class="page_move_info">
									<li><img src="<%=cp%>/img/date_cnt.png"><span>2020.12.22</span></li>
								</ul>
							</li>
						</ul>
					
					</div><!-- .page_move end -->
	
				</div><!-- .contents_wrap end -->
				
				
				
				<div class="right_aside">
					<!-- 우측 사이드 -->
					
					<div class="side_board_info">
						<h2>
							공지사항
							<span class="side_more_btn">
								<a href="#a">
									<img src="<%=cp%>/img/side_board_more_on.png">
								</a>
							</span>
						</h2>
						
						<ul class="side_board_wrap">
							<li><a href="#a"><span class="color1">공지</span>연휴 고객센터 운영 중단 안내</li>
							<li><a href="#a"><span class="color1">공지</span>모임 에티켓 안내</li>
							<li><a href="#a"><span class="color1">공지</span>로그인 문제 해결방법을 확인해보세요</li>
							<li><a href="#a"><span class="color1">공지</span>12/24(목) 03:00~05:00 서버점검 안내</li>
							<li><a href="#a"><span class="color1">공지</span>테스트 서비스 운영기간 안내</li>
						</ul>
						
						<div class="side_banner_wrap">
							<div class="side_bn_img_wrap">
								<ul>
									<li><a href="#a" target="_black"><img src="<%=cp%>/img/ad_img3.png"></a></li>
								</ul>
							</div>
							<div class="side_bn_txt">
								<p id="event_current_text">
									<span style="display: block;">new! 애견샴푸</span>
								</p>
								<!-- 
								<div class="side_bn_control">
								
								</div>
								-->
							</div>
						</div>
					</div>
				</div>
				
			</div>

		</div>

		<div id="footer" style="background-color: darkGray;">
			<div class="div_inner">
				<div class="footer_info">
					<ul>
						<li>프로젝트소개</li>
						<li>이용약관</li>
						<li>사이트맵</li>
					</ul>
					<br>
					<p>
						<span>펫토피아</span>
						<span style="margin-left:5px;">강정우 김보경 박민하 박해진 정의진</span><br>
						<span>쌍용강북교육센터</span>
						<span style="margin-left:5px;">서울 마포구 월드컵북로 21 2층 풍성빌딩(서교동 447-5)</span>
					</p>
					<br>
					<span class="copyright">ⓒ 펫토피아 All Rights Reserved.</span>
				</div><!-- .footer_info end -->
			</div><!-- .div_inner end -->

		</div><!-- #footer end -->

	</div>

</body>
</html>
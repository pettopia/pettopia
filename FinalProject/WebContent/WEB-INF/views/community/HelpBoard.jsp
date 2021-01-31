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
<title>고객센터 | 문의하기</title>

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
						문의하기
					</h1>
					
					<div>
						<form action="">
							<table class="table">
								<colgroup>
									<col style="width:13%">
									<col style="width:37%">
									<col style="width:12%">
									<col style="width:38%">
								</colgroup>
								<tbody>
									<tr id="sessionlogin">
										<th>ID</th>
										<td><span id="loginid">h**r524</span></td>
										<th>닉네임</th>
										<td><span id="loginname">꿀비누나</span></td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">
											<input type="text" style="width:631px" class="form-control" id="title">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<textarea style="width:631px;height:150px" class="form-control"></textarea>
										</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="3">
											<div class="file_sch">
												<input type="file" style="width:100%" class="form-control" id="my_file" name id="my_file" accept=".gif, .jpeg, .jpg, .png, .bmp, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .csv, .html, .htm, .7z, .zip, .pdf, .txt, .hwp">
											</div>
											<div class="file_del_list">
												<select id="fileList" size="4" title="첨부파일 목록" class="list_add">
												</select>
												<a href="javascript:void(0)" title="첨부파일 삭제" id="fileDelete">
													<img src="<%=cp%>/img/delete_file.png" align="right">
												</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div class="btn_zone">
								<a href="javascript:void(0)" id="bt_inquiry"><img src="<%=cp%>/img/help_btn.gif"></a>
								<a href="javascript:void(0)" id="bt_inquiry_cancel"><img src="<%=cp%>/img/help_cancel.gif"></a>
							</div>
							
						</form>
					
					</div><!-- .help_tbl_common help_tbl_style01 end -->
					
					
					
					
					<!-- 
					<span class="write">
						<a class="btn02" href="/create">글작성</a>
						<a class="btn02" href="javascript:void(0)" onclick="alert('로그인이 필요합니다.')">글작성</a>
					</span>
					-->
					
					
					
	
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
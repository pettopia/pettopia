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
<title>자유게시판</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/board.css">
<link rel="stylesheet" href="css/main_master.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
	var code = "<%=(String)session.getAttribute("code") %>";
	
	$().ready(function()
	{
		$(".create").click(function()
		{
			if(code == 'null')
			{
				alert("로그인이 필요합니다.");
				return;
			}
			
			$(location).attr("href", "boardinsertform.action");
		});
	});

</script>

</head>
<body>

	<div id="wrap"><!-- 바디 전체 -->
		
		<!-- 헤더 영역 -->
		<div id="header">
			<c:import url="header.jsp"></c:import>
		</div>

		<div id="container">
			
			<!-- 게시판 공통사항 -->
			<div class="div_inner">
				<div class="contents_wrap">
					<!-- 게시글 -->
					<h1 class="con_title">
						자유게시판
						<div class="board_search_wrap" style="float:right; margin-right:0px">
							<span class="word_input" style="margin-top:0;"> 
								<input type="text" name="search_text" class> 
								<span class="btn"> 
									<a href="#a">
										<img src="<%=cp%>/img/search_btn.png"></a>
								</span>
							</span>
							
							<span class="sort_wrap" style="margin-top:0;"> 
								<select name="search_type">
									<option value="title">제목</option>
									<option value="name">작성자</option>
									<option value="titleAndContent">제목+내용</option>
								</select>
							</span> 
							<span class="sort_wrap" style="margin-top:0;">
								<select name="head_code">
									<option value="0">전체</option>
									<c:forEach var="head" items="${headList }">									
									<option value="${head.code }">${head.content }</option>
									</c:forEach>
								</select>
							</span> 
						</div>
						
						
					</h1>
					
					<div class="board">
					<ul>
						<c:forEach var="board" items="${boardList }">
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[${board.head }]</span>
									<a href="boardcontent.action?board_code=${board.board_code }" class="etc">
										<span class="title">${board.title }</span>
										<c:if test="${board.reply_count>0 }">
										<em>(${board.reply_count })</em>
										</c:if>
									</a>
									
									<c:if test="${board.date_check == '1' }">
									<img class="new" src="<%=cp %>/img/new.png">
									</c:if>
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">${board.nick }</a>
								</span>
								<ul>
									<li class="like_cnt"><img src="<%=cp %>/img/like_cnt.png">${board.hit }</li>
									<li class="date_cnt"><img src="<%=cp %>/img/date_cnt.png">${board.reg_date }</li>
									<li class="eye_cnt"><img src="<%=cp %>/img/eye_cnt.png">${board.view_num }</li>
								</ul>
							</div>
						</li>
						</c:forEach>
						<%-- 
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[일상]</span>
									<span class="title">우리 바비 보고가세용</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">babiluv</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[일상]</span>
									<span class="title">다들 글 쓰실 때 조심하세여ㅠㅠ</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">핑키엄마</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[묻고답하기]</span>
									<span class="title">산책하기 싫은건가요??</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">두부맘</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[묻고답하기]</span>
									<span class="title">강아지 마취</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">하이루</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[후기]</span>
									<span class="title">흡수패드 추천 : 여러 패드 사용 후기</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">콩이땅이</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[꿀팁 정보]</span>
									<span class="title">산책 준비 전 필수사항 꿀팁</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">오지오지</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[후기]</span>
									<span class="title">포메 곰돌이컷 후기~♡</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">딸랑구</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[묻고답하기]</span>
									<span class="title">강아지 처음 키워보는데..</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">rnlcksgdk</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[일상]</span>
									<span class="title">첫 생일파티 했어요ㅎㅎ</span>
									<img class="new" src="<%=cp %>/img/new.png">
								</a>
							</p>
							<div class="board_other_info">
								<span class="user_name"> <a href="">꿀비누나</a>
								</span>
								<ul>
									<li class="like_cnt">0</li>
									<li class="date_cnt">2020.12.25</li>
									<li class="eye_cnt">20</li>
								</ul>
							</div>
						</li>
						--%>
					</ul>
					
					<span class="write">
						<a class="btn02 create" href="javascript:void(0);">글작성</a>
						<!-- <a class="btn02" href="" onclick="alert('로그인이 필요합니다.')">글작성</a> -->
					</span>
					
					
					<div class="page_num">
						<!-- 게시글 페이징 -->
						<span class="all_prev">
							<a>
								<img src="<%=cp%>/img/all_prev.png">
							</a>
						</span>
						<span class="prev">
							<a>
								<img src="<%=cp%>/img/prev.png">
							</a>
						</span>
						<a class="active">1</a>
						<a href="#a">2</a>
						<a href="#a">3</a>
						<a href="#a">4</a>
						<a href="#a">5</a>
						<a href="#a">6</a>
						<a href="#a">7</a>
						<a href="#a">8</a>
						<a href="#a">9</a>
						<a href="#a">10</a>
						<span class="next">
							<a href="#a">
								<!-- 현재 페이지 +1 -->
								<img src="<%=cp%>/img/next.png">
							</a>
						</span>
						<span class="all_next">
							<a href="#a">
								<!-- 마지막 페이지 -->
								<img src="<%=cp%>/img/all_next.png">
							</a>
						</span>
		
					</div><!-- .page_num end -->
					
				</div><!-- .board end -->
	
				</div><!-- .contents_wrap end -->
				
				
			</div>

		</div>

		<!-- 푸터 영역 -->
		<div>
			<c:import url="footer.jsp"></c:import>
		</div>
		<script src="js/jquery-3.1.1.min.js"></script>
   		<script src="js/scripts.js"></script>
	</div>

</body>
</html>
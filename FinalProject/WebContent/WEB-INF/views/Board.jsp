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
	var search_text = "<%=(String)request.getParameter("search_text")%>";
	
	$().ready(function()
	{
		//검색 정보 가리기
		$(".search_info").css("display","none");
		
		//검색했을 경우 검색 정보 노출
		if(search_text != 'null' && search_text != "")
		{
			$(".search_info").css("display","block");			
		}
		
		// 검색 버튼 클릭 액션
		$(".search").click(function()
		{
			$(location).attr("href","board.action?search_type=" + $("#search_type").val() +"&head_code=" + $("#head_code").val() + "&search_text=" + $("#search_text").val());
			
		});
		
		// 글 작성 버튼 클릭 액션
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
	
	//검색창 input 태그 엔터 액션
	function search()
	{
		if(event.keyCode==13)
		{
			$(".search").trigger("click");
		}
	}

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
								<input type="text" name="search_text" id="search_text" value="${search_text }"
								onKeypress="search()"> 
								<span class="btn"> 
									<a href="javascript:void(0);" class="search">
										<img src="<%=cp%>/img/search_btn.png"></a>
								</span>
							</span>
							
							<span class="sort_wrap" style="margin-top:0;"> 
								<select name="search_type" id="search_type">
									<option value="title" ${search_type == 'title'? "selected=\"selected\"" : "" }>제목</option>
									<option value="nick" ${search_type == 'nick'? "selected=\"selected\"" : "" }>작성자</option>
									<option value="titleAndContent" ${search_type == 'titleAndContent'? "selected=\"selected\"" : "" }>제목+내용</option>
								</select>
							</span> 
							<span class="sort_wrap" style="margin-top:0;">
								<select name="head_code" id="head_code">
									<option value="0">전체</option>
									<c:forEach var="head" items="${headList }">									
									<option value="${head.code }" ${head_code == head.code? "selected=\"selected\"" : "" }>${head.content }</option>
									</c:forEach>
								</select>
							</span> 
						</div>
						
						
					</h1>
					
					<div class="search_info" style="margin-top:0; margin-bottom:30px; display: none">
						<span>'${search_text }'</span>
						(으)로 검색한 결과입니다.
					</div>
					
					<div class="board">
					<ul>
						<c:forEach var="board" items="${boardList }">
						<li>
							<p class="list_title">
								<a href="#a" style="color: rgb(51, 51, 51);"><span class="category">[${board.head }]</span>
									<a href="boardcontent.action?${board.param }" class="etc">
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
									<li class="like_cnt">${board.hit }</li>
									<li class="date_cnt">${board.reg_date }</li>
									<li class="eye_cnt">${board.view_num }</li>
								</ul>
							</div>
						</li>
						</c:forEach>
						
					</ul>
					
					<span class="write">
						<a class="btn02 create" href="javascript:void(0);">글작성</a>
						<!-- <a class="btn02" href="" onclick="alert('로그인이 필요합니다.')">글작성</a> -->
					</span>
					
					
					<div class="page_num">
						<!-- 게시글 페이징 -->
						
						${pageIndexList }
						
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
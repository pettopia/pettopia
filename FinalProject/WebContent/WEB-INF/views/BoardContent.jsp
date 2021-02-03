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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">
	a { text-decoration: none !important; }
	a:hover { text-decoration: none !important; }
</style>
					
<script type="text/javascript">

	$().ready(function()
	{		
		// 게시글 삭제 버튼 클릭
		$(".delete").click(function()
		{
			if(confirm("삭제하면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?"))
				$("#frmDelete").submit();
			else
				return;
		});
		// 게시글 신고 버튼 클릭
		
		// 댓글 신고 버튼 클릭
		$(".report").click(function()
		{
			if($("#member_code").val() == null)
			{
				alert("로그인이 필요합니다.");
				return;
			}
			
			window.open("replyreport.action?reply_code="+'${reply.reply_code}', "", "width=750, height=600, top=300, left=400");
		});
		
		// 댓글 등록 버튼 클릭
		$(".reply_submit").click(function()
		{
			if($("#member_code").val() == null)
			{
				alert("로그인이 필요합니다.");
				return;
			}
			else if($("#content").val() == null || $("#content").val() == "")
			{
				alert("내용을 입력해주세요");
				return;
			}
			
			$("#reply").submit();
			
		});
		// 본인 댓글 삭제 버튼 클릭
		$(".delete_reply").click(function()
		{
			if (confirm("정말 삭제하시겠습니까?"))
				$("#delete_reply").submit();
			else
				return;
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
						<span class="con_title_btn">
							<a href="board.action" class="back_btn" style="width:56px; text-align:center;">목록</a>
						</span>
					</h1>
					
					<p class="qs_title" style="margin-top:30px">
						<em>[${content.head }]</em>
						<span>${content.title }</span>
					</p>
					<div class="qs_info_wrap">
						<span class="qs_id">
							<a href="#a">${content.nick}</a>
						</span>
						<div class="qs_info">
							<p><img src="<%=cp%>/img/eye_cnt.png">${content.view_num }</p>
							<p class="lastdate"><img src="<%=cp%>/img/date_cnt.png">${content.reg_date }</p>
							<a href="#a">
								<img src="<%=cp%>/img/report_btn.png" style="margin-right: 20px;">
							</a>
						</div><!-- .qs_info end -->
					</div><!-- .qs_info_wrap end --> 
					
					<div class="qs_text" style="white-space: pre-line;">
						${content.content }
					</div>
					<div class="qs_empathy_wrap">
						<div class="empathy_info">
							<a href="#a"><img src="<%=cp%>/img/empathy_btn_off.png"></a>
							<p><a href="javascript:void(0)"><span class="recomref">${content.hit }</span>&nbsp;명</a></p>
						</div>
						<form id="frmRecommend" method="post" action=""></form>
						<!-- action="/Community/Free/211483/recommend" -->
					</div>
					
					
					<div class="qs_btn">
						<!-- 내가 작성한 글일때, 수정 삭제 버튼 -->
						<c:if test="${content.member_code == code }">
						<ul>
							<li><a href="boardupdateform.action?board_code=${content.board_code }"><img src="<%=cp%>/img/modify_btn.png"></a></li>
							<li><a href="javascript:void(0)" class="delete"><img src="<%=cp%>/img/delete_btn.png"></a></li>
							<form id="frmDelete" method="post" action="boarddelete.action">
								<input type="hidden" name="board_code" value="${content.board_code }">
							</form>
						</ul>
						</c:if>
					</div><!-- .qs_btn end -->
					
					
						
					<div class="reply_wrap">
						<!-- 리플 -->
						
						<div class="reply_title">
							<h2>
								댓글
								<span>${content.reply_count }</span>	
							</h2>
						</div>
						<input type="hidden" name="comment_page" value="1">
						<ul class="reply_ul">
							<!-- 댓글 -->
							<c:forEach var="reply" items="${replyList }">
							<li>
								<div class="reply">
									<input type="hidden" id="reply_code" value="${reply.reply_code }">
									<p class="common_id">
										<a href="#a">${reply.nick }</a>
										<span>${reply.reg_date } </span>
									</p>
									<!-- 댓글 관련 버튼 -->
									<ul class="reply_btn_wrap">
										<c:if test="${reply.member_code == code }">
										<li><a href="javascript:void(0)" class="modify_reply">수정</a></li>
										<li>
											<a href="javascript:void(0)" class="delete_reply">삭제</a>
											<form action="replydelete.action" method="post" id="delete_reply">
												<input type="hidden" name="reply_code" value="${reply.reply_code }">
												<input type="hidden" name="board_code" value="${content.board_code }">
											</form>
										</li>
										</c:if>
										<li class="report">
											<a href="javascript:void(0);"><img src="<%=cp%>/img/report_btn.png"></a>
										</li>
									</ul>
									<!-- 댓글 내용 -->
									<div class="reply_text" style="white-space: pre-line;">
										${reply.content }
									</div>									
								</div>
							</li>
							</c:forEach>
						</ul>
						
					</div><!-- /reply_wrap end -->
					
					<div class="page_numb2">
						<!-- 리플 페이징 처리 -->
						<span class="cm_prev">
							<a><img src="<%=cp%>/img/re_prev_off.png"></a>
						</span>
						<a class="active">1</a>
						<span class="cm_next">
							<a><img src="<%=cp%>/img/re_next_off.png"></a>
						</span>
						
						
					</div>
					
					<div class="bottom_txar_wrap">
						<!-- 댓글 등록 -->
						<form action="replyinsert.action" method="post" id="reply">
							<input type="hidden" name="board_code" value="${content.board_code }">
							<input type="hidden" id="member_code" name="member_code" value="${code }">
							<div class="bottom_txar ctracker">
								<textarea name="content" id="content" rows="10" cols="30" class="txar"></textarea>
								<div class="bottom_txar_btn">
									<div class="txar_right_btn">
										<span class="glist_number">(<em>0</em>/200)</span>
										<span><a class="btn01_g reply_submit" href="javascript:void(0)">등록</a></span>
									</div>
								</div>
							</div>
						</form>
					
					</div><!-- .bottom_txar_wrap end -->
					
					<div class="page_move">
						<ul>
							<li>
								<span class="page_move_btn">
									<c:if test="${before != null}">
									<a href="boardcontent.action?${before.param }"><img src="<%=cp%>/img/page_up.png">이전글</a>
									</c:if>
									<c:if test="${before == null}">
									<a href="javascript:void(0)"><img src="<%=cp%>/img/page_up.png">이전글</a>
									</c:if>
								</span>
								
								<p class="title">
									<span>
										<c:if test="${before != null}">
										<a href="boardcontent.action?${before.param }">[${before.head }]</a>
										</c:if>
									</span>
									
									<c:if test="${before != null}">
									<a href="boardcontent.action?${before.param }">${before.title }</a>
									</c:if>
									<c:if test="${before == null}">
									이전글이 없습니다.
									</c:if>
									
									<c:if test="${before != null}">
									<ul class="page_move_info">
										<li><img src="<%=cp%>/img/date_cnt.png">${before.reg_date }</li>
									</ul>
									</c:if>
								</p>
							</li>
							<li>
								<span class="page_move_btn">
									<c:if test="${next != null}">
									<a href="boardcontent.action?${next.param }"><img src="<%=cp%>/img/page_down.png">다음글</a>
									</c:if>
									<c:if test="${next == null}">
									<a href="javascript:void(0)"><img src="<%=cp%>/img/page_down.png">다음글</a>
									</c:if>
								</span>
								
								<p class="title">
									<span>
										<c:if test="${next != null}">
										<a href="boardcontent.action?${next.param }">[${next.head }]</a>
										</c:if>
									</span>
									
									<c:if test="${next != null}">
									<a href="boardcontent.action?${next.param }">${next.title }</a>
									</c:if>
									<c:if test="${next == null}">
									다음글이 없습니다.
									</c:if>
									
									<c:if test="${next != null}">
									<ul class="page_move_info">
										<li><img src="<%=cp%>/img/date_cnt.png">${next.reg_date }</li>
									</ul>
									</c:if>
								</p>
							</li>
						</ul>
					
					</div><!-- .page_move end -->
	
				</div><!-- .contents_wrap end -->
				
				
			</div>

		</div>


		<!-- 푸터 영역 -->
		<div>
			<c:import url="footer.jsp"></c:import>
		</div>

	</div>

</body>
</html>
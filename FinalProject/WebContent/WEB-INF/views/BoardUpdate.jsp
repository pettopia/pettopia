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
<title>게시판 | 글쓰기</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 게시판 에디터 ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>

<script type="text/javascript">

	$().ready(function()
	{
		// 작성 취소 버튼 클릭 액션
		$(".writeCancel").click(function()
		{
			if (confirm("작성을 취소하시겠습니까?"))
			{
				$(location).attr("href", "board.action");
			}
			else
				return;
		});
		
		// 작성 완료 버튼 클릭 액션
		$("#btnWrite").click(function()
		{
			if ($("#head_code").val() == 0)
			{
				alert("말머리를 선택해주세요.");
				return;
			}
			if($("#title").val() == "" || $("#title").val() == null)
			{
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
			}
			if($("#content").val() == "" || $("#content").val() == null)
			{
				alert("내용을 입력해주세요.");
				$("#content").focus();
				return;
			}			
			
			$("#frmCreate").submit();
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
					</h1>
					
					<div id="textEditorFrame">
						<form id="frmCreate" method="post" action="boardupdate.action">
							<input type="hidden" id="board_code" name="board_code" value="${content.board_code}">
							<input type="hidden" name="member_code" value="${code}">
							<div class="title_wrap form-inline">
								<div class="select_wrap" style="margin-left:27px; margin-top:13px;">
									<select id="head_code" name="head_code" class="form-control">
										<option value="0">말머리 선택</option>
										<c:forEach var="head" items="${headList }">
										<option value="${head.code }" ${content.head_code==head.code ? "selected=\"selected\"" : "" }>
											${head.content }</option>
										</c:forEach>
									</select>
								</div>
								<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요."
								value="${content.title }" style="margin-left:27px; margin-top:13px; width: 730px;">
							</div><!-- .title_wrap end -->
							
							<div class="write_form_wrap"> 
								<div class="editor_sec">
									<div class="edSec">
					                    <div class="edWSec">
					                        <textarea class="editWindow" name="content" id="content" rows="9" cols="40">${content.content }</textarea>
					                        <script type ="text/javascript">
									            CKEDITOR.replace("content");
									        </script>
					                    </div>
									</div><!-- .edSec end -->									
									
								</div><!-- .editor_sec end -->
							</div><!-- .write_form_wrap end -->
							
					        <div class="btn_wrap">
					            <a href="javascript:void(0)" role="button" class="btn03_g writeCancel">취소</a>
					            <a href="javascript:void(0)" role="button" id="btnWrite" class="btn03_b">등록</a>
					        </div>
        
						</form>
	
					</div><!-- #textEditorFrame end -->
	
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
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
<title>관리자 | 메인</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	a { 
		text-decoration: none;
	}
	.content td>a { color: #282828; }
	table, th, td
	{
		text-align: center;
	}
	/* h3 { margin-top: 100px; } */
	.left_side
	{
		width: 200px;
		height: 100%;
    	float: left;
    	left: 0px;
    	position: fixed;
    	background-color: white;
    	margin-left: 20px;
    	margin-top: 40px;
	}
	#header
	{
		width: 100%;
		height: 100px;
    	left: 0px;
    	background-color: #white;
    	position: fixed;
    	z-index: 100;
	}
	.footer
	{
		width: 100%;
		height: 100px;
    	left: 0px;
    	background-color: #ccc;
	}
	.container
	{
		width:1300px;
		display: inline-flex;
		margin-top: 100px;
	}
	.content
	{
		margin-left: 220px;
    	margin-top: 40px;
	}
	#tbl1 td:nth-child(7), #tbl2 td:nth-child(8), #tbl3 td:nth-child(8), #tbl4 td:nth-child(8)
	{
		padding-top: 3px;
		padding-bottom: 3px;
		vertical-align: middle;
	}
	.bookmark { 
		margin-bottom: 150px;
		width: 0;
	}
</style>

<script type="text/javascript">

	$().ready(function()
	{
		$(".reload").click(function()
		{
			window.location.reload(true);
		});
	});

</script>

</head>
<body>

<div id="header">
	<c:import url="AdminHeader.jsp"></c:import>
</div>



<div class="container">
<%-- 	<div class="left_side">
		<c:import url="AdminLeftSide.jsp"></c:import>
	</div><!-- .left_side end --> --%>
	
	<div class="content">
		<h1>관리자 메인</h1>
		
		<div>
			<h3>신규 가입회원 목록 <small>${today }</small></h3>
			<p>총 회원수 : ${totMember }명  /  가입 : ${todayNewMember }명  /  탈퇴 : ${todayWithdrawMember }명</p>
			<p>
				<span style="color: gray;">업데이트 시간 :  ${updateTime }</span>
				<a href="javascript:void(0);" class="glyphicon glyphicon-refresh reload" style="margin-left: 10px;"></a>
			</p>
			<table class="table">
				<tr>
					<th></th>
					<th>회원등록코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>주민번호</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>주소</th>
				</tr>
				<c:if test="${todayNewMember == 0}">
					<tr><td colspan="9" style="text-align: center;">오늘 가입한 회원이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="newMember" items="${newMemberList }">
				<tr>
					<td>${newMember.num }</td>
					<td>${newMember.code }</td>
					<td><a href="javascript:void(0)" role="button" onclick="window.open('userinfodetail.action?id=${newMember.id }', '', 'width=600, height=720, top=300, left=400')">${newMember.id }</a></td>
					<td>${newMember.nick }</td>
					<td>${newMember.ssn }</td>
					<td>${newMember.tel }</td>
					<td>${newMember.email }</td>
					<td>${newMember.addr }</td>
				</tr>
				</c:forEach>
			</table>
			<a href="#a" class="btn btn-default" role="button">전체 회원 보기</a>
		</div>
		
		<div id="petsitter" class="bookmark"></div>
		
		<div>
			<h3>펫시터 신청 목록 <small>${today }</small></h3>
			<p>
				<span style="color: gray;">업데이트 시간 :  ${updateTime }</span>
				<a href="javascript:void(0);" class="glyphicon glyphicon-refresh reload" style="margin-left: 10px;"></a>
			</p>
			<table class="table" id="tbl1">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>펫시터신청코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>심사결과</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				
				<c:forEach var="petsitter" items="${petsitterRegList }">
				<tr>
					<th><input type="checkbox"></th>
					<td>${petsitter.num }</td>
					<td>${petsitter.reqcode }</td>
					<td><a href="javascript:void(0)" role="button" onclick="window.open('userinfodetail.action?id=${petsitter.id }', '', 'width=600, height=720, top=300, left=400')">${petsitter.id }</a></td>
					<td>${petsitter.nick }</td>
					<td>${petsitter.age }세</td>
					
					<c:if test="${petsitter.state == '처리하기'}">
					<td><a href="javascript:void(0)" class="btn btn-default" role="button"	onclick="window.open('psreqinfodetail.action?reqcode=${petsitter.reqcode }', '', 'width=750, height=600, top=300, left=400')">처리하기</a></td>
					<td>-</td>
					<td>-</td>
					</c:if>
					<c:if test="${petsitter.state == '반려'}">
					<td><a href="javascript:void(0);" role="button" onclick="window.open('psrefinfodetail.action?reqcode=${petsitter.reqcode}', '', 'width=750, height=600, top=300, left=400');">거절(사유)</a></td>
					<td>${petsitter.disapproval_date }</td>
					<td>${petsitter.disapproval_mg }</td>
					</c:if>
					<c:if test="${petsitter.state == '승인'}">
					<td><a href="javascript:void(0);" role="button" onclick="window.open('petsitterdetail.action?reqcode=${petsitter.reqcode }', '', 'width=750, height=600, top=300, left=400')">승인</a></td>
					<td>${petsitter.approval_date }</td>
					<td>${petsitter.approval_mg }</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<a href="#a" class="btn btn-default" role="button">신청내역 전체보기</a>
		</div>
	
		<div id="user" class="bookmark"></div>
		
		<div>
			<h3>회원 신고 접수 내역 <small>${today }</small></h3>
			<p>
				<span style="color: gray;">업데이트 시간 :  ${updateTime }</span>
				<a href="javascript:void(0);" class="glyphicon glyphicon-refresh reload" style="margin-left: 10px;"></a>
			</p>
			<table class="table" id="tbl2">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>접수코드</th>
					<th>신고받은ID</th>
					<th style="width: 150px;">신고내용</th>
					<th>신고자ID</th>
					<th>신고일시</th>
					<th>처리결과</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				<c:forEach var="member" items="${memberReportRegList}">
				<tr>
					<td><input type="checkbox"></td>
					<td>${member.num }</td>
					<td>${member.code }</td>
					<td><a href="javascript:void(0)" role="button" onclick="window.open('userinfodetail.action?id=${member.defendantId }', '', 'width=600, height=720, top=300, left=400')">${member.defendantId }</a></td>
					<td>${member.reason }</td>
					<td><a href="javascript:void(0)" role="button" onclick="window.open('userinfodetail.action?id=${member.declarantId }', '', 'width=600, height=720, top=300, left=400')">${member.declarantId }</a></td>
					<td>${member.report_date }</td>
					
					<c:if test="${member.state == '승인' }">
					<td><a href="javascript:void(0)" role="button" onclick="window.open('uswarningdetail.action?code=${member.code }', '', 'width=750, height=600, top=300, left=400');">처리완료</a></td> 
					<td>${member.reg_date }</td>
					<td>${member.reg_mg }</td>
					</c:if>
					<c:if test="${member.state == '반려' }">
					<td><a href="javascript:void(0)" role="button" onclick="window.open('usreportrefdetail?code=${member.code }', '', 'width=750, height=600, top=300, left=400');">제재불가(사유)</a></td>
					<td>${member.ref_date }</td>
					<td>${member.ref_mg }</td>
					</c:if>
					<c:if test="${member.state == '처리하기' }">
					<td><a href="javascript:void(0)" class="btn btn-default" role="button" onclick="window.open('userreportdetail.action?code=${member.code }', '', 'width=750, height=600, top=300, left=400')">처리하기</a></td>
					<td>-</td>
					<td>-</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<a href="#a" class="btn btn-default" role="button">접수내역 전체보기</a>
		</div>
		
		<div id="contents" class="bookmark"></div>
		
		<div>
			<h3>게시글 신고 접수 내역 <small>${today }</small></h3>
			<p>
				<span style="color: gray;">업데이트 시간 :  ${updateTime }</span>
				<a href="javascript:void(0);" class="glyphicon glyphicon-refresh reload" style="margin-left: 10px;"></a>
			</p>
			<table class="table" id="tbl2">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>접수코드</th>
					<th>게시글코드</th>
					<th style="width: 150px;">신고내용</th>
					<th>신고자ID</th>
					<th>신고일시</th>
					<th>처리결과</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				<c:forEach var="board" items="${boardReportRegList }">
				<tr>
					<td><input type="checkbox"></td>
					<td>${board.num }</td>
					<td>${board.code }</td>
					<td><a href="#a">${board.board_code }</a></td>
					<td>${board.reason }</td>
					<td><a href="javascript:void(0)" role="button" onclick="window.open('userinfodetail.action?id=${board.declarantId }', '', 'width=600, height=720, top=300, left=400')">${board.declarantId }</a></td>
					<td>${board.report_date }</td>
					<c:if test="${board.state == '승인' }">
					<td><a href="javascript:void(0)" role="button" onclick="window.open('contentsblind.action?code=${board.code}', '', 'width=750, height=600, top=300, left=400');">처리완료</a></td>
					<td>${board.blind_date }</td>
					<td>${board.blind_mg }</td>
					</c:if>
					<c:if test="${board.state == '반려' }">
					<td><a href="javascript:void(0)" role="button" onclick="window.open('contentsreportrefdetail.action?code=${board.code}', '', 'width=750, height=600, top=300, left=400');">제재불가(사유)</a></td>
					<td>${board.ref_date }</td>
					<td>${board.ref_mg }</td>
					</c:if>
					<c:if test="${board.state == '처리하기' }">
					<td><a href="javascript:void(0)" class="btn btn-default" role="button" onclick="window.open('contentsreportdetail.action?code=${board.code }', '', 'width=750, height=600, top=300, left=400');">처리하기</a></td>
					<td>-</td>
					<td>-</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<a href="#a" class="btn btn-default" role="button">접수내역 전체보기</a>
		</div>
	
		<div id="reply" class="bookmark"></div>
		
		<div>
			<h3>댓글 신고 접수 내역 <small>${today }</small></h3>
			<p>
				<span style="color: gray;">업데이트 시간 :  ${updateTime }</span>
				<a href="javascript:void(0);" class="glyphicon glyphicon-refresh reload" style="margin-left: 10px;"></a>
			</p>
			<table class="table" id="tbl3">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>접수코드</th>
					<th>댓글코드</th>
					<th style="width: 150px;">신고내용</th>
					<th>신고자ID</th>
					<th>신고일시</th>
					<th>처리결과</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				<c:forEach var="reply" items="${replyReportRegList }">
				<tr>
					<td><input type="checkbox"></td>
					<td>${reply.num }</td>
					<td>${reply.code }</td>
					<td><a href="#a">${reply.reply_code }</a></td>
					<td>${reply.reason }</td>
					<td><a href="javascript:void(0)" onclick="window.open('userinfodetail.action?id=${reply.declarantId }', '', 'width=600, height=720, top=300, left=400')">${reply.declarantId }</a></td>
					<td>${reply.report_date }</td>
					<c:if test="${reply.state == '승인' }">
					<td><a href="javascript:void(0)" role="button" onclick="window.open('replyblind.action?code=${reply.code }', '', 'width=750, height=600, top=300, left=400');">처리완료</a></td>
					<td>${reply.blind_date }</td>
					<td>${reply.blind_mg }</td>
					</c:if>
					<c:if test="${reply.state == '반려' }">
					<td><a href="javascript:void(0)" role="button" onclick="window.open('replyreportrefdetail.action?code=${reply.code }', '', 'width=750, height=600, top=300, left=400');">제재불가(사유)</a></td>
					<td>${reply.ref_date }</td>
					<td>${reply.ref_mg }</td>
					</c:if>
					<c:if test="${reply.state == '처리하기' }">
					<td><a href="javascript:void(0)" class="btn btn-default" role="button" onclick="window.open('replyreportdetail.action?code=${reply.code }', '', 'width=750, height=600, top=300, left=400');">처리하기</a></td>
					<td>-</td>
					<td>-</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<a href="#a" class="btn btn-default" role="button">접수내역 전체보기</a>
		</div>
	
		<div id="help" class="bookmark"></div>
		
		<div>
			<h3>1:1 문의 접수 내역 <small>${today }</small></h3>
			<p>
				<span style="color: gray;">업데이트 시간 :  ${updateTime }</span>
				<a href="javascript:void(0);" class="glyphicon glyphicon-refresh reload" style="margin-left: 10px;"></a>
			</p>
			<table class="table" id="tbl4">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>접수코드</th>
					<th>ID</th>
					<th>닉네임</th>
					<th style="width: 150px;">문의제목</th>
					<th>문의일시</th>
					<th>처리결과</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				<c:forEach var="inquiry" items="${inquiryReportRegList }">
				<tr>
					<td><input type="checkbox"></td>
					<td>${inquiry.num }</td>
					<td>${inquiry.code }</td>
					<td><a href="javascript:void(0)" role="button" onclick="window.open('userinfodetail.action?id=${inquiry.id }', '', 'width=600, height=720, top=300, left=400')">${inquiry.id }</a></td>
					<td>${inquiry.nick }</td>
					<td style="width: 150px;">${inquiry.title }</td>
					<td>${inquiry.reg_date }</td>
					<c:if test="${inquiry.state == '처리완료' }">
					<td><a href="javascript:replyWarning();" role="button" onclick="window.open('inquiryanswer.action?code=${inquiry.code }', '', 'width=750, height=600, top=300, left=400');">답변완료</a></td>
					<td>${inquiry.com_date }</td>
					<td>${inquiry.mg }</td>
					</c:if>
					<c:if test="${inquiry.state == '처리하기' }">
					<td><a href="javascript:void();" role="button" class="btn btn-default" onclick="window.open('inquirydetail.action?code=${inquiry.code }', '', 'width=750, height=600, top=200, left=400');">답변하기</a></td>
					<td>-</td>
					<td>-</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<a href="#a" class="btn btn-default" role="button">접수내역 전체보기</a>
		</div>
		
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</div><!-- .contents end -->
	
</div><!-- .container end -->
		
<div class="footer">
	푸터 영역
</div>

</body>
</html>
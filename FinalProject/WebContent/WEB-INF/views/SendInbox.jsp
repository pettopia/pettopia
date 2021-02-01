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
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/inbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
	    //최상단 체크박스 클릭
	    $("#chk_all").click(function()
	    {
	        //클릭되었으면
	        if($("#chk_all").prop("checked"))
	        {
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[class=chk]").prop("checked",true);
	            //클릭이 안되있으면
	        }
	        else
	        {
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[class=chk]").prop("checked",false);
	        }
	    });
	    
	    $("#write_msg").click(function()
	    {
	    	$(location).attr('href','writemsg.action');
	    });
	});
</script>

</head>
<body>
<div id="header" ></div>

<div class="wrapper">
	<div class="sidebar">
		<h2>톡톡</h2>
		<div id="menu_write" class="btn_workset">
			<input type="button" id="write_msg" class="btn btn-primary" value="톡톡보내기" style="width:100%; height:50px;">

			
		</div>
		
		<ul>
			<li><a href="inbox.action">받은톡톡</a></li>
			<li><a href="sendinbox.action">보낸톡톡</a></li>
			<li><a href="#">톡톡보관함</a></li>
			<li><a href="#">스팸톡톡</a></li>
		
		</ul>
		
	
	</div>
	
	<div id="main_content">
		<div class="header">
				<input type="button" class="btn btn-primary"value="답장"></input>
				<input type="button" class="btn btn-danger"  value="삭제"></input>
				<input type="button" class="btn btn-primary" value="보관"></input> 
				<input type="button" class="btn btn-danger" value="스팸신고"></input> 
				
		</div>
		<div class="info">
			<div class="notelist">
				<table class="table">
					<tr>
						<th>
						<input type="checkbox" class="chk" id="chk_all">
						</th>
						<th>받는사람</th>
						<th style="width:50%;">내용</th>
						<th>날짜</th>
						<th>차단</th>
					</tr>
					
					
					<c:if test="${count eq 0 }">
						<td colspan="5">보낸 쪽지가 없습니다.</td>
					</c:if>
					
					
					<c:if test="${count ne 0 }">
					<c:forEach var="dto" items="${list}">
                  	<tr>
						<td>
						<input type="checkbox" class="chk" >
						<!-- 쪽지 선택 체크박스 -->
						</td>
						<td>${dto.nick2 }</td>
						<td>${dto.talk }</td>						
						<td>${dto.senddate }</td>
						<td><input type="button" class="btn btn-danger" value="차단하기"></td>
					</tr>
					</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
			
			
		<div class="paginate">
			<!-- 첫 페이지로 이동 -->
			<a href="javascript:;" class="pre_end_n _ccr(lbp.first)" title="첫 페이지로 이동">처음</a>
			<!-- 이전 페이지로 이동 -->
			<a href="javascript:;" class="pre_n _ccr(lbp.prev)" title="이전 페이지로 이동">이전</a> 
			<strong>1</strong>
			<a href="#" class="_click(nList|movePage|2) _stopDefault">2</a>
			<a href="#" class="_click(nList|movePage|3) _stopDefault">3</a>
			<a href="#" class="_click(nList|movePage|4) _stopDefault">4</a>
			<a href="#" class="_click(nList|movePage|5) _stopDefault">5</a>
			<a href="#" class="_click(nList|movePage|6) _stopDefault">6</a>
			<a href="#" class="_click(nList|movePage|7) _stopDefault">7</a>
			<a href="#" class="_click(nList|movePage|8) _stopDefault">8</a>
			<a href="#" class="_click(nList|movePage|9) _stopDefault">9</a>
			<a href="#" class="_click(nList|movePage|10) _stopDefault">10</a>
			<!-- 다음 페이지로 이동 -->
			<a href="javascript:;" class="next _click" title="다음 페이지로 이동">다음</a>
			<!-- 마지막 페이지로 이동 -->
			<a class="next_end _click" title="마지막 페이지로 이동" href="javascript:;">마지막</a>
		</div>
			
	</div>
</div>
	





<div id="footer"></div>


</body>
</html>
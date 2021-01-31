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
<link rel="stylesheet" href="css/sidemenu.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function () {
    
    $(".mypage").click(function()
    {
    	$(location).attr('href','mypage.action');
    });

});

</script>
</head>
<body>

<div class="sidebar">
	<ul class="acc-menu" id="accordionMenu1">
    	 <button class="btn btn-primary mypage" style="width: 100%; height: 50px; margin-bottom: 30px;" >
            <span>마이페이지</span>
         </button>
    
	   <li data-extension="close">
           <div class="main-title"><a href="psprofileupdateform.action">프로필 수정</a></div>
           
       </li>
   
	
	    <li data-extension="close">
	        <div class="main-title"><a href="mypscarelist.action">돌봄내역</a></div>
	       
	    </li>
	    <li data-extension="close">
	        <div class="main-title"><a href="mypsreview.action">내리뷰목록</a></div>
	       
	    </li>
	   <li data-extension="close">
	        <div class="main-title"><a>일정관리</a></div>
	        
	    </li>
	      <li data-extension="close">
	        <div class="main-title"><a>펫시터일지</a></div>
	        
	    </li>
	</ul>
	
</div>
	
</body>
</html>
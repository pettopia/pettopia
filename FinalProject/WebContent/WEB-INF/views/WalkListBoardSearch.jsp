<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WalkListBoardSearch.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
#wrapper
{
	width:1150px;
	margin: 0 auto;
   margin-top: 200px;
   margin-bottom: 400px;
}

.far_best{
   
   width:1150px;
   margin:0 auto;
   margin-top: 30px;
}
.sub_far_best{
   font-size: 40px;
   font-weight: bold;
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
}
.whole{
   
   width:1150px;
   margin:0 auto;
   margin-top: 30px;
}
.sub_whole{
   font-size: 40px;
   font-weight: bold;
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
}
.panel-heading
{
   font-size: 40px;
   font-weight: bold;
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
}
.best{
   margin-top: 30px;
}
.best_product{
   
    width:20%;
   height:400px;
   display:inline-block;
   
}
.far_product img{
   margin: 0px 19px;
   position: relative;
     border:0.5px solid rgba(204,204,204,0.7);
    text-align: center;
}
.best_product_name{
   width:262px;
    display: block;
      margin-top: 11px;
   font-family: "Noto Sans KR Medium", "Noto Sans KR Regular", "Noto Sans KR Thin";
   font-size: 16px;
   color: #333
}
.best_product_price{
   width:262px;
    display: block;
     padding: 6px 0px 0px 0px;
    font-family:"Noto Sans KR Medium", "Noto Sans KR Regular", "Noto Sans KR Thin";
   font-size: 16px;
   line-height: 20px;
   padding-top: 6px;
   font-weight: 700;
   color: #333;

}

.autoplay{
   width:1050px;
   margin:0 auto;
}

.autoplay button{
   position: absolute;
    top: 39%;
    width: 70px;
    height: 150px;
    transform: translateY(-50%);   
   border: 0;
    background:0 0;
   cursor: pointer;
       outline: 0;
   }
   
.autoplay button:before{
   color:black;
   font-size:30px;
}
.autoplay button.slick-prev {
   left:-70px;
   font-size:0;
   color:transparent;
}

.autoplay button.slick-next {
   right:-65px;
   font-size:0;
   color:transparent;
}

.autoplay button.slick-prev:before{ 
 
content: "\e93b";
font-family:'xeicon';
   
}
   
.autoplay button.slick-next:before
{ 
  
font-family:'xeicon';
content: "\e93e";
   
}
.qwe{
   width:280px;
   
   box-sizing:border-box;
   
}

.walk_main
{
	height : 450px;
}




#btn {
  background: #222;
  height: 50px;
  min-width: 150px;
  border: none;
  border-radius: 10px;
  color: #eee;
  font-size: 40px;
  font-family: 'Cookie', cursive;
  position: relative;
  transition: 1s;
  -webkit-tap-highlight-color: transparent;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  padding-top: 5px;
}

#btn #circle {
  width: 5px;
  height: 5px;
  background: transparent;
  border-radius: 50%;
  position: absolute;
  top: 0;
  left: 50%;
  overflow: hidden;
  transition: 500ms;
}

.noselect {
  -webkit-touch-callout: none;
    -webkit-user-select: none;
     -khtml-user-select: none;
       -moz-user-select: none;
        -ms-user-select: none;
            user-select: none;
}

#btn:hover {
  background: transparent;
}

#btn:hover #circle {
  height: 50px;
  width: 150px;
  left: 0;
  border-radius: 0;
  border-bottom: 2px solid #eee;
}


</style>

<link rel="stylesheet" type="text/css" href="css/main_master.css">
</head>
<body>

<!-- 헤더 -->
<div>
      <c:import url="header.jsp"></c:import>
</div>
<div id="wrapper" align="center">

	
	
	
	 <div class="whole" style="height: 300px;">
         <!-- 전체모임보기 -->
         
            <div class="sub_whole">
<!--                <p class="garden_info_text">모임 전체보기</p> -->
              </div>
        

        <div class="row">
        	<div class="col-lg-12">
<!--         		<h1 class="Page-header">산책모임 리스트</h1> -->
        	</div>
        	<!-- /.col-lg-12 -->
        </div>
        <!--  /.row -->

      	<div class="row">
      		<div class="col-lg-12">
      			<div class="panel panel-default">
      				<div class="panel-heading">산책모임 검색결과</div>
      				<br>
      					<div class="walksearch" style="float:right;">&nbsp;
      				
      						<a href='walkfind.action'><input type="button" id= "walksearch" value="산책모임 검색하기"></a>&nbsp;&nbsp;
      						<a href ="walklistboard.action"><input type="button" id= "walksearch" value="산책모임 전체보기"></a>&nbsp;&nbsp;
      						<a href='walklist.action'><input type="button" id= "walksearch" value="메인으로 돌아가기"></a>&nbsp;&nbsp;
      					</div>
      					<br>
      				<div class="panel-body">
      					<table class="table table-striped table-bordered table-hover">
      						<thead>
      							<tr>
      								<th>제목</th> <!-- walktitle -->
      								<th>위치</th> <!-- region_lar + region_mid -->
      								<th>작성자(닉네임)</th> <!-- nick -->
      								<th>작성일</th> <!-- writedate -->
      								<th>조회수</th> <!-- views -->
      							</tr>
      						</thead>
      						
      						<c:forEach var="list" items="${list }" varStatus="i" >
      						<tr>
      							<td><a href="walkmeeting.action?walk_meeting_seq=${list.walk_meeting_seq }">${list.walktitle } </a></td>
      							<td>${list.region_hap }</td>
      							<td>${list.nick }</td>
      							<td>${list.writedate }</td>
      							<td>${list.views }</td>
      						</tr>
      						</c:forEach>
      					</table>
      				</div>
      			</div>
      		</div>
      	
      	</div>
 
 
 				


       
	<br>

      </div>
      <!--가까운 모임 div닫기-->
	
	
	
      
</div> <!-- wrapper닫기 -->

<!-- 하단 시작 { -->
<div>
      <c:import url="footer.jsp"></c:import>
  </div>
 <!-- 제이쿼리,스크립트 -->
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/scripts.js"></script>
<!-- } 하단 끝 -->
</body>
</html>






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
<title>WalkList.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
a
{
	text-decoration: none;
}
#wrapper
{
	width:1150px;
	margin: 0 auto;
   margin-top: 200px;
   margin-bottom: 400px;
}

.sogae
{
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
   font-size: 45px;
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
            color : #fff;
}

#btn:hover {
  background: transparent;
    color: #eee;
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

	<div class="walk_main">
		<div class="walk_main_left" style="float:left; width:50%">
			<img src="images/walk.jpg" class="img-rounded">
		</div>
		<div class="walk_main_right">
			<h1 style="text-align:center;">
			<br><br><strong><p class="sogae">지금 나에게 맞는 모임을 찾거나<br>
				새로운 모임을 만들어보세요!</p></strong><br>
				</h1>
				
				<%
					//로그인 되어있을 때
					String code = null;
					if (session.getAttribute("id") != null)
					{
						code = (String)session.getAttribute("code");
				%>
					
				
				
		<div id="btn">
			<a href="walkcreate.action?code=<%=code %>"><span class="noselect">Write</span></a>
			<div id="circle"></div>
		</div>
				<%
					}
					else
					{
				%>
					<div id="btn"><a href="walkloginform.action"><span class="noselect">Write</span></a><div id="circle"></div></div>
				<%
					}
				%>
<br>

<div id="btn"><a href="walklistboard.action"><span class="noselect">Find</span></a><div id="circle"></div></div>
	
		</div>
	</div>
	
	
	 <div class="whole" style="height: 300px;">
         <!-- 전체모임보기 -->
         
       
        
            <!-- 최근 작성된 글 4개 뿌리기
            글쓴이 닉네임, 제목 뿌리기 -->
            
            <div class="sub_whole">
               <p class="garden_info_text"><a href = "walklistboard.action">최근 게시물</a></p>
              </div>
        
            <c:forEach var="newlist" items="${newlist }" begin = "0" end = "3" varStatus="i">
            	<div class="qwe" style="float:left;"> 
            	<a href="walkmeeting.action?walk_meeting_seq=${newlist.walk_meeting_seq }"><img src="images/a12.jpg"></a> <br>
            	  <strong class="best_name">
            	  <br>
                     <span class="newlist_walktitle">${newlist.walktitle }</span><br>
                     <span class="newlist_nick">작성자 : ${newlist.nick }</span><br>
                     <span class="newlist_region">지역 : ${newlist.region_hap }</span>
                  </strong>
            	</div>
            </c:forEach>
       
	<br>

      </div>
      <!-- 최근 게시물 div닫기-->
	
	<br><br><br><br>

				
      <div class="far_best" style="height: 300px;">
      <br><br>
         <!--같은지역모임-->
         <!-- 지역 대분류가 같은 모임만 뿌리기
         		작성자 닉네임, 지역 뿌리기 -->
            <div class="sub_far_best">
            <br>
               <p class="garden_info_text">나와 가까운 모임</p>
              </div>
        
			 <c:forEach var="nearlist" items="${nearlist }" begin = "0" end = "3" varStatus="i">
            	<div class="qwe" style="float:left;"> 
            	<a href="walkmeeting.action?walk_meeting_seq=${nearlist.walk_meeting_seq }"><img src="images/a12.jpg"></a> <br><strong class="best_name">
                     <br>
                     <span class="nearlist_walktitle">${nearlist.walktitle }</span><br>
                     <span class="nearlist_region">${nearlist.region_hap }</span><br>
                     <span class="nearlist_nick">작성자 : ${nearlist.nick }</span>
                  </strong>
            	</div>
            </c:forEach>
        


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






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
<title>PetsitterView.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/PetsitterView.css">
<link rel="stylesheet" type="text/css"
   href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">

   li
   {
      font-weight: bold;
      font-size: xx-large;
   }

</style>
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>

<!--아이콘 링크 -->




</head>
<body>


   
   
<!-- content -->
<div id="content" >
   <div class="text1">

      <li>인적사항</li>
      닉네임 : 토르맘<br>
      성별 : 여성<br>
      평점 : 4.7
      <br><br><br>
      
      
      <li>세부사항</li>
      희망 반려동물 : <label><input type="checkbox" name="pet1" value="Big">대형견</label>
                  <label><input type="checkbox" name="pet2" value="middle">중형견</label>
                  <label><input type="checkbox" name="pet3" value="small" checked>소형견</label>
      <br>
      
      돌봄 형태 : <input type="radio" name="choice" value="visit">방문
               <input type="radio" name="choice" value="drop" checked="checked">위탁
      <br>
      
      돌봄 비용 : <input type="text" name="money" id="money" class="txt" value="15,000원">
      <br>
      <br><br><br>
      
      <li>상세내용</li>
      자기소개서 작성 : <br>
      <input type="textarea" name="intro" id="intro" class="txt" style="width: 150px; height: 200px;" value="은평구 대표 펫시터 토르맘입니다.">
      
      <br><br><br>
      
      <li>돌봄환경</li>
      <label><input type="checkbox" name="envrio1" value="reserv">정기예약</label>
      <label><input type="checkbox" name="envrio2" value="walk" checked="checked">야외산책</label>
      <label><input type="checkbox" name="envrio3" value="old">노령견종</label>
      <label><input type="checkbox" name="envrio4" value="shower" checked="checked">목욕가능</label>
      <br>
      <label><input type="checkbox" name="envrio5" value="big">대형견종</label>
      <label><input type="checkbox" name="envrio6" value="pickup">픽업가능</label>
      <label><input type="checkbox" name="envrio2" value="exper" checked="checked">돌봄경험</label>
      <label><input type="checkbox" name="envrio2" value="study">교육이수</label>
      
      <br><br><br>
      
      <li>PHOTO</li>
      <img id="photo1" src="https://www.bing.com/images/blob?bcid=S0JtAEWWujMCZg" style="width: 150px; height:80px;">
      <br><br><br>
      
      <li>후기</li>
       rege** (<img id="photo3" src="images/star.png" width="50px;" height="20px;">)<br>
       가족여행으로 인해 어쩔수 없이 맡겨보았는대 정말 만족스러웠습니당 최고~!!<br>
       prince*** (<img id="photo3" src="images/star.png" width="50px;" height="20px;">)<br>
       아주 친절합니다 ~~!
       <br><br>
   </div>
   
   <div class="text2">
   
   <li>펫시터 위치</li>
      충청북도 청주시 흥덕구 복대1동<br>
      <img id="photo2" src="images/photo2.JPG" style="height: 120px; width: 280px;">
      <br><br><br>
      
   <li>예약 스케쥴러</li>
    <img id="photo4" src="images/cal.JPG" style="height: 170px; width: 280px;">
    <li class="checkBox">반려동물 선택 :
       <label><input type="checkbox" name="pet1" value="torh">토르</label>
      <label><input type="checkbox" name="pet2" value="Ggulbi">꿀비</label>
      <label><input type="checkbox" name="pet3" value="mangchi" checked>망치</label>
    </li>
    <br><br><br>
    
   <li>약관동의</li>
   <span class="checkBox">
       <textarea class="txt" name="agree" id="agree" style="width: 330px; height: 170px;">여러분을 환영합니다.
                        네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
          <li style="margin: 0px 90px;">이용약관 동의(필수)<input type="checkbox" name="chk"></li>
    </span>
    <br><br>
    <span class="btnBox" style="margin: 0px 50px"></span>
    <button type="button" id="submitBtn" class="btn btn-outline-dark btn-sm" >예약요청</button>
    <button type="button" id="resetBtn" class="btn btn-outline-dark btn-sm">취소</button>
    </span>
    <br>
    <span id="err" style="margin: 0px 80px;">모든 항목을 선택해야 합니다.</span><br>
   </div>

   
</div>


   <!-- 제이쿼리,스크립트 -->
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/scripts.js"></script>
   
   <script type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>
<br>


</html>
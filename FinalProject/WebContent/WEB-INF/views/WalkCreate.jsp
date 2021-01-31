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
<title>WalkCreate.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
td{width:150px;} 


h1
{
   font-family: "tvN 즐거운이야기 Bold", "tvN 즐거운이야기 Light", "tvN 즐거운이야기 Medium";
}


#wrapper
{
	width:1150px;
	margin: 0 auto;
   
   margin-top: 200px;
   margin-bottom: 20px;
}

#createtable
{
	width:900px;
}
td
{
	width:220px;
}
</style>
<script type="text/javascript">

	$(function()
	{
		
		$("#canclebtn").click(function()
		{
			$(location).attr('href', 'walklist.action');
		});
		
		$("#createbtn").click(function()
		{
		
			 
			var a = $("#pet_con_reg_seq option:selected").val();
			var walktitle = $("#walktitle").val();
			
			
			if ($.trim($("#walktitle").val())=='')
			{
				alert("제목을 입력해주세요.");
				return false;
			}
			
			if ( a == 0 )
			{
				alert("등록된 펫이 없습니다. 펫을 먼저 등록해주세요");
				$(location).attr('href', 'walklist.action');

			}
			
			$("#myForm").submit();
			
		});

		
		
	});
	
</script>

<script type="text/javascript">

	
	  $(function() {

          $("#region").change(function() {

              var v = $("#region").val();

             alert("셀렉트값 : "+ v);
             
             if(v==1)
             {
            	 ajaxRequest1();
             }
             else if(v==2)
             {
            	 ajaxRequest2();
             }
             else if(v==3)
             {
            	 ajaxRequest3();
             }
             else if(v==4)
             {
            	 ajaxRequest4();
             }
             else if(v==5)
             {
            	 ajaxRequest5();
             }
             else if(v==6)
             {
            	 ajaxRequest6();
             }
             else if(v==7)
             {
            	 ajaxRequest7();
             }
             else if(v==8)
             {
            	 ajaxRequest8();
             }
             else if(v==9)
             {
            	 ajaxRequest9();
             }
             else if(v==10)
             {
            	 ajaxRequest10();
             }
             else if(v==11)
             {
            	 ajaxRequest11();
             }
             else if(v==12)
             {
            	 ajaxRequest12();
             }
             else if(v==13)
             {
            	 ajaxRequest13();
             }
             else if(v==14)
             {
            	 ajaxRequest14();
             }
             else if(v==15)
             {
            	 ajaxRequest15();
             }
             else if(v==16)
             {
            	 ajaxRequest16();
             }
             else
             {
            	 ajaxRequest17();
             }
             
          });

          
      }); 
	  

		
	  function ajaxRequest1()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region1").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	  function ajaxRequest2()
	  {
	  	$.post("walkcreateajax.action",
	  	{
	  		s : $(".region2").val()
	  	}, function(data)
	  	{
	  		$("#region_mid_seq").html(data).css("display", "inline");
	  		//alert($(".region2").val()); 2
	  	});
	  }
	  
	  function ajaxRequest3()
	  {
	  	$.post("walkcreateajax.action",
	  	{
	  		s : $(".region3").val()
	  	}, function(data)
	  	{
	  		$("#region_mid_seq").html(data).css("display", "inline");
	  	});
	  }
	  function ajaxRequest4()
	  {
	  	$.post("walkcreateajax.action",
	  	{
	  		s : $(".region4").val()
	  	}, function(data)
	  	{
	  		$("#region_mid_seq").html(data).css("display", "inline");
	  	});
	  }
	    function ajaxRequest5()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region5").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest6()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region6").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest7()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region7").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest8()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region8").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest9()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region9").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest10()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region10").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest11()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region11").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest12()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region12").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest13()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region13").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest14()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region14").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest15()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region15").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest16()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region16").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
			});
		}
	    
	    function ajaxRequest17()
		{
			$.post("walkcreateajax.action",
			{
				s : $(".region17").val()
			}, function(data)
			{
				$("#region_mid_seq").html(data).css("display", "inline");
				//alert($(".region17").val()); 
			});
		}
	 
	  
</script>
	

</head>
<body>

<!-- 헤더 -->
<div>
      <c:import url="header.jsp"></c:import>
</div>


<div id="wrapper" align="center">
<h1 align="center"><strong>생성하실 모임 조건을 설정하세요!</strong></h1>

	<div align="center">
	
	<form action="walkcreateinsert.action" method="post" id="myForm">
	<br>
	<h2>모임 제목</h2> <input type="text" id="walktitle" name="walktitle" style="width:500px" placeholder="제목을 적어주세요." value="">
	<br><br>
		
	<table style="align:center;" id = "createtable" class="table table-borderless">
		
		<tr>
			<th>함께할 댕댕이</th>
			<td></td>
			<td>
				<select name="pet_con_reg_seq" id="pet_con_reg_seq">
					<option value="0" selected disabled hidden>==강아지를 선택하세요==</option>
					<c:forEach var="doglist" items ="${doglist }" varStatus="i">
					<option value="${doglist.pet_con_reg_seq }" >${doglist.petname }</option>
					</c:forEach>
				</select>
			</td>
			<td></td>
		</tr>
		
		<tr>
			<th>모임 인원 수</th>
			<td><input type="radio" name="walk_nop_seq" value="1" > 2~3인</td>
			<td><input type="radio" name="walk_nop_seq" value="2" > 4인</td>
			<td><input type="radio" name="walk_nop_seq" value="3" > 무관</td>
		</tr>
		
		<tr>
			<th>모임 목적</th>
			<td><input type="radio" name="walk_aim_seq" value="1" > 산책</td>
			<td><input type="radio" name="walk_aim_seq" value="2"> 소통</td>
			<td><input type="radio" name="walk_aim_seq" value="3"> 훈련</td>
		
		</tr>
		
		<tr>
			<th>날짜</th>
			<td>
				
			</td>
			<td>
<!-- 				<input type="datetime-local" class="form-control" name="walkdate" > -->
				<input type="datetime-local" class="form-control" name="walkdate" >
			</td>
			<td>
				
			</td>
		
		</tr>
		
		
		
		
		 
		<tr>
			<th>지역</th>
			  <td>
			  <select name="region" id="region">
			    	<option value="" selected disabled hidden>==지역 대분류==</option>
				    <c:forEach var="addrlarname" items="${addrlarname }" varStatus="i">
				    	<option value="${addrlarname.region_lar_id }" class="region${addrlarname.region_lar_id }">${addrlarname.larname }</option>
				    </c:forEach>
			   </select>
			</td>
			<td>
			    <select name="region_mid_seq" id="region_mid_seq" >
			    	
					
				</select>
			</td>
			<td></td>
		
		</tr>
		
		<tr>
			<th>상세주소(위치)</th>
		  
		    <td></td>
		    <td> <img src="images/map.png" width="200" height="200"
	                  alt="map" id="map"><input type="text" name="walkplace" placeholder="상세 위치를 입력하세요">
	        </td>
		    <td></td>
		    
		
		</tr>
		
		<tr>
			<th>주인 성별 옵션</th>
			<td><input type="radio" name="gender_op_seq" value="1" >동성만</td>
			<td><input type="radio" name="gender_op_seq" value="0" >상관없음</td>
			<td></td>
		</tr>
		
		
		<tr>
			<th>연령대 옵션</th>
			<td><input type="radio" name="age_op_seq" value="1">비슷한 연령대를 원합니다.</td>
			<td><input type="radio" name="age_op_seq" value="0">연령대 무관</td>
			<td></td>
			
		</tr>
		
	</table>
	<div id="textarea" align="center">
	<h2>모임 소개글</h2>
	<textarea rows="10" cols="120" name="contents" style="align:center;" placeholder="간단한 소개글을 적어주세요."></textarea>
	</div>
	<span style="color: red;">※안전을 위하여 명당 최대 1마리로 제한합니다.</span>
	

	 
	<div align="center">
		<br>
		<button type="button" class="btn" id="createbtn">모임 생성</button>&nbsp;
		<button type="button" class="btn" id="canclebtn">취소</button>
	</div>
	
	</form>
</div>

</div>

<!-- 하단 시작 { -->
<div>
      <c:import url="footer.jsp"></c:import>
  </div>
   <!-- 제이쿼리,스크립트 -->
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/scripts.js"></script>
   <script type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   <script type="text/javascript">
      $('.autoplay').slick(
      {
         slidesToShow : 4,
         slidesToScroll : 1,
         autoplay : true,
         autoplaySpeed : 2000,
      });
   </script>
<!-- } 하단 끝 -->
</body>
</html>



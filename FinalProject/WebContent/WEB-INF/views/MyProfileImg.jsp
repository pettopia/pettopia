<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필 이미지 수정하기</title>

<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
	
	.wrap {
		margin-left: 30px;
		margin-top: 30px;
	}
	.select_img {
		margin-top: 30px;
		text-align: center;
	}
	.button {
		margin-top: 30px;
	}

</style>

<script type="text/javascript">

	$().ready(function()
	{
		$("#submitBtn").click(function()
		{
		   if( $("#file").val() == "")
		   {
		      alert("선택된 파일이 없습니다.");
		      return;
		   }
		   
		   $("#form").submit();
		   
		});
	});

</script>

</head>
<body>

<div class="wrap">
	<form action="myprofileimgupdate.action" method="post" id="form" enctype="multipart/form-data">
		<div>프로필 이미지 수정하기</div>
		<input type="file" name="file" id="file" style="margin-top: 30px;">
	</form>
	
	<div class="select_img"><img src=""></div>
         
	<script>
		$("#file").change(function()
		{
			if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data)
			{
				$(".select_img img").attr("src", data.target.result);
			}
			reader.readAsDataURL(this.files[0]);
			}
		});
	</script>
         
	<div class="button">
		<button type="submit" id="submitBtn" class="btn btn-success">수정하기</button>
		<button type="button"  class="btn btn-danger back" onclick="window.close();">닫기</button>
	</div>
	
</div>

</body>
</html>
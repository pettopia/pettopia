/*
* ---------------------------------------------------------------------------
* jQuery Version
* ---------------------------------------------------------------------------
*/
var $window = $(window),
	$mainheader = $('#main-header'),
	$defalutLogo = 'images/logo3.png',
	$smallLogo = 'images/logo3.png';
	
	$window.scroll(function(){
	  if($(this).scrollTop() > 100 ){
		if(!$mainheader.hasClass('shrink')){
		  $mainheader.addClass('shrink');
			switchImages($smallLogo);
		   }
	}else{
		if($mainheader.hasClass('shrink')){
		   $mainheader.removeClass('shrink');
			switchImages($defalutLogo)
		   }
	}
				   });
//switchImages 함수

function switchImages(newPath) {
	var $logo = $('#logo');
	$logo.fadeOut(0, function(){
		$logo.attr('src',newPath);
		$logo.fadeIn(0);
	}); // jquery fadeout
}



// 서브 메뉴
$(function(){
	$(".tab").click(function(e){
		e.preventDefault();
		$("#mobile").addClass("active");
		$(".dim").addClass("active");
	});
	$(".dim").click(function(){
		$("#mobile").removeClass("active");
		$(".dim").removeClass("active");

		if($(".sub").hasClass("active")){
			$(".sub").removeClass("active");
		}
	});
	$("#mobile > ul > li").click(function(e){
		e.preventDefault();
		if($(this).find(".sub").hasClass("active")){
			$(this).find(".sub").removeClass("active");
		}
		else{
			$(".sub").removeClass("active");
			$(this).find(".sub").addClass("active");
		}
	});

	var w;

	$(window).resize(function(){
		w=$(window).width();

		if(w > 760){
			if($(".dim").hasClass("active")){
				$(".dim").trigger("click");
			}
		}
	});
});



// Open the full screen search box
function openSearch() {
  document.getElementById("myOverlay").style.display = "inline-block";
}

// Close the full screen search box
function closeSearch() {
  document.getElementById("myOverlay").style.display = "none";
}
///////////////////////////////////////

function openSearch1() {
  document.getElementById("myOverlay1").style.display = "inline-block";
}







//////////////////////////////////////////////////////////
function setDisplay(){
    if($('input:radio[id=bbb]').is(':checked')){
        $('#divId').show();
		$('#divclass').hide();
    }else{
        $('#divId').hide();
		$('#divclass').show();
	}
	
}





 





/*
* ---------------------------------------------------------------------------
* Vanilla JavaScript Version
* ---------------------------------------------------------------------------
*/


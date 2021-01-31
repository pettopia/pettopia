$(function(){
   $('#imgbox1').each(function(index) {
        $(this).hover(
      function(){
         $(this).attr('src','images/imgbox.png');
      },
      function(){
         $(this).attr('src','images/footer_image.png');
      }
      );
   });
});


$(function(){
   $('#imgbox2').each(function(index) {
        $(this).hover(
      function(){
         $(this).attr('src','images/imgbox1.png');
      },
      function(){
         $(this).attr('src','images/footer_image1.png');
      }
      );
   });
});


$(function(){
   $('#imgbox3').each(function(index) {
        $(this).hover(
      function(){
         $(this).attr('src','images/imgbox2.png');
      },
      function(){
         $(this).attr('src','images/footer_image2.png');
      }
      );
   });
});

$(function(){
   $('#imgbox4').each(function(index) {
        $(this).hover(
      function(){
         $(this).attr('src','images/imgbox3.png');
      },
      function(){
         $(this).attr('src','images/footer_image3.png');
      }
      );
   });
});
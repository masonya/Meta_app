$(function(){
  $("div.user").click(function() {
     $("div#up").removeClass();
     $("div#up").addClass("user_popup_view");
    });

  $("div.exitbutton").click(function() {
     $("div#up").removeClass();
     $("div#up").addClass("user_popup");
    });

});

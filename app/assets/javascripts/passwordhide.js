  $(document).ready(function(){
    $(".passwordVisibilityButton").on("click", function() {
      var field = $(this).parent().find('input')

      if (field.attr("type") == "password") {
        field.attr("type", "text")
        $(this).toggleClass('eyeclose')
      } else {
        field.attr("type", "password")
        $(this).toggleClass('eyeclose')
      }
    })

});

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

$(document).ready(function(){
  $(".passwordVisibilityButtonSession").on("click", function() {
    var field = $(this).parent().find('#user_password')

    if (field.attr("type") == "password") {
      field.attr("type", "text")
      $(this).toggleClass('eyeclose')
    } else {
      field.attr("type", "password")
      $(this).toggleClass('eyeclose')
    }
  })
});

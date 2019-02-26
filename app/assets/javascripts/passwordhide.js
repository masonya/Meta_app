  $(document).ready(function(){
  $(".passwordVisibilityButton").on("click", function() {
    var field = $("#wallet_password")

    if (field.attr("type") == "password") {
      $("#wallet_password").attr("type", "text")
      $(this).toggleClass('eyeopen')
    } else {
      $("#wallet_password").attr("type", "password")
      $(this).toggleClass('eyeclose')
    }
  })

  $(".passwordVisibilityButton").on("click", function() {
    var field = $("#social_account_password")

    if (field.attr("type") == "password") {
      $("#social_account_password").attr("type", "text")
      $(this).toggleClass('eyeopen')
    } else {
      $("#social_account_password").attr("type", "password")
      $(this).toggleClass('eyeclose')
    }
  })

  $(".passwordVisibilityButton").on("click", function() {

    var field = $("#subscription_password")

    if (field.attr("type") == "password") {
      $("#subscription_password").attr("type", "text")
      $(this).toggleClass('eyeopen')
    } else {
      $("#subscription_password").attr("type", "password")
      $(this).toggleClass('eyeclose')
    }
  })



  // $(".passwordVisibilityButton").on("click", function() {
  //   var field = $("#wallet_password", "#subscription_password", "#subscription_password")
  //
  //   if (field.attr("type") == "password") {
  //     $("#wallet_password", "#subscription_password", "#subscription_password").attr("type", "text")
  //     $(this).toggleClass('eyeopen')
  //   } else {
  //     $("#wallet_password", "#subscription_password", "#subscription_password").attr("type", "password")
  //     $(this).toggleClass('eyeclose')
  //   }
  // })
});

$(function() {
  $('.editing').on('mouseover', function(e) {
    $(this).parent().addClass('card_odtain')
  });

  $('.editing').on('mouseleave', function(e) {
    $(this).parent().removeClass('card_odtain')
  });
});

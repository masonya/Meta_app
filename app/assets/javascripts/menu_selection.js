$(function() {
    var location = window.location.href;
    var cur_url = '/' + location.split('/').pop();
     $('.SectionButton a').each(function () {
        var link = $(this).find('a').attr('href');

        if (cur_url == '/obtain')
        {
          $('.ObtainMenuButton a').css('color','#3A8BDF');
        } else {
          $('.TransmitMenuButton a').css('color','#3A8BDF');
        }
    });
});

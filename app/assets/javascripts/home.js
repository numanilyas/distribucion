/*
$(document).ready(function(){
  $('#imagesDiv img')
    .wrap('<span style="display:inline-block"></span>')
    .css('display', 'block')
    .parent()
    .zoom();
});
*/

$(document).ready(function () {
    $('.carousel').carousel({
        interval: 7000
    });

    $('.carousel').carousel('cycle');  
});
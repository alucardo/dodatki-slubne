$(function(){
  $('body').on('click', "a.parent", function(e){
    e.preventDefault();
    $(this).parent().children('ul').slideToggle();
    console.log('sss');
  })
})
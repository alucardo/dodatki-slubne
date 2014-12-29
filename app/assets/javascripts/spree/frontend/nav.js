$(function(){
  $('body').on('click', "a.parent", function(e){
    e.preventDefault();
    $(this).parent().children('ul').slideToggle();
    console.log('sss');
  })

  function set_size(name){
      var heights = $(name).map(function() {
              return $(this).height();
          }).get(),

      maxHeight = Math.max.apply(null, heights);

      $(name).height(maxHeight);
  }

  set_size(".well-tab .well");
})
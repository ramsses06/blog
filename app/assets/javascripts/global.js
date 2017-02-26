$( document ).ready(function() {
  $(".dropdown-toggle").hover(
    function(){
      $(this).parent().addClass("open");
  }, function(){}
  );
  $(".dropdown-menu").hover(
    function(){},
    function(){
      $(this).parent().removeClass("open");
    }
  );
});

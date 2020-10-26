
$(function(){
  const arrowButton = '.user__box__dropdown__arrow';
  const arrowMenu = '.user__box__dropdown__arrow-menu';
  $(arrowButton).hover(function(){
    $(arrowMenu).css('display', 'block');
  },function(){
    $(arrowMenu).css('display', 'none');
  });

  $(arrowMenu).hover(function(){
    $(this).css('display', 'block');
  },function(){
    $(this).css('display', 'none');
  });
});
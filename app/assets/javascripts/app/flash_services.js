$(document).ready(function(){
  if($('.alert').length > 0 ) {
    setTimeout(function(){
      $('.alert').addClass('is-hidden')
    }, 5000)
  }
})
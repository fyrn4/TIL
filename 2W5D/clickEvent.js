
function fn(){
  $('#other').click();
} 
var other = $('#other');
$('#other').click(function(e){
  console.log(e.target.innerHTML);
})
$('#target').click(function(){
  other.click();
  fn();
})


$('p').click(function(e){
  $(this).slideUp();
})
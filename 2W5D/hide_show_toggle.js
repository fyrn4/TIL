/**
 * @function hide()
 */
  // JQuery : hide() <> show()
  // > 일치하는 요소를 숨겨준다. "display:none" 과 같은 형태.
  // > (selector).hide(); => 인자가 없을경우, 애니메이션 없이 실행한다.
  // > .hide(duration,complete())
  // - 첫 번째 인자는 애니메이션 시간을지정한다.
  //    - type : String or Number   =>  String='fast'and'slow', Number=200 and 600 이런식..
  // - 두 번째 인자는 hide가 실행완료 되고난 후 수행하는 complete fn()이다.

 // hide에 인자가 function() 하나만 오는경우.
  $("#clickme").click(function(){
    $("#book").hide(function(){
      alert("Animation complete.");
    })
  })

  for(var i=0;i<5;i++){
    $("<div></div>").appendTo(document.body);
  }
  $("div").click(function(){
    $(this).hide(function(){
      $(this).remove(); //hide는 element가 남아있지만, remove는 아예 삭제해준다. 
    });
  })

  // hide에 인자가 두개가 오는경우. 애니메이션의 속도를 지정해 줄 수 있다.
  $("#hider").click(function () {
    $("span:last-child").hide("fast", function () {
      // Use arguments.callee so we don't need a named function
      $(this).prev().hide("fast", arguments.callee); //이전요소의 arguments.callee (현재 실행중인 함수를 call, 즉 재귀)
    });
  });
  $("#shower").click(function () {
    $("span").show(2000);
  });


  /**
   * @function toggle()
   */
  // toggle()은 hide(), show() 토글형식으로 이벤트를 호출한다.
  // > trigger('event or duration',complete fn()) 

  $("button:first").click(function () { 
    update($("span:first")); 
  }); 
  // 마지막버튼을 누르면 첫번째 버튼도 클릭이벤트를 실행한다.
  $("button:last").click(function () { 
    $("button:first").trigger('click'); 
    update($("span:last")); 
  }); 
  function update(j) { 
    var n = parseInt(j.text(), 10); 
    j.text(n + 1); 
  } 
  
  // <p class="a">클릭하면</p> <p class="b">show/hide되지롱</p> 
  $(document).ready( function() {
    $( 'p.a' ).click( function() {
      $( 'p.b' ).toggle( 'slow' );
    });
  });

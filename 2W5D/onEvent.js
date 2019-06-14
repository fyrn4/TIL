    var $test = $('#test');
    function handler1(){
      console.log('handler1');
      $test.off('click',handler2);
    }
    function handler2(){
      console.log('handler2');
    }
    $test.on("click",handler1);
    $test.on("click",handler2);
      
    $("p").on('click',function(){
      alert($(this).text());
    })

    //on() 두번째인자에 객체 데이터를 삽입해서 호출할 수 있다.
    function myHandler(e){
     alert(e.data.obj);
    } 
    $("p").on('click',{obj:"test obj"},myHandler);
      
    //같은기능
    $('form').on('submit',false);
    $('form').on('submit',function(e){
      e.preventDefault(); //현재 이벤트 전파 방지. 
      e.stopPropagation(); //현재 이벤트 상위로 전파 방지 (둘의 차이는 a태그 href를 생각하자.)
    //retun false; // 둘다 포함하는 기능.
    })
      
      
    //트리거가 최초 실행되면서 객체형태의 데이터를 옮겨줄수도있다.
    $('div').on('click',function(e,person){
      alert('hello',+person.name);
    })
    $('div').trigger('click',{name:'JIM'});
      
    //on 이벤트에 배열(배열도 객체임)형태의 데이터를 담을수도 있음.
    $('div').on('click',function(e,data1,data2){
      alert(data1+","+data2);
    })
    $('div').trigger('click',['goodbye','jim']);

    
    //다양한 이벤트 핸들러
    $('div').on({
      click:function(){
        $(this).toggleClass('active');
      },
      'mouseenter':function(){
        $(this).addClass('active');
      },
      'mouseleave':function(){
        $(this).removeClass('active');
      }
    })
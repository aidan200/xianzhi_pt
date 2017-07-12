
$(function (){
    //回到裆部距离
    function  top(id){
        var bb= $(window).scrollTop();//这是滚动时候记录的距离顶部距离
        if(bb>600){
            $(id).css({
                "display":"block"
            })
        }else{
            $(id).css({
                "display":"none"
            })
        }
    }
    top('#index_hddb');
    $('#index_hddb > a').on('click',function (){
        var speed=800;//滑动的速度
        $('body,html').animate({ scrollTop: 0 }, speed);
    });
    $(window).scroll(function (){
        top('#index_hddb');
    });
    //自适应屏幕
    function aaa(){
        var aaa=$(window).height();//可视区高度
        var bbb=$(window).width();//可视区宽度
        if(aaa<1200&&bbb>1200){
            $('#index_lb img').css({
                "height":aaa-121
            });
            $('#index_lb_bg').css({
                "height":aaa-121
            })
        }else if(bbb<1200&&bbb>450){
            $('#index_lb img').css({
                "height":"auto"
            });
            $('#index_lb_bg').css({
                "height":"auto"
            })
        }else if(bbb<450){
            $('#index_lb img').css({
                "height":"250"
            });
        }
    }
    aaa();
    $(window).on('resize',function (){//当页面改变大小事件
        aaa()
    })
    



});
/**
 * Created by SYHT on 2017/7/6.
 */
function m_lo1(obj){//全屏幕轮播
    var m_c=3;//层
    var m_s=0;//谁
    function m_lb_(obj){
        var m_length=$(obj+" > div").length;
        var m_width=$(obj).width();
        if(m_s==m_length){
            m_s=0;
        }
        $(obj+" > div").css({
            "width":"100%",
            "height":"100%",
            "marginLeft":"0"
        });
        // $(obj+" > div").eq(m_s).animate({
        //     "width":m_width+100,
        //     "height":"110%",
        //     "marginLeft":"-50"
        // },3000);

        $(obj+" > div").eq(m_s++).css({
            "z-index":++m_c
        });
        $(obj+" > h4").animate({
            "backgroundColor":"#c0c0c0"
        },100);
        $(obj+" > h4").animate({
            "backgroundColor":"#000000"
        },100);
    }
    m_lb_(obj);
    setInterval(function (){//切换时间
        m_lb_(obj)
    },5000);
}
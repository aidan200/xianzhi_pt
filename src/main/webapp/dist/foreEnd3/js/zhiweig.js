/**
 * Created by Administrator on 2017/8/16.
 */
//职位滚动js
//Creating 50 thumbnails inside .grid
//the images are stored on the server serially. So we can use a loop to generate the HTML.
/*var images = "", count = 12;
 for(var i = 1; i <= count; i++)
 //images += '<img src="http://thecodeplayer.com/u/uifaces/'+i+'.jpg" />';
 images += '<div class="ddds"></div>';
 //appending the images to .grid
 $(".grid").append(images);*/

var d = 0; //delay
var ry, tz, s; //transform params

//animation time
var isGoZW = false;
function gozhiweig() {
    if(!isGoZW){
        isGoZW = true;
        //fading out the thumbnails with style
        $(".ddds").each(function(){
            d = Math.random()*100; //1ms to 1000ms delay
            $(this).delay(d).animate({opacity: 0}, {
                //while the thumbnails are fading out, we will use the step function to apply some transforms. variable n will give the current opacity in the animation.
                step: function(n){
                    s = 1-n; //scale - will animate from 0 to 1
                    $(this).css("transform", "scale("+s+")");
                },
                duration: 100,
            })
        }).promise().done(function(){
            //after *promising* and *doing* the fadeout animation we will bring the images back
            storm();
        })
    }
}
/*$(function(){
})*/
//bringing back the images with style
function storm()
{
    $(".ddds").each(function(){
        d = Math.random()*1000;
        $(this).delay(d).animate({opacity: 1}, {
            step: function(n){
                //rotating the images on the Y axis from 360deg to 0deg
                ry = (1-n)*360;
                //translating the images from 1000px to 0px
                tz = (1-n)*1000;
                //applying the transformation
                $(this).css("transform", "rotateY("+ry+"deg) translateZ("+tz+"px)");
            },
            duration: 2000,
            //some easing fun. Comes from the jquery easing plugin.
            easing: 'easeOutQuint',
        })
    })
}





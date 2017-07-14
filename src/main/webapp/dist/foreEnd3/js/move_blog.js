/**
 * Created by SYHT on 2017/7/14.
 */
(function($) {
    $(function() {
        $(".index_list li").bind("mouseenter mouseleave", function(e) {
            var w = $(this).width();
            var h = $(this).height();
            var x = (e.pageX - this.offsetLeft - (w / 2)) * (w > h ? (h / w) : 1);
            var y = (e.pageY - this.offsetTop - (h / 2)) * (h > w ? (w / h) : 1);
            var direction = Math.round((((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90) + 3) % 4; //direction的值为“0,1,2,3”分别对应着“上，右，下，左”
            var eventType = e.type;
            var dirName = new Array('上方', '右侧', '下方', '左侧');
            let mask = $(this).children('.mask4');
            if (e.type == 'mouseenter') {
                switch (direction) {
                    case 0:
                        mask.css({
                            top: -240,
                            left: 0
                        });
                        break;
                    case 1:
                        mask.css({
                            top: 0,
                            left: 240
                        });
                        break;
                    case 2:
                        mask.css({
                            top: 240,
                            left: 0
                        });
                        break;
                    case 3:
                        mask.css({
                            top: 0,
                            left: -240
                        });
                        break;
                }
                mask.stop(true).animate({
                    left: 0,
                    top: 0
                }, 400);
            } else {
                let end = {};
                switch (direction) {
                    case 0:
                        end = {
                            top: -240,
                            left: 0
                        };
                        break;
                    case 1:
                        end = {
                            top: 0,
                            left: 240
                        };
                        break;
                    case 2:
                        end = {
                            top: 240,
                            left: 0
                        };
                        break;
                    case 3:
                    {
                        end = {
                            top: 0,
                            left: -240
                        };
                        break;
                    }
                }
                mask.stop(true).animate(end, 400);
            }
        });
    });
})(jQuery);
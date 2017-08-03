/**
 * Created by SYHT on 2017/8/3.
 */

//带确定的弹出框
jQuery(document).ready(function ($) {
    $('.newtan2').on('click', function (event) {
        event.preventDefault();
        $('.newpop2').addClass('is-visible');
    });

    //close popup
    $('.newpop2').on('click', function (event) {
        if ($(event.target).is('.all_close2') || $(event.target).is('.newpop2')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $('.newpop2').removeClass('is-visible');
        }
    });
});

/**
 * Created by SYHT on 2017/8/3.
 */


jQuery(document).ready(function ($) {
    //带确定的弹出框
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


//    带确定和取消的弹出框
    $('.newtan').on('click', function (event) {
        event.preventDefault();
        $('.newpop').addClass('is-visible');
    });

    //close popup
    $('.newpop').on('click', function (event) {
        if ($(event.target).is('.all_close') || $(event.target).is('.newpop')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $('.newpop').removeClass('is-visible');
        }
    });


//    带输入框的弹出框
    $('.newtan3').on('click', function (event) {
        event.preventDefault();
        $('.newpop3').addClass('is-visible');
    });

    //close popup
    $('.newpop3').on('click', function (event) {
        if ($(event.target).is('.all_close3') || $(event.target).is('.newpop3')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $('.newpop3').removeClass('is-visible');
        }
    });


    //成功
    $('.new_success').on('click', function (event) {
        event.preventDefault();
        $('.successpop').addClass('is-visible');
    });

    //close popup
    $('.successpop').on('click', function (event) {
        if ($(event.target).is('.success_close') || $(event.target).is('.successpop')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $('.successpop').removeClass('is-visible');
        }
    });


    //失败
    $('.new_fail').on('click', function (event) {
        event.preventDefault();
        $('.failpop').addClass('is-visible');
    });

    //close popup
    $('.failpop').on('click', function (event) {
        if ($(event.target).is('.fail_close') || $(event.target).is('.failpop')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $('.failpop').removeClass('is-visible');
        }
    });


});




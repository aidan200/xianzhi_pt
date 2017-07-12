/**
 * Created by SYHT on 2017/7/12.
 */
$(document).ready(function () {
    $(".com_one,.com_moreu1").hover(function () {
        $(".com_moreu1").toggle();
    });
    $(".com_moreu1,.com_one").hover(function () {
        $(".com_moreu1,.com_one").css("background-color", "#fff");
    }, function () {
        $(".com_moreu1,.com_one").css("background-color", "rgba(228, 228, 228, 0.12)");
    });

    $(".com_two,.com_moreu2").hover(function () {
        $(".com_moreu2").toggle();
    });
    $(".com_moreu2,.com_two").hover(function () {
        $(".com_moreu2,.com_two").css("background-color", "#fff");
    }, function () {
        $(".com_moreu2,.com_two").css("background-color", "rgba(228, 228, 228, 0.12)");
    });

    $(".com_three,.com_moreu3").hover(function () {
        $(".com_moreu3").toggle();
    });
    $(".com_moreu3,.com_three").hover(function () {
        $(".com_moreu3,.com_three").css("background-color", "#fff");
    }, function () {
        $(".com_moreu3,.com_three").css("background-color", "rgba(228, 228, 228, 0.12)");
    });

    $(".com_four,.com_moreu4").hover(function () {
        $(".com_moreu4").toggle();
    });
    $(".com_moreu4,.com_four").hover(function () {
        $(".com_moreu4,.com_four").css("background-color", "#fff");
    }, function () {
        $(".com_moreu4,.com_four").css("background-color", "rgba(228, 228, 228, 0.12)");
    });
});
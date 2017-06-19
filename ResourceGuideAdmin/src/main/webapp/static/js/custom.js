/**
 * Created by hi.seungho on 2016-08-20.
 */

var timeout = 500;
var closetimer = 0;
var closetimer2 = 0;
var ddmenuitem = 0;
var ddmenuitem2 = 0;

function jsddm_open() {
    jsddm_canceltimer();
    jsddm_close();
    ddmenuitem = $(this).find('ul.sub_bar').eq(0).css('display', 'block');
    $('.header #menu_bg').css('display', 'block')
}

function jsddm_close() {
    if (ddmenuitem) ddmenuitem.css('display', 'none');
    $('.header #menu_bg').css('display', 'none');
}

function jsddm_timer() {
    closetimer = window.setTimeout(jsddm_close, timeout);
}

function jsddm_canceltimer() {
    if (closetimer) {
        window.clearTimeout(closetimer);
        closetimer = null;
    }
}

$(document).ready(function () {
    $('.menu_box > ul > li').bind('mouseover', jsddm_open);
    $('.menu_box > ul > li').bind('mouseout', jsddm_timer);
});

document.onclick = jsddm_close;

function jsddm_open2() {
    jsddm_canceltimer2();
    jsddm_close2();
    ddmenuitem2 = $(this).find('ul.sub_menu').eq(0).css('display', 'block');
}

function jsddm_close2() {
    if (ddmenuitem2) ddmenuitem2.css('display', 'none');
}

function jsddm_timer2() {
    closetimer2 = window.setTimeout(jsddm_close2, timeout);
}

function jsddm_canceltimer2() {
    if (closetimer2) {
        window.clearTimeout(closetimer2);
        closetimer2 = null;
    }
}

$(document).ready(function () {
    $('ul.sub_bar > li').bind('mouseover', jsddm_open2);
    $('ul.sub_bar > li').bind('mouseout', jsddm_timer2);
});

document.onclick = jsddm_close;

$(function () {
    var $menu = $('#quick_menu');

    $menu.stop().animate({
        right: "-200px",
    }, function () {
        $menu.addClass('quick_open');
        $('#quick_btn img').attr('src', '/img/main/quick_close.png');

        $menu.stop().animate({
            right: "-333px",
        }, function () {
            $menu.removeClass('quick_open');
            $('#quick_btn img').attr('src', '/img/main/quick_open.png');
        });
    });

    $('#quick_btn a').on('click', function (e) {
        e.preventDefault();

        if ($menu.hasClass('quick_open')) {

            $menu.stop().animate({
                right: "-333px",
            }, function () {
                $menu.removeClass('quick_open');
                $('#quick_btn img').attr('src', '/img/main/quick_open.png');
            });
        } else {

            $menu.stop().animate({
                right: "-200px",
            }, function () {
                $menu.addClass('quick_open');
                $('#quick_btn img').attr('src', '/img/main/quick_close.png');
            });
        }
    });
});
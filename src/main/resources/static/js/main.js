;$(function () {

    'use strict';

    /*返回顶部*/
    var back_to_top = $('.back-to-top');

    back_to_top.on('click',function(){
        $('html,body').animate({
            scrollTop:0
        },600)
    });

    $(window).on('scroll',function () {
        if($(window).scrollTop() > $(window).height()){
            back_to_top.fadeIn();
        }else{
            back_to_top.fadeOut();
        }
    })

    $(window).trigger('scroll');
})


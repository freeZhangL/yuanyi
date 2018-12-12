$(function () {
    // 轮播
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        autoplay: {
            delay: 3000,
            stopOnLastSlide: false,
            disableOnInteraction: false,
        },
    });

    // tab栏
    $(".tab-title").children("li").hover(function () {
        var idx = $(this).index();
        // console.log(idx);
        $(this).addClass("active").siblings().removeClass("active");
        $(".tab-con").children().eq(idx).addClass("active").siblings().removeClass("active");
    });
    //点击显示背景导航页面
    $(function () {
        FastClick.attach(document.body);
        var width=$(window).width();
        var height=$(window).height();
        $(".closeA").children("span").click(function () {
            $(".top_fd").fadeOut();
        });
        $(".nav1").children("span").click(function () {
            $(".top_fd").fadeIn(300).height(height);
        });
    });

    // //顶部固定导航栏
    // $(window).scroll(function () {
    //     var height = $(window).scrollTop();
    //     // console.log(height);
    //     if (height > 105) {
    //         $("nav").css({"position": "fixed", "top": 0});
    //         $(".swiper-container").css({"marginTop": 45});
    //     } else {
    //         $("nav").css({"position": "relative"});
    //         $(".swiper-container").css({"marginTop": 0});
    //     }
    // });


});
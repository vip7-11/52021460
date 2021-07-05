$(function(){
	var timer;
	var img = -1;
	var speed = 10000;
	var fOut = 500, fIn = 1000;
	var myImages = $(".list1 a");	
	$("#TopAD1").slideDown();
	
	$(".link1").append("<ul />");
	for(var i=1;i<=myImages.length;i++){
		$(".link1 ul").append("<li>"+i+"</li>");
	}

	//滑鼠點選頁籤切換
	$(".link1 li").click(function(){
		var idx = $(this).text() - 1;
		img = idx;
		//抓索引值
		var _link = myImages.eq(idx);
		//取得連結、標題、內文、日期...
		var adlink=_link.attr("href");
		var adtitle=_link.find("img").attr("title");
		var addate=_link.find("img").attr("rel");
		var adbody=_link.find("img").attr("alt");
		var adsrc=_link.find("img").attr("src");
		var adlink=_link.attr("href");
		var adtarget=_link.attr("target");
		
		/*淡入淡出效果*/
		$(".TopAdleft > *:not(.link1)").fadeOut(fOut, function(){
			$(".TopAdleft h2").find("a").attr({
				href: adlink,
				target: adtarget
			});
			$(".TopAdleft h2 a").html(adtitle);
			//post by minwt on←自可更換成張貼者的作者名稱 
			//$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);
			
			$(".TopAdleft .Adbody a").html(adbody);
			$(".TopAdleft .Adbody").find("a").attr({
				href: adlink,
				target: adtarget
			});
		}).fadeIn(fIn);
		$(".TopAdright1").fadeOut(fOut, function(){
			$(".TopAdright1").find("a").attr({
				href: adlink,
				target: adtarget
			});
			$(".TopAdright1").find("img").attr("src",adsrc);
		}).fadeIn(fIn);	
		
		$(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");		
	});

	//當滑鼠滑入區塊停止自動播放
	$("#TopAD1").hover(function(){
		clearTimeout(timer);
	}, function(){
		timer = setTimeout(autoShow, speed);
	});
	
	function autoShow(){
		img = (img+1<myImages.length) ? img+1 : 0;
		$(".link1 li").eq(img).click();
		timer = setTimeout(autoShow, speed);
	}

	autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list2 a");
    $("#TopAD2").slideDown();

    $(".link2").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link2 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link2 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link2)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright2").fadeOut(fOut, function () {
            $(".TopAdright2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright2").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD2").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link2 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list4 a");
    $("#TopAD4").slideDown();

    $(".link4").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link4 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link4 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link4)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright4").fadeOut(fOut, function () {
            $(".TopAdright4").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright4").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD4").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link4 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list5 a");
    $("#TopAD5").slideDown();

    $(".link5").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link5 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link5 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link5)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright5").fadeOut(fOut, function () {
            $(".TopAdright5").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright5").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD5").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link5 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list3 a");
    $("#TopAD3").slideDown();

    $(".link3").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link3 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link3 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link3)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright3").fadeOut(fOut, function () {
            $(".TopAdright3").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright3").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD3").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link3 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list6 a");
    $("#TopAD6").slideDown();

    $(".link6").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link6 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link6 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link6)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright6").fadeOut(fOut, function () {
            $(".TopAdright6").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright6").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD6").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link6 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list7 a");
    $("#TopAD7").slideDown();

    $(".link7").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link7 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link7 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link7)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright7").fadeOut(fOut, function () {
            $(".TopAdright7").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright7").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD7").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link7 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list8 a");
    $("#TopAD8").slideDown();

    $(".link8").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link8 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link8 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link8)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright8").fadeOut(fOut, function () {
            $(".TopAdright8").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright8").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD8").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link8 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list9 a");
    $("#TopAD9").slideDown();

    $(".link9").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link9 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link9 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link9)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright9").fadeOut(fOut, function () {
            $(".TopAdright9").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright9").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD9").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link9 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list10 a");
    $("#TopAD10").slideDown();

    $(".link10").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link10 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link10 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link10)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright10").fadeOut(fOut, function () {
            $(".TopAdright10").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright10").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD10").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link10 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list11 a");
    $("#TopAD11").slideDown();

    $(".link11").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link11 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link11 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link11)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright11").fadeOut(fOut, function () {
            $(".TopAdright11").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright11").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD11").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link11 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list12 a");
    $("#TopAD12").slideDown();

    $(".link12").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link12 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link12 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link12)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright12").fadeOut(fOut, function () {
            $(".TopAdright12").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright12").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD12").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link12 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});

$(function () {
    var timer;
    var img = -1;
    var speed = 10000;
    var fOut = 500, fIn = 1000;
    var myImages = $(".list13 a");
    $("#TopAD13").slideDown();

    $(".link13").append("<ul />");
    for (var i = 1; i <= myImages.length; i++) {
        $(".link13 ul").append("<li>" + i + "</li>");
    }

    //滑鼠點選頁籤切換
    $(".link13 li").click(function () {
        var idx = $(this).text() - 1;
        img = idx;
        //抓索引值
        var _link = myImages.eq(idx);
        //取得連結、標題、內文、日期...
        var adlink = _link.attr("href");
        var adtitle = _link.find("img").attr("title");
        var addate = _link.find("img").attr("rel");
        var adbody = _link.find("img").attr("alt");
        var adsrc = _link.find("img").attr("src");
        var adlink = _link.attr("href");
        var adtarget = _link.attr("target");

        /*淡入淡出效果*/
        $(".TopAdleft > *:not(.link13)").fadeOut(fOut, function () {
            $(".TopAdleft h2").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdleft h2 a").html(adtitle);
            //post by minwt on←自可更換成張貼者的作者名稱 
            //$(".TopAdleft .AdDate").html("Post by Minwt on"+addate);

            $(".TopAdleft .Adbody a").html(adbody);
            $(".TopAdleft .Adbody").find("a").attr({
                href: adlink,
                target: adtarget
            });
        }).fadeIn(fIn);
        $(".TopAdright13").fadeOut(fOut, function () {
            $(".TopAdright13").find("a").attr({
                href: adlink,
                target: adtarget
            });
            $(".TopAdright13").find("img").attr("src", adsrc);
        }).fadeIn(fIn);

        $(this).removeClass("off").addClass("on")
			.siblings().removeClass("on").addClass("off");
    });

    //當滑鼠滑入區塊停止自動播放
    $("#TopAD13").hover(function () {
        clearTimeout(timer);
    }, function () {
        timer = setTimeout(autoShow, speed);
    });

    function autoShow() {
        img = (img + 1 < myImages.length) ? img + 1 : 0;
        $(".link13 li").eq(img).click();
        timer = setTimeout(autoShow, speed);
    }

    autoShow();

});
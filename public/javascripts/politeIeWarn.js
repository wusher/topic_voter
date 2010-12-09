/* Polite ie warning  v1.1
* http://politeIeWarning.blogspot.com/
* Copyright 2010, nathaNJamal
* Dual licensed under the MIT or GPL Version 2 licenses.*/
(function ($) {
    $.fn.politeWarning = function (ver, msg) {
        if (!ver) ver = 7; //default warns on ie 7 and lower
        if (!msg) msg = 'Your browser is a little old. &nbsp; To see me in all my glory get a shiny new one!'; //default message

        //banner html
        var banner = '<div id="ieWarning"><br/><br/><span id="ieWarningTxt" class="shadow">' + msg + '</span> <a href="#" id="closeWarning" class="shadow">X</a><br/><br/></div>';

        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) { //test for MSIE x.x;
            var ieversion = new Number(RegExp.$1); // capture x.x portion and store as a number
            if (ieversion <= ver) {
                $('body').append(banner);
                $("#ieWarning").width($(window).width());
                setTimeout('$("#ieWarning").animate({"top":"0px"},1000);', 1500);
            }
        }

        //close btn
        $('#closeWarning').click(function () {
            $("#ieWarning").animate({ "top": "-85px" }, 500);
        });

    };
})(jQuery);   
	

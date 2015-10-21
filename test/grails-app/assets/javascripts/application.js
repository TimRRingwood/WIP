if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}



/*******************Sidebar collapse feature***************************/
var lcState = 1;
var b_canCollapse = true;

function toggleSideBar() {
    if(lcState == 1) {
        var ht = $("#leftCol").height();

        $("#leftCol").css({'white-space': 'nowrap', height: ht}).animate({width: "1px"},
            {queue: false} );
        $("#content").animate({marginLeft: '20px'}, {queue:false});
        $("#contentContainer").animate({backgroundPosition: '2px'}, {queue:false});
        $("#collapseLeftCol").animate({"left": "20px"}, {queue: false, complete: function() {$(".menu > h3").addClass('hide');}}).html("&gt;");

        lcState = 0;
    }
    else {
        $("#leftCol").animate({width: "180px"}, {queue: false, complete: function() {$("#leftCol").css({'height': '', 'white-space': ''});}});
        $("#content").animate({marginLeft: '220px'}, {queue:false});
        $("#contentContainer").animate({backgroundPosition: '200px'}, {queue:false});
        $("#collapseLeftCol").animate({"left": "218px"}, {queue: false}).html("&lt;");
        $(".menu > h3").removeClass('hide');
      // $("#leftCol").css('height', '');
        lcState = 1;
    }
    $.cookie('pieSideBarVisible', lcState);
}
/*******************End sidebar collapse ***************************/

/*****************Standard textbox lengths*********************/
var descLen = 4000;
var medDescLen = 2000;
var shortDescLen = 1000;
var shorterDescLen = 255;
/****************************End lengths *********************/

$(document).ready(function () {
alert("Application ready");
    /************Setup sidebar collapse state*****************/
    if($.cookie('pieSideBarVisible')) lcState = $.cookie('pieSideBarVisible');
    if(!b_canCollapse)  $("#collapseLeftCol").css('display', 'none');
    if(lcState == 0 && b_canCollapse) {
        $("#leftCol").css({width: "1px", whiteSpace: 'nowrap'});
        $("#content").css({marginLeft: "20px"});
        $("#contentContainer").css({backgroundPosition: '2px'});
        $("#collapseLeftCol").css({left: '20px'}).html("&gt;");
    }
    /************End collapse feature*****************************/

    /****************Site wide tooltip uniformity*****************/
    alert("AJS");
    $(".tip").each(function() {
        $(this).parent().tooltip({
            content: function() {return $(this).find(".tip").html();}  ,
            items: $(this).parent(),
            tooltipClass: "pieTooltip"
        })
    });

    $("[title]").tooltip({
        tooltipClass: "pieTooltip"
    });
    /*****************end tooltip functionality*********************/

    $(".countChar").charCount({allowed: descLen});
    $(".countCharShort").charCount({allowed: shortDescLen});
    $(".countCharShorter").charCount({allowed: shorterDescLen});

    $(".menu > ul > li > a").scrollLongText();

    initializeButtons();

});

function initializeButtons(container) {
    container = (typeof(container)==="undefined") ? $('body') : container;
    container.find("input[type=submit], input[type=button], button, .link-button").button();
}

function openUserPopup(userID)
{
    if(!$("#personPopup").length)  {
        $("<div id='userPopup'></div>").dialog({
            title: "User Information",
            dialogClass: 'dialog-dropShadow',
            autoOpen: false
        });
    }

    $.ajax({
        url:'User/popupInfo/'+userID,
        beforeSend: function() {
            $("#userPopup").html("");
        },
        success: function(data) {
            if($("#userPopup").dialog("isOpen") && !$("#userPopup").isFullyOnScreen()) {
                $("#userPopup").html(data).dialog('option', 'position', {my:'center', at:'center', of: window});
            }  else {
                $("#userPopup").html(data).dialog('open');
            }
        }
    });
}

function loadAjaxFormPage(p_url) {
    var tx = "<div id='ajaxPage'></div>" ;
    if(!$("#ajaxPage").length)  {
        $('body').append(tx);
        $("#ajaxPage").html("<div class='ajax-loader'>&nbsp;</div>")
            .dialog({
                modal: true,
                title: 'Loading...',
                autoOpen: true,
                width: '50%',
                height:'auto',
                dialogClass: 'dialog-dropShadow',
                buttons: {"Done": function() {
                    $(this).dialog("close");
                }}
        });
    }
    else {
        $("#ajaxPage").dialog('open')
            .dialog('option', 'title', 'Loading...');
    }

    $.ajax({
        url:p_url,
        beforeSend: function() {
            $("#ajaxPage").html("<div class='ajax-loader'>&nbsp;</div>");
        },
        success: function(data) {

            $("#ajaxPage").dialog('option', 'title', $(data).filter('title').text())
               .html(data).dialog('open');
            $("#ajaxPage").find('form').submit(function(e){
                e.preventDefault();
                $.post($(this).attr("action") ,
                     $(this).serialize(),
                    function(data) {$("#ajaxPage").html(data);});
            });
            initializeButtons($("#ajaxPage"));

        }
    });
}

function getControl(ctrl) {
    var c;
    if(typeof(ctrl) === "string") {
        c = $("#"+ctrl).get(0);
        if(!c) c = $("[name='"+ctrl+"']").get(0);
    } else c = ctrl;

    return c;
}

function disableControl(ctrl, disable) {
    ctrl = getControl(ctrl);
    ctrl.disabled = disable;
    return true;
}

function setVisibility(ctrl, visible) {
    ctrl = getControl(ctrl);
    ctrl.style.visibility = visible ? 'visible' : 'hidden';
}

function setDisplay(ctrl, visible) {
    ctrl = getControl(ctrl);
    ctrl.style.display = visible ? 'block' : 'none';
}

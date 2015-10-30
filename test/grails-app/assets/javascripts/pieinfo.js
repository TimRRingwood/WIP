var shortDescLen = 1000;

function pieSetup() {  

   try {
       $(".cal").datepicker( {
	      showOn: "button",
	      buttonImage: "/test/assets/cal.gif",
	      buttonImageOnly: false,
	      dateFormat: 'mm/dd/yy'
       });
       
       $(".cal2").datepicker( {
	      showOn: "button",
	      buttonImage: "/test/assets/cal.gif",
	      buttonImageOnly: false,
	      dateFormat: 'mm/dd/yy'
       });
       
       $(".tip").each(function() {
	       $(this).parent().tooltip({
		       content: function() {return $(this).find(".tip").html();}  ,
			   items: $(this).parent(),
			   tooltipClass: "pieTooltip"
			})
	   });
	   
	    
	   $(".countCharShort").charCount({allowed: shortDescLen});
	   
	   
      
   }
   catch(e) {
     alert(e.message);
   }
   

}

function dualTrigger() {
     if($("#dualCitizen").prop('checked')) {
          $("#2Citizen").removeClass('hidden');
      }
      else {
         $("#2Citizen").addClass('hidden');
      }

}

// Stolen from current site; appeaers coded where show means hide
// Since I didn't fully understand it I left it alone!
function toggleCitizen() { 
	   var v = $("#citizen1").val();
       var show = v == "1";
       v = $("#citizen2").val();
       show = show || (v == "1");
       if (show) $(".alien").addClass('hidden');
       else $(".alien").removeClass('hidden');
 }

function togglePOC() {
	var show = $('input[name=isGovEmp]:checked').val();
    if (show == "false"){ 
       $(".poc").removeClass('hidden');
    }
    else {
       $(".poc").addClass('hidden');
    }

 }
 
 var textValidation = function(e){ 

    var id = e.target.id;
    var selector = "#" + id;
    var errorSelector =  "#fieldError" + id;

    var val = $(selector).val();
    try {

     var isGovEmp = $('input[name=isGovEmp]:checked').val();
     var parameters = {
            field: id,
            value: val,
            citizen1: $("#citizen1").val(),
            citizen2: $("#citizen2").val(),
            isGovEmp: isGovEmp
        }

	    $.ajax({
            url: '/test/infoUsers/validate',
            type: 'post',
            dataType: 'text',
            success: function (data) {
                if (data) {
	                addErrorToSelector(id, data)
                }
                else {
                    $(selector).removeClass("errorField");
	                $(selector).removeAttr('title', '');
	                $(errorSelector).remove();
                }
            },
            data: parameters
        });  
    }
    catch(e) {
        alert(e.message);
    }
 };
 
 function addErrorToSelector(fn, data) {
     var selector = "#"+fn;
     var label = $(selector).attr("label");

     if (typeof label == 'undefined' ) { 
        label = fn;
     }
     $(selector).addClass("errorField");
     $(selector).attr('title', data);
     data = "<a href=\"#" + fn + "\">"+data+"</a>"
     var errorId = "fieldError"+ fn;
     var obj = $("#" + errorId)[0];
     if (typeof obj == 'undefined' ) {
	     $('#errors').append($("<div id=\""+ errorId + "\" class=\"errorText\"></div>").html(data));
	 }
	 else {
	     $("#"+errorId).html(data)
	 }
 }
 
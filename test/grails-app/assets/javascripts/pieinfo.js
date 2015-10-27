var shortDescLen = 1000;


function pieSetup() {  

   try {
       $(".cal").datepicker( {
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

function toggleCitizen() { 
    try {
	   var v = $("#citizen1").val();
       var show = v == "1";
       v = $("#citizen2").val();
       show = show || (v == "1");
       if (show) $(".alien").addClass('hidden');
       else $(".alien").removeClass('hidden');
    }
    catch(e) {
         //alert(e.message);
    }
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
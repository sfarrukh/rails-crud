// Table rows color
	$(function(){
		$("tr:even").css("background", "#DCDCDC");
	});

	

// Search box onblur onfocus
	$(function(){
    $("input").focus( function() {
        if ( $(this).val()=="Search") {
            $(this).val('');
        } 
    });

    $("input").blur( function() {
        if ( $(this).val()=="") {
            $(this).val("Search");
        } 
    });
  });


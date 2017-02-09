// Javascript -- working
	// function hello(smth) {
	// 	alert("Hello, " + smth + "!");
	// }

// jQuery -- working
	// $("document").ready(function() {
	// 	$("#actors").css("border", "3px solid red");
	// });

// Ajax -- working
	
	// Select actor
	function selectedActor(str) {
	  var xhttp;    
	  if (str == "") {
	    document.getElementById("actors").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("actors").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "actors/"+str, true);
	  xhttp.send();
	}


	// Select film
	function selectedFilm(str) {
	  var xhttp;    
	  if (str == "") {
	    document.getElementById("actors").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("actors").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "films/"+str, true);
	  xhttp.send();
	}

// jQuery Ajax
// Synchronous XMLHttpRequest on the main thread is deprecated because of its detrimental effects to the end user's experience
	
	// function ajaxCall(str){
	// 	$(document).ready(function(){
	// 	    $("select").change(function(){
	// 	        $.ajax({url: "actors/"+str, success: function(result){
	// 	            $("#actors").html(result);
	// 	        }});
	// 	    });
	// 	});
	// };





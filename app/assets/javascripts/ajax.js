	
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

// Search films from within actors

	// function searchMovies(str){
	// 	alert("You just typed "+ str);
	// }

	function searchMovies(str, id) {
	  var xhttp;    
	  if (str == "") {
	    document.getElementById("films").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("films").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", id+"/films?film_search="+str, true)
	  xhttp.send();
	}

	// function unlink(a, b){
	// 	alert("Hello "+ a + " " + b);
	// }

	function unlink(actorId, filmId){
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", actorId+"/unlink?film_id="+filmId, true)
		xhttp.send()
	}

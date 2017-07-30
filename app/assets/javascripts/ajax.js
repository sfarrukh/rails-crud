	
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


	// Selected Letter
	// function selectedLetter(letter) {
	// 	alert(letter);
	// }

	function selectedLetter(letter) {
	  var xhttp;    
	  if (letter == "") {
	    document.getElementById("actors").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("actors").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "actors/letter?first_letter="+letter, true)
	  xhttp.send();		
	}


	// Search Actors (admin/actors/search)
	function searchActors(str) {
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
	  // really had to work on to figure out not to put '/' in front of '/actors' ))
	  xhttp.open("GET", "actors/search?actor_search="+str, true)	
	  xhttp.send();
	}

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
	  // xhttp.open("GET", "/films?film_search="+str, true)
	  xhttp.send();
	}

	// Unlink film from actor(ress)

	// function unlink(a, b){
	// 	alert("Hello "+ a + " " + b);
	// }

	function unlink(actorId, filmId){
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", actorId+"/unlink?film_id="+filmId, true)
		xhttp.send()
		
	}


	// Link film to actor(ress)

    // function link(actorId, filmId){
    //     alert(actorId + " " + filmId);
    // }

    function link(actorId, filmId){
    	var xhttp = new XMLHttpRequest();
    	xhttp.open("POST", actorId+"/link?film_id="+filmId, true)
    	xhttp.send()
    }

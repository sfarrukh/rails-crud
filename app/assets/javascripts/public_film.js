	// Look up films by letter
	function publicSelectedFilmLetter(letter) {
	  var xhttp;    
	  if (letter == "") {
	    document.getElementById("films").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("films").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "public/letter?first_letter="+letter, true)
	  xhttp.send();		
	}

	// Search Films (admin/films/search)
	function publicSearchFilms(str) {
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
	  // really had to work on to figure out not to put '/' in front of '/actors' ))
	  xhttp.open("GET", "public/search?film_search="+str, true)	
	  xhttp.send();
	}
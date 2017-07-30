
	function selectedLetterCustomer(letter) {
	  var xhttp;    
	  if (letter == "") {
	    document.getElementById("customers").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("customers").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "customers/letter?first_letter="+letter, true)
	  xhttp.send();		
	}

	// Search Actors (admin/customers/search)
	function searchCustomers(str) {
	  var xhttp;    
	  if (str == "") {
	    document.getElementById("customers").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("customers").innerHTML = this.responseText;
	    }
	  };
	  // really had to work on to figure out not to put '/' in front of '/actors' ))
	  xhttp.open("GET", "customers/search?customer_search="+str, true)	
	  xhttp.send();
	}
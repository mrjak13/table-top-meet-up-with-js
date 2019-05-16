$(function () {
	alphaButtonClick();	
})

function alphaButtonClick() {
	$('#alpha-ajax-get-locations').on('click', function(e) {
		
		getAlphaLocations();
	})
}

function getAlphaLocations() {
	$.get('/locations.json', function(locations){
		locations.sort(function(a, b) {
		  var nameA = a.name.toUpperCase(); // ignore upper and lowercase
		  var nameB = b.name.toUpperCase(); // ignore upper and lowercase
		  if (nameA < nameB) {
		    return -1;
		  }
		  if (nameA > nameB) {
		    return 1;
		  }

		  // names must be equal
		  return 0;
		});

		locations.forEach(function(location){
			
			$('#ajax-list-locations').append(locationHtml(location))
		})
		locationLinkClick()
	})
}
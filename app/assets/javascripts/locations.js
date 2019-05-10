
$(function () {
	locationsClick();	
}

function locationsClick() {
	$('button#ajax-get-locations').on('click', function(event){
		event.preventDefault();
		console.log('clicked a thing in my project woo!');
		getLocations();
	})
}

function getLocation() {

}

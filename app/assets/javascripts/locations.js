
$(function () {
	console.log('loaded locations.js...')
	locationsClick();	
})

function locationsClick() {
	$('button#ajax-get-locations').on('click', function(event){
		event.preventDefault();
		console.log('clicked a thing in my project woo!');
		getLocation();
	})
}

function getLocation() {

	$.ajax({
		url: 'http://localhost:3000/locations',
		method: 'get',
		datatype: 'json'
	}).done(function (data) {
		debugger;
	})
}

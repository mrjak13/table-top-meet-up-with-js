
$(function () {
	console.log('loaded locations.js...')
	locationsClick();	
})

function locationsClick() {
	$('button#ajax-get-locations').on('click', function(event){
		event.preventDefault();
		console.log('clicked a thing in my project woo!');
		getLocation();
		rmvButton();
	})
}

function getLocation() {
	// 
	// COULD NOT GET AJAX REQUEST TO WORK W/O .JSON.. TRY WITH MEET UP TYPES 
	// 
	// $.ajax({
	// 	method: "GET",
	// 	url: "http://localhost:3000/locations",
	// 	datatype: "json"
	// }).done(function (data) {
	// 	debugger;
	// })
	$.get('/locations.json', function(data){
		data.forEach(function(location){
			let html = locationHtml(location)
			$('#ajax-list-locations').append(html)
		})
		locationLinkClick();
	})
}

function locationHtml(location) {
	return `<li><a href="/locations/${location.id}">${location.name}</a><ul id="location id ${location.id}"><ul></li>`
}


function rmvButton() {
	$('button#ajax-get-locations').remove();
}

function locationLinkClick() {
	$('#ajax-list-locations a').on('click', function(e) {	
		e.preventDefault();
		debugger;
	})
}
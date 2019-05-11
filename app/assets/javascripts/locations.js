
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
	return `
	<li>
		<a href="/locations/${location.id}">${location.name}</a>
		<ul id="location id ${location.id}"><ul>
	</li>`
}


function rmvButton() {
	$('button#ajax-get-locations').remove();
}

function locationLinkClick() {
	$('#ajax-list-locations a').on('click', function(e) {	
		e.preventDefault();
		getLocationShow(this.href);
	})
}

function getLocationShow(url) {
	$.get(`${url}.json`, function(location){
		var newLocation = new Location(location)
		var locationHTML = newLocation.formatHTML();
		addLocatoinHTMLToDom(location.id, locationHTML)
	})
}

function Location(obj) {

	this.id = obj.id
	this.name = obj.name
	this.address_1 = obj.address_1
	this.address_2 = obj.address_2
	this.city = obj.city
	this.state = obj.state
	this.zip = obj.zip
	this.meetUps = obj.meet_ups

}

Location.prototype.formatHTML = function() {
	return `
	<p>${this.address_1}, ${this.city}, ${this.zip} ${this.address_2}</p>
	<br>
	<p>Number of events<strong>${this.meetUps.length}</strong></p>
	`
}

function addLocatoinHTMLToDom(id, html) {
	debugger;
}
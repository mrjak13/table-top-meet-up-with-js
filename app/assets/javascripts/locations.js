
$(function () {
	locationsClick();
	// formSubmit();	
})

function locationsClick() {
	$('button#ajax-get-locations').on('click', function(event){
		event.preventDefault();
		getLocation();
		changeButton();
	})
}

function getLocation() {
	// 
	// COULD NOT GET AJAX REQUEST TO WORK W/O .JSON
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
	<li class="subtitle">
		<a href="/locations/${location.id}">${location.name}</a>
		<li id="location-id-${location.id}"><li>
	</li>`
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
	<p>Number of events: <strong>${this.meetUps.length}</strong></p>
	<br>
	`
}

function addLocatoinHTMLToDom(id, html) {
	$(`#location-id-${id}`)[0].innerHTML = html
}

function changeButton() {
	rmvButton();
	var newLocationButton = `
	<button id="new-location-button" class="button is-warning">New Location</button>
	`
	$('div#location-button-div').append(newLocationButton)
	newLocationFormClick();
}

function rmvButton() {
	$('button#ajax-get-locations').remove();
}

function newLocationFormClick() {
	$('button#new-location-button').on('click', function(e) {
		e.preventDefault();
		insertForm();
		formSubmit();
	})
}

function insertForm() {
	var formHTML = locationFormHTML()
	$('div#location-form')[0].innerHTML = formHTML
}

function formSubmit() {
	$('form#new_location').on('submit', function(e) {
		e.preventDefault();
		var params = $(this).serialize()
		postForm(params);
	})
}

function postForm(params) {
	$.post('/locations', params).done(function(data) {
		// insertForm();
		$('ul#ajax-list-locations li').remove()
		getLocation();
	})	
}

function locationFormHTML() {
	return `
	<form class="new_location" id="new_location" action="/locations" method="post">
				<input name="utf8" type="hidden" value="✓">
				<input type="hidden" name="authenticity_token" value="RHpviD+2f34Ukhp3cMXRDW5KZJHhDFCcxyEXaA43J7rimkV/3Dvmw75oWMZ0ZJZ3MTKhAMM5EXvDONcEFBlMhw==">
				<label class="label">Name</label>
				<div class="control">
					<input placeholder="Comics R' Us" class="input" type="text" name="location[name]" id="location_name">					
				</div>

				<label class="label">Address 1</label>
				<div class="control">			
					<input placeholder="123 Smith St." class="input" type="text" name="location[address_1]" id="location_address_1">		
				</div>

				<label class="label">Address 2</label>
				<div class="control">			
					<input placeholder="Room A" class="input" type="text" name="location[address_2]" id="location_address_2">		
				</div>

				<label class="label">City</label>
				<div class="control">	
					<input placeholder="New York" class="input" type="text" name="location[city]" id="location_city">
				</div>

				<label class="label">State</label>
				<div class="control">			
					<input placeholder="NY" class="input" type="text" name="location[state]" id="location_state">		
				</div>


				<label class="label">Zip</label>
				<div class="control">			
					<input placeholder="12345" class="input" type="text" name="location[zip]" id="location_zip">		
				</div><br>
				<input type="submit" name="commit" value="Submit" class="button" data-disable-with="Submit">
	</form>
	`
}
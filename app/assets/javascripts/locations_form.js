function changeButton() {
	rmvButton();
	var newLocationButton = `
	<button id="new-location-button" class="button is-warning">New Location</button>
	`
	$('div#location-button-div').append(newLocationButton)
	newLocationFormClick();
}

function newLocationFormClick() {
	$('button#new-location-button').on('click', function(e) {
		insertForm();
		jsFormSubmit();
	})
}

const insertForm = () => $('div#location-form')[0].innerHTML = locationFormHTML()

function jsFormSubmit() {
	$('form#js_new_location').on('submit', function(e) {
		e.preventDefault(); 
		postForm($(this).serialize());
	})
}

function postForm(params) {
	$.post('/locations', params)
	.done(function(data) {
		$('ul#ajax-list-locations li').remove()
		getLocation();
	})	
}

function locationFormHTML() {
	return `
	<form class="new_location" id="js_new_location" action="/locations" method="post">
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
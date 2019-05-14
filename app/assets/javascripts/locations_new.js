$(function () {
	formSubmit();	
})

function formSubmit() {
	$('form#new_location').on('submit', function(e) {
		e.preventDefault(); 
		postFormNewPage($(this).serialize());
	})
}

function postFormNewPage(params) {
	$.post('/locations', params)
	.done(function(data) {
		$('ul#recent-locations')[0].innerHTML += new Location(data).formatNameHTML();
	})
	clearForm();
}

function clearForm() {
	$('input#location_name')[0].value = ""
	$('input#location_address_1')[0].value = ""
	$('input#location_address_2')[0].value = ""
	$('input#location_city')[0].value = ""
	$('input#location_state')[0].value = ""
	$('input#location_zip')[0].value = ""
}
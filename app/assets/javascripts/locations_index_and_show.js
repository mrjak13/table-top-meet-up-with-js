
$(function () {
	locationsClick();	
})

function locationsClick() {
	$('button#ajax-get-locations').on('click', function(event){
		getLocation();
		rmvButton();
		// changeButton();
	})
}

function getLocation() {
	$.get('/locations.json', function(data){
		data.forEach(function(location){
			$('#ajax-list-locations').append(locationHtml(location))
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
		addLocatoinHTMLToDom(location.id, new Location(location).formatHTML())
	})
}

const addLocatoinHTMLToDom = (id, html) => $(`#location-id-${id}`)[0].innerHTML = html

const rmvButton = () => $('button#ajax-get-locations').remove();

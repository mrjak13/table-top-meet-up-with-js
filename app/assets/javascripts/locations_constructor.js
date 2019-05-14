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

Location.prototype.formatNameHTML = function() {
	return `
	<li><strong>${this.name}</strong></li>
	`
}
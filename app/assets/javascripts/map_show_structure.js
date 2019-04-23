$(".structures.show").ready {
  var mymap = L.map('mapid').setView([<%= @structure.lat.to_s + ", " + @structure.lng.to_s %>], 14);
  var marker = L.marker([<%= @structure.lat.to_s + ", " + @structure.lng.to_s %>]).addTo(mymap);

	marker.bindPopup("<b><%= @structure.name %></b><br/><%= @structure.full_address %>").openPopup();

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoiYXZuZDI2IiwiYSI6ImNqdXUwamMwNTBjcDA0YW52ODM1Nnp5OW4ifQ.X2B60gqbpNhbYZvIkhsZRg'
	}).addTo(mymap);
}


document.addEventListener("turbolinks:load", function(){
    
    var map = new GMaps({
        div: '#map',
        lat: 48.856614,
        lng: 2.3522219
    });

    window.map = map 

    var markers = JSON.parse(document.querySelector("#map").dataset.markers)

    if (typeof markers.length === 'undefined')
    {
        if(!markers.latitude && !markers.longitude) return; 
        var marker = map.addMarker({
        lat: markers.latitude,
        lng: markers.longitude,
        title: markers.address,
        infoWindow: {
            content: `<p><a href="/transactions/${markers.id}">${markers.address}</a></p>`
        }
        });
    }else
    {
        markers.forEach(element => {
            if(!element.latitude && !element.longitude) return; 
            var marker = map.addMarker({
            lat: element.latitude,
            lng: element.longitude,
            title: element.address,
            infoWindow: {
                content: `<p><a href="/transactions/${element.id}">${element.price}€</a></p>`
            }
            });
        });
    }
});
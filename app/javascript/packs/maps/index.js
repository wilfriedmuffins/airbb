console.log("load");

document.addEventListener("turbolinks:load", function(){
    console.log("turbolinks loads....")
    var map = new GMaps({
        div: '#map',
        lat: 48.856614,
        lng: 2.3522219
    });

    window.map = map 

    var l = JSON.parse(document.querySelector("#map").dataset.l)
    window.l = l


    l.forEach(element => {
        if(!element.latitude && !element.longitude) return; 
        var marker = map.addMarker({
        lat: element.latitude,
        lng: element.longitude,
        title: element.address,
        infoWindow: {
            content: `<p><a href="/transactions/${element.id}">${element.address}</a></p>`
        }
        });
    });

});
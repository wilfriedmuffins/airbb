
import { each } from "jquery";
import { Controller } from "stimulus"
export default class extends Controller {
    static targets = ["map", "longitude", "latitude", "output"]
    static values = {latlng: Array}

    initialize() {

        // console.log(this.latlngValue[0][0]);
        // console.log(this.latlngValue[0][1]);

        if (typeof(google) != "underfined"){
            this.initMap()
        }
    }

    initMap(){
        //The map, centered at Paris
        this.map = new google.maps.Map(this.mapTarget, {
        zoom: 12,
        center: {
            lat: 48.856614,
            lng: 2.3522219
        }
        });

        
        // The marker, positioned at Uluru
        this.marker = new google.maps.Marker({
            //location of the marker
            position:{ lat: this.latlngValue[0][0], lng: this.latlngValue[0][1]},
            //which to place the marker.
            map: this.map,
            //ancharPoint : new google.maps.Point(0, -29)
        });
    }
}



//   //Initialize and add the map
//   // initMap() {
//   //   // console.log(typeof this.latlngValue)
//   //   // console.log(this.latlngValue)
    
    
//   // }


//   /*afficher la map centrer à LatLng(50.5, 8.35) et zoom de 5*/
//   //   initMap() {
//   //     this.map = new google.maps.Map(this.mapTarget, {
//   //       center: new google.maps.LatLng(50.5, 8.35),
//   //       zoom: 5,
//   //     })

//   //     this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
//   //     this.autocomplete.bindTo('bounds', this.map)
//   //     this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
//   //     this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

//   //   this.marker = new google.maps.Marker({
//   //     map: this.map,
//   //     ancharPoint : new google.maps.Point(0, -29)
//   //   })
//   // }

//   // placeChanged(){
//   //   let place = this.autocomplete.getPlace()

//   //   if(!place.geometry) {
//   //     window.alert('no details available for input: ${place.name}')
//   //     return
//   //   }

//   //   if(place.geometry.viewport){
//   //     this.map.fitBounds(place.geometry.viewport)
//   //   } else{
//   //     this.map.setCenter(place.geometry.viewport)
//   //     this.map.setZoom(17)
//   //   }

//   //   this.marker.setPosition(place.geometry.location)
//   //   this.marker.setVisible(true)

//   //   this.latitudeTarget.value = place.geometry.location.lat()
//   //   this.longitudeTarget.value = place.geometry.location.lng()

// //}
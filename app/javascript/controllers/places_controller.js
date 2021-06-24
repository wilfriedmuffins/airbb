
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["map", "longitude", "latitude", "log"]
  static values = {lt: Number, lng: Number, lat: String}
  


  connect() {
    //console.log(this.latValue)

    this.tableau(this.latValue)

    // console.log(this.latValue)
    // console.log(this.lngValue)


    //const logement = {lat: this.latValue, lng: this.lngValue };
  
    // if (typeof(google) != "underfined"){
    //   this.initMap()
    // }
  }

  tableau(w){
    var location = [] ;
    var a = location.push(w)
    console.log(location);
  
    console.log("in tableau");

    var b = location.toString().split(",") //  ["btrbt"] //bntrn location.split('')
    console.log(b);
  }

//Initialize and add the map
  initMap() {
    
    // The location of map
    const locations = [
      {lat: 46.233226, lng: 6.055737},
    ];

    // The map, centered at Paris
    this.map = new google.maps.Map(this.mapTarget, {
      zoom: 12,
      center:{
              lat:  48.856614,
              lng: 2.3522219	
            }
    });

    // The marker, positioned at Uluru
    this.marker = new google.maps.Marker({
      //location of the marker
      position: {lat: this.latValue, lng: this.lngValue},
      //which to place the marker.
      map: this.map,
      //ancharPoint : new google.maps.Point(0, -29)
    });

  }
  //   for (let index = 0; index < locations.length; index++){
  //     // The marker, positioned at Uluru
  //     this.marker = new google.maps.Marker({
  //       //location of the marker
  //       position: locations[index],
  //       //which to place the marker.
  //       map: this.map,
  //       //ancharPoint : new google.maps.Point(0, -29)
  //     });

  //   }
    
//}


/*afficher la map centrer à LatLng(50.5, 8.35) et zoom de 5*/
  //   initMap() {
  //     this.map = new google.maps.Map(this.mapTarget, {
  //       center: new google.maps.LatLng(50.5, 8.35),
  //       zoom: 5,
  //     })

  //     this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
  //     this.autocomplete.bindTo('bounds', this.map)
  //     this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
  //     this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

  //   this.marker = new google.maps.Marker({
  //     map: this.map,
  //     ancharPoint : new google.maps.Point(0, -29)
  //   })
  // }

    // placeChanged(){
    //   let place = this.autocomplete.getPlace()

    //   if(!place.geometry) {
    //     window.alert('no details available for input: ${place.name}')
    //     return
    //   }

    //   if(place.geometry.viewport){
    //     this.map.fitBounds(place.geometry.viewport)
    //   } else{
    //     this.map.setCenter(place.geometry.viewport)
    //     this.map.setZoom(17)
    //   }

    //   this.marker.setPosition(place.geometry.location)
    //   this.marker.setVisible(true)

    //   this.latitudeTarget.value = place.geometry.location.lat()
    //   this.longitudeTarget.value = place.geometry.location.lng()

    // }
}


import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["output", "adresse", "field", "map", "latitude", "longitude"]
  static values = { number: String }


  //   connect() {
  //     if (typeof(google) != "underfined"){
  //       this.initMap()
  //     }
  //   }

  // /*afficher la map centrer à LatLng(50.5, 8.35) et zoom de 5*/
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

  //   placeChanged(){
  //     let place = this.autocomplete.getPlace()

  //     if(!place.geometry) {
  //       window.alert('no details available for input: ${place.name}')
  //       return
  //     }

  //     if(place.geometry.viewport){
  //       this.map.fitBounds(place.geometry.viewport)
  //     } else{
  //       this.map.setCenter(place.geometry.viewport)
  //       this.map.setZoom(17)
  //     }

  //     this.marker.setPosition(place.geometry.location)
  //     this.marker.setVisible(true)

  //     this.latitudeTarget.value = place.geometry.location.lat()
  //     this.longitudeTarget.value = place.geometry.location.lng()

  //   }

  connect() {
    // this.outputTarget.textContent = "Hello, Stimulus!"
    // console.log("connecter", this.element);
    // // console.log("Hello, Wilfried!", this.element)

    // const element = this.adresseTarget
    // const field = element.value
    // console.log(`Hello, ${field}!`)
   // this.outputTarget.textContent = 
    console.log(this.numberValue)

  }



  // Initialize and add the map
  // initMap() {


  //   // The location of map
  //   const locations = [
  //     {lat: 46.233226, lng: 6.055737},
  //     {lat: 46.2278, lng: 6.0510},
  //     {lat: 46.23336, lng: 6.0471}
  //   ];
  //   // The map, centered at Uluru
  //   this.map = new google.maps.Map(this.mapTarget, {
  //     zoom: 13,
  //     center:{
  //             lat: 46.231226,
  //             lng: 6.051737
  //           }
  //   });

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


  //   // // The marker, positioned at Uluru
  //   // this.marker = new google.maps.Marker({
  //   //   //location of the marker
  //   //   position: {lat: 46.2278, lng: 6.0510},
  //   //   //which to place the marker.
  //   //   map: this.map,
  //   //   //ancharPoint : new google.maps.Point(0, -29)
  //   // });
  // }

}


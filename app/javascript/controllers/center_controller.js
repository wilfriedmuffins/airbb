import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "map", "latitude", "longitude"]
    static values = {
      markers : Array, 
      latitude : Number,
      longitude : Number}

    initialize() {

      console.log(this.latitudeValue)
      console.log(this.longitudeValue);

      this.map = new google.maps.Map(this.mapTarget, {
        center: { lat: this.latitudeValue, lng: this.longitudeValue},
        zoom: 10,
      });

      this.markersValue.forEach((markers) => {
        console.log(markers.latitude);
        console.log(markers.longitude);
        const marker = new google.maps.Marker({
          position: { lat: markers.latitude, lng: markers.longitude },
          map: this.map,
          title: `${markers.title}`,
          label: `${markers.price}€`,
          optimized: false,
        })
      })

    }
}



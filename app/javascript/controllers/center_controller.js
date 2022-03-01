import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "map", "latitude", "longitude"]
    static values = {
      markers : Array, 
      latitude : Number,
      longitude : Number}

    initialize() {

      this.map = new google.maps.Map(this.mapTarget, {
        center: { lat: this.latitudeValue, lng: this.longitudeValue },
        zoom: 12,
      });

      this.markersValue.forEach((markers) => {
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



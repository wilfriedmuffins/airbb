import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "map"]//latitude", "longitude"]
    static values = {
      markers : Array}
      // , 
      // latitude : Number,
      // longitude : Number}

    initialize() {

      console.log("in initialize");

      console.log(markers.latitude,markers.latitude);

      this.map = new google.maps.Map(this.mapTarget, {
        center: { lat: 48.856614 , lng: 2.3522219 },
        zoom: 12,
      });

      // this.markersValue.forEach((markers) => {
      //   const marker = new google.maps.Marker({
      //     position: { lat: markers.latitude, lng: markers.latitude },
      //     map: this.map,
      //     title: `${markers.title}`,
      //     label: `${markers.price}€`,
      //     optimized: false,
      //   })
      //  
      // })

    }
}



import { Controller } from "stimulus"
export default class extends Controller {
    static targets = ["city", "latitude", "longitude",]

    initialize(){

        this.autocomplete = new google.maps.places.Autocomplete(this.cityTarget);
        this.autocomplete.addListener('place_changed', this.placeChanged.bind(this));

    }

    placeChanged(){
        let place = this.autocomplete.getPlace();
        let longitude = place.geometry.location.lng()
        let latitude = place.geometry.location.lat() 
  
        this.latitudeTarget.value = place.geometry.location.lat()
        this.longitudeTarget.value = place.geometry.location.lng()
  
        console.log(this.place.geometry.location.lat())
        console.log(this.place.geometry.location.lng())
    }
    

}


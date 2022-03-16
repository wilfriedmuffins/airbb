import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "price_logement", "t_price", "depart", "arrivé"]
    
    initialize() {

      
        this.prixTarget.value =
        
        this.longitudeTarget.value = place.geometry.location.lng()


      // console.log(this.longitudeValue);

    }
}



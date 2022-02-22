
import { each } from "jquery";
import { Controller } from "stimulus"
export default class extends Controller {
    static targets = ["map", "longitude", "latitude", "output"]
    static values = {latlng: Array}

    initialize() {

    }
}



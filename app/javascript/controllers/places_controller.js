
import { each } from "jquery";
import { Controller } from "stimulus"
export default class extends Controller {
    static targets = ["city"]

    // initialize() {
    //     const element = this.cityTarget
    //     const city = element.value
    //     console.log(`Hello, ${city}!`)
    //     console.log(this.cityTarget.value);
    //     console.log("Hello, Stimulus!", this.element)
    // }

    copy() {
        // const element = this.cityTarget
        // const city = element.value
        // console.log(`Hello, ${city}!`)
        // console.log(this.cityTarget.value);
        console.log("Hello, Stimulus!", this.element)
    }

    
}



// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import flatpickr from "flatpickr";
require("flatpickr/dist/themes/airbnb.css");

document.addEventListener("turbolinks:load", () => {
    flatpickr("[class='flatpickr_1']", {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "y-m-d",
        mode: 'range',
    }),
        flatpickr("[class='flatpickr_2']", {
            altInput: true,
            altFormat: "F j, Y",
            dateFormat: "y-m-d",
            mode: 'range',
        })

    $(".dropbtn").on("click", function () {
        $(".dropdown-content").toggleClass("show");
    });

})




/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)




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
    $(".dropbtn").on("click", function () {
        $(".dropdown-content").toggleClass("show");
    }),

    // $(".search").on("click", function () {
    //     $(".title-buttton").toggleClass("show-label"),
    //     $(".adresse").toggleClass("raduis");
    // });
    // $(".hebergement-dropdown").on("click", function () {
    //     $(".input-voyageur").show();
    //     $(".border-3").show();
    // }),
    // $(".experience-dropdown").on("click", function () {
    //     $(".input-voyageur").hide();
    //     $(".border-3").hide();
    // }),
    
    $('.modal_sign_in').on("click", function(){
        $(".modalSign_in").show();//toggleClass("show_modal_open");
    }),

    $('.close').on("click", function(){
        $(".modalSign_in").hide();
    })
    ;

})

import "controllers"

window.initMap = function(...args) {
    const event = document.createEvent("Events")
    event.initEvent("google-maps-callback", true, true)
    event.args = args
    window.dispatchEvent(event)
}


// // Get the modal
// var modal = document.getElementById("myModal");

// // Get the button that opens the modal
// var btn = document.getElementById("myBtn");

// // Get the <span> element that closes the modal
// var span = document.getElementsByClassName("close")[0];

// // When the user clicks on the button, open the modal
// btn.onclick = function() {
//   modal.style.display = "block";
// }

// // When the user clicks on <span> (x), close the modal
// span.onclick = function() {
//   modal.style.display = "none";
// }

// // When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
//   if (event.target == modal) {
//     modal.style.display = "none";
//   }
// }



/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

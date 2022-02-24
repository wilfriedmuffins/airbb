// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("./maps");

import "bootstrap";
import "packs/maps";
import "packs/gmaps";
import GMaps from "packs/gmaps";
window.GMaps = GMaps;

document.addEventListener("turbolinks:load", () => {
    var someStr = 'He said "Hello, my name is Foo"';
    console.log(someStr.replace(/['"]+/g, ''));

});

import "controllers";
import { Carousel } from "bootstrap";

window.initMap = function (...args) {
  const event = document.createEvent("Events");
  event.initEvent("google-maps-callback", true, true);
  event.args = args;
  window.dispatchEvent(event);
};

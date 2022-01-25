// A-Frame 2022-01-18, Commit #d1d5012a
import AFRAME from '../vendor/aframe-d1d5012a.min.js';
import 'aframe-extras';
import './aframe_joystick.js'

import { solve_puzzle } from './game_helpers.js'

import './scene_1.js'
import './scene_2.js'
import './scene_3.js'

AFRAME.registerComponent('solver', {
  init: function () {
    this.el.addEventListener('click', function (event) {
      solve_puzzle(event.target);
    });
  }
});

// scroll down
var scroll_down_button = document.getElementById("scroll_down");
scroll_down_button.addEventListener("click", scroll_down);

function scroll_down() {
  window.scrollTo({
    top: document.body.scrollHeight,
    behavior: "smooth"
  })
}

// Originated Copyright (c) 2018 Michael Turck (MIT License)
// Source: https://github.com/mrturck/aframe-joystick

import nipplejs from 'nipplejs';

let moveData = null;

// create NippleJS joystick
function createJoystick() {
  const options = {
    zone: document.getElementById('nipple_joystick'),
    color: 'red',
    fadeTime: 10
  };
  const manager = nipplejs.create(options);
  bindNipple();

  function bindNipple() {
    manager.on('move', function(event, data) {
      moveData = data;
    });
    manager.on('end', function(event, data) {
      moveData = null;
    });
  }
}

// turn joystick data into WASD movement in AFRAME
let f; let ang; let x_vec; let y_vec; let cam;

function updatePosition(data) {
  f = data.force;
  ang = data.angle.radian;
  cam = document.getElementById('camera');

  x_vec = Math.cos(ang + 3.14/180*cam.getAttribute('rotation')['y']);
  y_vec = Math.sin(ang + 3.14/180*cam.getAttribute('rotation')['y']);

  x = cam.getAttribute("position")["x"] + f/15*(x_vec );
  y = cam.getAttribute("position")["y"];
  z = cam.getAttribute("position")["z"] - f/15*(y_vec );

  cam.setAttribute("position",`${x} ${y} ${z}`);
}

AFRAME.registerComponent('joystick', {
  init: function() {
    createJoystick();
  },
  tick: function() {
    if (moveData) updatePosition(moveData);
  }
});

import { solve_puzzle, disable_hotspot } from './game_helpers.js'

AFRAME.registerComponent('pot-animation', {
  init: function () {
    const pot_animation = (event) => {
      // animate pot
      event.target.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });
      // animate note
      const note = document.getElementById('interactable_note_entity');
      note.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      solve_puzzle(event.target);
      disable_hotspot(note);
    };

    this.el.addEventListener('click', pot_animation);
  }
});

AFRAME.registerComponent('note-animation', {
  init: function () {
    const note_animation = (event) => {
      // animate note
      event.target.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });
      // animate pot
      const pot = document.getElementById('interactable_pot_entity');
      pot.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      solve_puzzle(event.target);
      disable_hotspot(pot);
    };

    this.el.addEventListener('click', note_animation);
  }
});

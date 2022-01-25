import { solve_puzzle, enable_hotspot, disable_hotspot } from './game_helpers.js'

// Level 1
AFRAME.registerComponent('drawer-state-level-1', {
  init: function () {
    const playAnimation = (event) => {
      const docs_drawer = document.getElementById('docs_drawer');
      docs_drawer.setAttribute('visible', true);

      // animate drawer
      event.target.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      // animate docs
      event.target.children[0].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      // animate key
      event.target.children[1].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      disable_hotspot(event.target);
    };

    this.el.addEventListener('click', playAnimation);
  }
});

// Level 2
AFRAME.registerComponent('drawer-state-level-2', {
  init: function () {
    const playAnimation = (event) => {
      const ego_element = document.getElementById('ego_docs');
      ego_element.setAttribute('visible', false);

      const docs_drawer_entity = document.getElementById('docs_drawer_entity');
      docs_drawer_entity.setAttribute('visible', true);

      // animate drawer
      event.target.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      // animate docs
      event.target.children[0].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      // animate key
      event.target.children[1].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      solve_puzzle(event.target);
    };

    this.el.addEventListener('click', playAnimation);
  }
});

AFRAME.registerComponent('docs-collectable', {
  init: function () {
    const pickDocs = (event) => {
      event.target.setAttribute('visible', false);

      const ego_element = document.getElementById('ego_docs');
      ego_element.setAttribute('visible', true);

      disable_hotspot(event.target);

      // enable drawer
      const drawer = document.getElementById('drawer');
      enable_hotspot(drawer);
    };

    this.el.addEventListener('click', pickDocs);
  }
});

// Level 3
AFRAME.registerComponent('drawer-state-level-3', {
  init: function () {
    const playAnimation = (event) => {
      const ego_element = document.getElementById('ego_docs');
      ego_element.setAttribute('visible', false);

      const docs_drawer_entity = document.getElementById('docs_drawer_entity');
      docs_drawer_entity.setAttribute('visible', true);

      // animate drawer
      event.target.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      // animate docs
      event.target.children[0].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      disable_hotspot(event.target);

      // enable key collectable
      const key_collectable_entity = document.getElementById('key_collectable_entity');
      enable_hotspot(key_collectable_entity);

      setTimeout(() => {
        key_collectable_entity.setAttribute('animation-mixer', null);
      }, 2_000);
    };

    this.el.addEventListener('click', playAnimation);
  }
});

AFRAME.registerComponent('key-collectable', {
  init: function () {
    const pickKey = (event) => {
      event.target.setAttribute('visible', false);

      const ego_element = document.getElementById('ego_key');
      ego_element.setAttribute('visible', true);

      // new drawer state
      const drawer = document.getElementById('drawer');
      drawer.removeAttribute('drawer-state-level-3');
      drawer.setAttribute('drawer-state-level-3-key', true);

      enable_hotspot(drawer);
    };

    this.el.addEventListener('click', pickKey);
  }
});

AFRAME.registerComponent('drawer-state-level-3-key', {
  init: function () {
    const playAnimation = (event) => {
      const ego_element = document.getElementById('ego_key');
      ego_element.setAttribute('visible', false);

      const key_drawer_entity = document.getElementById('key_drawer_entity');
      key_drawer_entity.setAttribute('visible', true);

      // animate key
      event.target.children[1].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      solve_puzzle(event.target);
    };

    this.el.addEventListener('click', playAnimation);
  }
});

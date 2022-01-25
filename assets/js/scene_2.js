import { solve_puzzle, disable_hotspot } from './game_helpers.js'

AFRAME.registerComponent('screen-states', {
  init: function () {
    // Set screen inactive
    this.el.addEventListener('model-loaded', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_screen_inactive.jpg'

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'mesh_0_5') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });
    });

    // Set screen active (L1)
    this.el.addEventListener('screen_event', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_screen_active_social.jpg';

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'mesh_0_5') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });

      solve_puzzle(event.target);
    });

    // Set screen active (L2)
    this.el.addEventListener('screen_event_2', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_screen_locked.jpg';

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'mesh_0_5') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });

      disable_hotspot(event.target);
    });
  }
});

AFRAME.registerComponent('phone-states', {
  init: function () {
    // Set phone inactive
    this.el.addEventListener('model-loaded', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_phoneScreen_inactive.jpg'

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'Mesh002_2') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });
    });

    // Set phone active (L2)
    this.el.addEventListener('phone_set_active', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_phoneScreen_active.png';

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'Mesh002_2') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });

      solve_puzzle(event.target);
    });

    // Set phone locked (L3)
    this.el.addEventListener('phone_set_locked', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_phoneScreen_locked.jpg';

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'Mesh002_2') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });

      disable_hotspot(event.target);
    });
  }
});

AFRAME.registerComponent('drawer-animation', {
  init: function () {
    const playAnimation = (event) => {
      // animate drawer
      event.target.setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      // animate drive
      event.target.children[0].setAttribute('animation-mixer', {
        loop: 'once',
        clampWhenFinished: true
      });

      disable_hotspot(event.target);
    };

    this.el.addEventListener('trigger_drawer', playAnimation);
  }
});

AFRAME.registerComponent('drive-states', {
  init: function () {
    // Set state to unlocked
    this.el.addEventListener('model-loaded', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_DriveScreen_unlocked.jpg'

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'Mesh002_1') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });
    });

    // solve puzzle
    this.el.addEventListener('click', function(event) {
      const texture_file = '/models/find_unlocked/Textures/txt_DriveScreen_locked.jpg'

      let tree3D = event.target.getObject3D('mesh');
      if (!tree3D){ return; }
      tree3D.traverse(function(node) {
        if (node.isMesh) {
          if (node.name === 'Mesh002_1') {
            const texture = new THREE.TextureLoader().load(texture_file);
            texture.flipY = false;
            node.material.map = texture;
          }
        }
      });

      solve_puzzle(event.target);
    });
  }
});

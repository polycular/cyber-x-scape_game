// Gaze based cursor
AFRAME.registerComponent('cursor-listener', {
  init: function () {
    this.el.addEventListener('mouseenter', function (event) {
      event.detail.cursorEl.setAttribute('material', "color: #ffb555; shader: flat");
    });
    this.el.addEventListener('mouseleave', function (event) {
      event.detail.cursorEl.setAttribute('material', "color: #00ff83; shader: flat");
    });
  }
});

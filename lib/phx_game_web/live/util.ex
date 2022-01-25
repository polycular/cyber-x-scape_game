defmodule PhxGameWeb.Util do
  use Phoenix.Component

  def cursor_gaze(assigns) do
    ~H"""
    <a-entity
      cursor
      raycaster="objects: .clickable"
      material="color: #00FF83; shader: flat"
      position="0 0 -1"
      geometry="primitive: ring; radiusInner: 0.02; radiusOuter: 0.03"
      animation__fusing="property: scale; startEvents: fusing; easing: easeInCubic; dur: 1500; from: 1 1 1; to: 0.1 0.1 0.1"
      animation__enter="property: scale; startEvents: mouseenter; pauseEvents: mouseleave; easing: easeInCubic; dur: 1000; loop: true; dir: alternate; from: 1 1 1; to: 0.8 0.8 0.8"
      animation__click="property: scale; startEvents: click; easing: easeInCubic; dur: 500; from: 0.8 0.8 0.8; to: 1 1 1"
      >
    </a-entity>
    """
  end

  def cursor_mouse(assigns) do
    ~H"""
    <a-entity
      cursor="rayOrigin: mouse"
      raycaster="objects: .clickable"
      >
    </a-entity>
    """
  end
end

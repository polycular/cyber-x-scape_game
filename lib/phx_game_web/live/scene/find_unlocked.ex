defmodule PhxGameWeb.Scene.FindUnlocked do
  use Phoenix.Component

  def level_1(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_main_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L1_PC_v5.gltf")}></a-asset-item>
        <a-asset-item id="drawer" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L3_drawer_v6.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office" rotation="0 90 0">
        <a-entity id="interactable_entity" gltf-model="#interactable" class="clickable" screen-states onclick="event.target.emit('screen_event', null, false);"></a-entity>
        <a-entity gltf-model="#drawer"></a-entity>
      </a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="1.5 1.6 4"
          look-controls>
        </a-entity>
      </a-entity>

      <PhxGameWeb.Util.cursor_mouse />
    </a-scene>
    """
  end

  def level_2(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_main_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L1_PC_v5.gltf")}></a-asset-item>
        <a-asset-item id="drawer" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L3_drawer_v6.gltf")}></a-asset-item>
        <a-asset-item id="phone" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L2_Phone_v5.glb")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office" rotation="0 90 0">
        <a-entity id="interactable_entity" gltf-model="#interactable" class="clickable" screen-states onclick="event.target.emit('screen_event_2', null, false);"></a-entity>
        <a-entity gltf-model="#phone" class="clickable" phone-states onclick="event.target.emit('phone_set_active', null, false);"></a-entity>
        <a-entity gltf-model="#drawer" ></a-entity>
      </a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="1.5 1.6 4"
          look-controls>
        </a-entity>
      </a-entity>

      <PhxGameWeb.Util.cursor_mouse />
    </a-scene>
    """
  end

  def level_3(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_main_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L1_PC_v5.gltf")}></a-asset-item>
        <a-asset-item id="phone" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L2_Phone_v5.glb")}></a-asset-item>
        <a-asset-item id="drawer" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L3_drawer_v6.gltf")}></a-asset-item>
        <a-asset-item id="drive" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_unlocked/FindUnlocked_interactable_L3_drive_v8.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office" rotation="0 90 0">
        <a-entity id="interactable_entity" gltf-model="#interactable"class="clickable" screen-states onclick="event.target.emit('screen_event_2', null, false);"></a-entity>
        <a-entity gltf-model="#phone" class="clickable" phone-states onclick="event.target.emit('phone_set_locked', null, false);"></a-entity>
        <a-entity gltf-model="#drawer" class="clickable" drawer-animation onclick="event.target.emit('trigger_drawer', null, false);">
          <a-entity gltf-model="#drive" class="clickable" drive-states></a-entity>
        </a-entity>
      </a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="1.5 1.6 4"
          look-controls>
        </a-entity>
      </a-entity>

      <PhxGameWeb.Util.cursor_mouse />
    </a-scene>
    """
  end
end

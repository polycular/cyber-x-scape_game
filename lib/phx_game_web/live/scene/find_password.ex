defmodule PhxGameWeb.Scene.FindPassword do
  use Phoenix.Component

  def level_1(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_main_L1_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_interactable_L1_v5.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office">
        <a-entity gltf-model="#interactable" class="clickable" solver></a-entity>
      </a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="0 1.6 3"
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
        <a-asset-item id="office1" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_main_L1_v5.gltf")}></a-asset-item>
        <a-asset-item id="office2" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_office_L2_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable_note" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_interactable_note_L2_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable_pot" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_interactable_pot_L2_v5.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office1"></a-entity>
      <a-entity gltf-model="#office2"></a-entity>
      <a-entity id="interactable_note_entity" gltf-model="#interactable_note" class="clickable" note-animation></a-entity>
      <a-entity id="interactable_pot_entity" gltf-model="#interactable_pot" class="clickable" pot-animation></a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="0 1.6 3"
          look-controls>
        </a-entity>
      </a-entity>
      <a-entity id="camera" camera position="0 1.6 3" look-controls></a-entity>

      <PhxGameWeb.Util.cursor_mouse />
    </a-scene>
    """
  end

  def level_3(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office1" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_main_L1_v5.gltf")}></a-asset-item>
        <a-asset-item id="office2" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_office_L2_v5.gltf")}></a-asset-item>
        <a-asset-item id="office3" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_office_L3_v5.gltf")}></a-asset-item>
        <a-asset-item id="interactable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/find_password/FindPassword_interactable_L3_v5.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office1"></a-entity>
      <a-entity gltf-model="#office2"></a-entity>
      <a-entity gltf-model="#office3"></a-entity>
      <a-entity gltf-model="#interactable" class="clickable" solver></a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="0 1.6 3"
          look-controls>
        </a-entity>
      </a-entity>

      <PhxGameWeb.Util.cursor_mouse />
    </a-scene>
    """
  end
end

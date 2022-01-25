defmodule PhxGameWeb.Scene.StoreConfidential do
  use Phoenix.Component

  def level_1(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_Main_v8.gltf")}></a-asset-item>
        <a-asset-item id="drawer_lock" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_DrawerLockAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="docs_drawer" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_DocsDrawerAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="key" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_KeyAnim_v8.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office" rotation="0 90 0">
        <a-entity gltf-model="#drawer_lock" class="clickable" drawer-state-level-1 solver>
          <a-entity gltf-model="#docs_drawer"></a-entity>
          <a-entity gltf-model="#key"></a-entity>
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

  def level_2(assigns) do
    ~H"""
    <a-scene embedded joystick vr-mode-ui="enabled: false" background="color: #6ebaa7" phx-update="ignore">
      <a-assets>
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_Main_v8.gltf")}></a-asset-item>
        <a-asset-item id="drawer_lock" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_DrawerLockAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="docs_drawer" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_DocsDrawerAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="key" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_KeyAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="docs_collectable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_L2_DocsCollectibleStatic_v8.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office" rotation="0 90 0">
        <a-entity gltf-model="#drawer_lock" id="drawer" drawer-state-level-2>
          <a-entity gltf-model="#docs_drawer" id="docs_drawer_entity" visible="false"></a-entity>
          <a-entity gltf-model="#key"></a-entity>
        </a-entity>

        <a-entity gltf-model="#docs_collectable" class="clickable" docs-collectable></a-entity>
      </a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="1.5 1.6 4"
          look-controls>
          <a-entity gltf-model="#docs_collectable" id="ego_docs" position="1 -1 -5" scale="1.2 1.2 1.2" visible="false"></a-entity>
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
        <a-asset-item id="office" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_Main_v8.gltf")}></a-asset-item>
        <a-asset-item id="drawer_lock" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_DrawerLockAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="docs_drawer" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_DocsDrawerAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="key" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_ALL_KeyAnim_v8.gltf")}></a-asset-item>
        <a-asset-item id="docs_collectable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_L2_DocsCollectibleStatic_v8.gltf")}></a-asset-item>
        <a-asset-item id="key_collectable" src={PhxGameWeb.Router.Helpers.static_path(PhxGameWeb.Endpoint, "/models/store_confidential/StoreConfidential_L3_KeyCollectibleStatic_v9.gltf")}></a-asset-item>
      </a-assets>

      <a-entity gltf-model="#office" rotation="0 90 0">
        <a-entity gltf-model="#drawer_lock" id="drawer" drawer-state-level-3>
          <a-entity gltf-model="#docs_drawer" id="docs_drawer_entity" visible="false"></a-entity>
          <a-entity gltf-model="#key" id="key_drawer_entity" visible="false"></a-entity>
        </a-entity>

        <a-entity gltf-model="#docs_collectable" class="clickable" docs-collectable></a-entity>
        <a-entity geometry="primitive: box; width: 0.5; height: 0.1; depth: 0.5" material="opacity: 0" position="-1 0 1.5" id="key_collectable_entity" key-collectable>
          <a-entity gltf-model="#key_collectable" position="1 0 -1.7"></a-entity>
        </a-entity>
      </a-entity>

      <a-entity id="rig"
        movement-controls="controls: gamepad, keyboard; speed: 0.15">
        <a-entity id="camera" camera
          position="1.5 1.6 4"
          look-controls>
          <a-entity gltf-model="#docs_collectable" id="ego_docs" position="1 -1 -5" scale="1.2 1.2 1.2" visible="false"></a-entity>
          <a-entity gltf-model="#key_collectable" id="ego_key" position="2.5 -1 -6" scale="2.5 2.5 2.5" visible="false"></a-entity>
        </a-entity>
      </a-entity>

      <PhxGameWeb.Util.cursor_mouse />
    </a-scene>
    """
  end
end

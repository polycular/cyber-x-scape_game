defmodule PhxGameWeb.Card do
  @moduledoc false

  use PhxGameWeb, :live_view

  def mount(_params, _session, socket) do
    game_list = PhxGame.Game.get_games()

    {:ok,
     assign(socket,
       round: 1,
       current_game: Enum.at(game_list, 0),
       game_list: game_list,
       done: false
     )}
  end

  def handle_event("next", _params, socket) do
    case Enum.at(socket.assigns.game_list, socket.assigns.round) do
      nil ->
        {:noreply, assign(socket, done: true)}

      game ->
        {:noreply,
         assign(socket,
           round: socket.assigns.round + 1,
           current_game: game
         )}
    end
  end
end

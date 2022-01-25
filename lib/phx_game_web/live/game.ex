defmodule PhxGameWeb.Game do
  @moduledoc false

  use PhxGameWeb, :live_view

  # Game states:
  # not started / started / solved / game_over / game_done
  # Refactor:
  # Make a state machine for it!
  # Implement pause / resume function.

  @timer 30

  def mount(_params, _session, socket) do
    game_list = PhxGame.Game.get_games()

    {:ok,
     assign(socket,
       started: false,
       game_over: false,
       game_done: false,
       solved: false,
       countdown: @timer,
       round: 1,
       score: 0,
       game_list: game_list,
       current_game: Enum.at(game_list, 0)
     )}
  end

  def handle_event("start", _params, socket) do
    unless socket.assigns.started do
      Process.send_after(self(), :tick, 1000)

      {:noreply, assign(socket, started: true, countdown: @timer - 1)}
    else
      {:noreply, socket}
    end
  end

  def handle_event("solve", _params, socket) do
    # game_done? =
    #   case Enum.at(socket.assigns.game_list, socket.assigns.round) do
    #     nil -> true
    #     _ -> false
    #   end

    {:noreply,
     assign(socket,
       solved: true,
       countdown: 0,
       score: socket.assigns.score + 1
     )}
  end

  def handle_event("stop_timer", _params, socket) do
    {:noreply,
     assign(socket,
       solved: false,
       countdown: "⏸️"
     )}
  end

  def handle_event("next", _params, socket) do
    Process.send_after(self(), :tick, 1000)

    case Enum.at(socket.assigns.game_list, socket.assigns.round) do
      nil ->
        {:noreply, assign(socket, game_done: true)}

      game ->
        {:noreply,
         assign(socket,
           current_game: game,
           solved: false,
           game_over: false,
           countdown: @timer,
           round: socket.assigns.round + 1
         )}
    end
  end

  # timeout
  def handle_info(:tick, %{assigns: %{countdown: "⏸️"}} = socket) do
    {:noreply, assign(socket, game_over: false)}
  end

  def handle_info(:tick, %{assigns: %{countdown: 0}} = socket) do
    {:noreply, assign(socket, game_over: true)}
  end

  def handle_info(:tick, %{assigns: %{countdown: countdown}} = socket) do
    Process.send_after(self(), :tick, 1000)

    {:noreply, assign(socket, :countdown, countdown - 1)}
  end
end

defmodule PhxGameWeb.GameFrame do
  use Phoenix.Component
  alias PhxGameWeb.Router.Helpers, as: Routes
  alias Phoenix.LiveView.JS

  def header(assigns) do
    ~H"""
    <header id="game">
      <div>
        <span class="icon">⏲️</span>
        <span class="text countdown"><b><%= assigns.countdown %></b></span>
      </div>

      <div class="instruction">
        <%= assigns.task %>
        <span class="icon">
        <%= case assigns.difficulty do %>
          <% 1 -> %> 🥉
          <% 2 -> %> 🥈
          <% 3 -> %> 🥇
        <% end %>
        </span>
      </div>

      <%# Hidden solved quirk button - HACKY! %>
      <div id="phx_solved" style="display: none" phx-click={JS.push("solve")}></div>
      <div id="phx_stop_timer" style="display: none" phx-click={JS.push("stop_timer")}></div>
    </header>

    <div id="reward" phx-update="ignore"></div>
    <div id="scroll_down" style="display: none">👇</div>
    """
  end

  def flashcard(assigns) do
    ~H"""
    <section class="flashcard">
      <header>
        <h1>Risiko Lernkarte</h1>
        <img src={Routes.static_path(PhxGameWeb.Endpoint, "/images/pics/#{assigns.learning.pic}")}>
      </header>

      <div class="content">
        <h1><%= assigns.learning.title %></h1>

        <hr>

        <p><%= assigns.learning.description %></p>
        <br>

        <h1>Risiko: <%= assigns.learning.risk.title %></h1>

        <hr>

        <p><%= assigns.learning.risk.description %></p>
      </div>
    </section>
    """
  end

  def flashcard_challenge(assigns) do
    ~H"""
    <div class="flashcard_challenge">
      <header>
        <h1>Konzentrationstest</h1>
      </header>

      <div class="content">
        Alles klar? Risiko verstanden?<br>
        Nur um sicherzugehen, eine kleine Aufgabe für dich.<br><br>

        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  def emoji_challenge(assigns) do
    combinations = [
      {"die Katze", "🐈"},
      {"den Oktopus", "🐙"},
      {"den Wolf", "🐺"},
      {"das Einhorn", "🦄"},
      {"den Elefanten", "🐘"},
      {"den Hasen", "🐇"},
      {"den Koala", "🐨"},
      {"das Schwein", "🐷"}
    ]

    selection = Enum.take_random(combinations, 5)

    wrong = Enum.take(selection, 4) |> Enum.map(fn x -> {:wrong, x} end)
    right = Enum.take(selection, -1) |> Enum.map(fn x -> {:right, x} end)

    [{:right, {answer_text, _}}] = right

    buttons = Enum.shuffle(wrong ++ right)

    ~H"""
    Klicke auf <%= answer_text %> zum Fortfahren.<br>
    <div id="challenge">
      <%= for {solution, {_, emoji}} <- buttons do %>
        <%= if solution === :wrong do %>
          <button class="emoji" phx-click={JS.hide(to: "#wrong") |> JS.show(to: "#wrong")}><%= emoji %></button>
        <% end %>
        <%= if solution === :right do %>
          <button class="emoji" phx-click={JS.push("next")}><%= emoji %></button>
        <% end %>
      <% end %>
    </div>

    <div id="result">
      <span id="right" style="display: none">
        💯
      </span>
      <span id="wrong" style="display: none">
        🙈
      </span>
    </div>
    """
  end
end

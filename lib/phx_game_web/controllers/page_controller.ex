defmodule PhxGameWeb.PageController do
  use PhxGameWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end

  def imprint(conn, _params) do
    render(conn, "imprint.html")
  end
end

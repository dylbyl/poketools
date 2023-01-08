defmodule PokeToolsWeb.PageController do
  use PokeToolsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

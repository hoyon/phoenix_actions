defmodule PhoenixActionsWeb.PageController do
  use PhoenixActionsWeb, :controller

  def index(conn, _params) do
    IO.inspect(conn)
    render(conn, "index.html")
  end
end

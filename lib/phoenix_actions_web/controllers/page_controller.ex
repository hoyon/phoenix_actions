defmodule PhoenixActionsWeb.PageController do
  use PhoenixActionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

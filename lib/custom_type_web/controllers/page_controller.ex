defmodule CustomTypeWeb.PageController do
  use CustomTypeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

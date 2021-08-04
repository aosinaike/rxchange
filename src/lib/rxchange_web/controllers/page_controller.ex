defmodule RxchangeWeb.PageController do
  use RxchangeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

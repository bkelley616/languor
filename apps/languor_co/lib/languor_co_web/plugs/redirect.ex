defmodule LanguorCoWeb.Plugs.Redirect do
  @moduledoc """
  Plug to reroute all path requests to the index page, which is the only page of the site
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, opts) do
    conn
    |> put_status(:permanent_redirect)
    |> Phoenix.Controller.redirect(opts)
    |> halt()
  end
end

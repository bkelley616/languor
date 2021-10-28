defmodule LanguorCoWeb.PageLiveTest do
  @moduledoc false

  use LanguorCoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "languor"
    assert render(page_live) =~ "languor"
  end
end

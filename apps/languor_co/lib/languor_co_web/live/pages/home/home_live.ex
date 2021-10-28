defmodule LanguorCoWeb.HomeLive do
  @moduledoc false

  use Surface.LiveView

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, page_title: "Home")
    {:ok, socket}
  end

  @impl true
  def handle_event("suggest", _value, socket) do
    {:noreply, socket}
  end
end

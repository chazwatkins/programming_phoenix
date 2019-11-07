defmodule RumblWeb.WelcomeLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <h2><%= @salutation %></h2>
    </div>
    """
  end

  def mount(_session, socket) do
    salutation = "Weclome to LiveView, from the Programming Phoenix team!"
    {:ok, socket, salutation: salutation}
  end
end

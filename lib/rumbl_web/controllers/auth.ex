defmodule RumblWeb.Auth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    # Checks if `:user_id` is stored in the session. If not set, returns `nil`
    user_id = get_session(conn, :user_id)
    user = user_id && Rumbl.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  # Login / logout methods - regular functions
  # Not part of the plug - just convenience methods
  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    #  drops the session, a session cookie will not be included in the response
    configure_session(conn, drop: true)
  end
end

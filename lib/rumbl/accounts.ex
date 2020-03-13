defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context
  """
  alias Rumbl.Accounts.User

  def list_users() do
    [
      %User{id: "1", name: "Kevin N", username: "kev"},
      %User{id: "2", name: "Mark Cuban", username: "mark"},
      %User{id: "3", name: "Mr. Wonderful", username: "wunder"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end

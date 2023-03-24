defmodule FelixirWeb.Resolvers.Accounts do

  def find_user(_parent, %{id: id}, _resolution) do
    case Felixir.Account.get_user(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def create_user(_parent, args, _resolution) do
    Felixir.Account.create_user(args)
  end

  def list_contacts(%Felixir.Account.User{} = user, _args, _resolution) do
    {:ok, Felixir.Account.list_contacts(user)}
  end

end

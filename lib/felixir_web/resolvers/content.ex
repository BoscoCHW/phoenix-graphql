defmodule FelixirWeb.Resolvers.Content do

  def list_posts(%Felixir.Account.User{} = author, args, _resolution) do
    {:ok, Felixir.Content.list_posts(author, args)}
  end

  def list_posts(_parent, _args, _resolution) do
    {:ok, Felixir.Content.list_posts()}
  end

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    Felixir.Content.create_post(user, args)
  end
  def create_post(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end

end

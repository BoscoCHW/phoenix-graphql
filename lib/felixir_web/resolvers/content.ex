defmodule FelixirWeb.Resolvers.Content do

  # def list_posts(%Felixir.Account.User{} = author, args, _resolution) do
  #   {:ok, Felixir.Content.list_posts(author, args)}
  # end

  def list_posts(_parent, _args, _resolution) do
    {:ok, Felixir.Content.list_posts()}
  end


end

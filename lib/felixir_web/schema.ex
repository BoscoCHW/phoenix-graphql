defmodule FelixirWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types FelixirWeb.Schema.AccountTypes
  import_types FelixirWeb.Schema.ContentTypes
  alias FelixirWeb.Resolvers

  # def context(ctx) do
  #   loader =
  #     Dataloader.new()
  #     |> Dataloader.add_source(Felixir.Account, Felixir.Account.datasource())
  #     # |> Dataloader.add_source(Felixir.Content, Felixir.Content.datasource())

  #   Map.put(ctx, :loader, loader)
  # end

  # def plugins, do: [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]

  query do

    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve &Resolvers.Content.list_posts/3
    end

    # @desc "Get a user of the blog"
    # field :user, :user do
    #   arg :id, non_null(:id)
    #   resolve &Resolvers.Accounts.find_user/3
    # end
  end


end

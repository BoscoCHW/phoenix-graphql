defmodule FelixirWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  alias FelixirWeb.Resolvers
  # import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  # @desc "A user of the blog"
  # object :user do
  #   field :id, :id
  #   field :username, :string
  #   field :posts, list_of(:post) do
  #     arg :date, :date
  #     resolve &Resolvers.Content.list_posts/3
  #     # resolve dataloader(Felixir.Content, :posts, [])
  #   end
  # end


end

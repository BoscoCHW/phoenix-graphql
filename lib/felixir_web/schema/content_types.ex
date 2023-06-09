defmodule FelixirWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    field :author, :user do
      # resolve(fn post, _args, _resolution ->
      #   {:ok, post.user_id |> Felixir.Account.get_user()}
      # end)
      resolve dataloader(Felixir.Account, :user, args: %{scope: :post})
    end

    field :published_at, :naive_datetime
  end
end

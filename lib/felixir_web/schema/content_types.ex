defmodule FelixirWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    field :author, :user do
      resolve(fn post, _args, _resolution ->
        {:ok, post.user_id |> Felixir.Account.get_user()}
      end)
    end

    field :published_at, :naive_datetime
  end
end

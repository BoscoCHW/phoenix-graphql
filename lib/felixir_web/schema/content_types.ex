defmodule FelixirWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  # import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  # @desc """
  # Hello Set V, this is my custom scalar type.
  # """
  # scalar :mydatetime, name: "MyDateTime" do
  #   serialize(&DateTime.to_iso8601/1)
  #   parse(&parse_datetime/1)
  # end

  # @spec parse_datetime(Absinthe.Blueprint.Input.String.t()) :: {:ok, DateTime.t()} | :error
  # @spec parse_datetime(Absinthe.Blueprint.Input.Null.t()) :: {:ok, nil}
  # defp parse_datetime(%Absinthe.Blueprint.Input.String{value: value}) do
  #   case DateTime.from_iso8601(value) do
  #     {:ok, datetime, 0} -> {:ok, datetime}
  #     {:ok, _datetime, _offset} -> :error
  #     _error -> :error
  #   end
  # end

  # defp parse_datetime(%Absinthe.Blueprint.Input.Null{}) do
  #   {:ok, nil}
  # end

  # defp parse_datetime(_) do
  #   :error
  # end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    # field :author, :user do
    #   resolve(fn post, _args, _resolution ->
    #     {:ok, post.user_id |> Felixir.Account.get_user()}
    #   end)
    #   # resolve dataloader(Felixir.Account, :user, [])
    # end

    field :published_at, :naive_datetime
  end
end

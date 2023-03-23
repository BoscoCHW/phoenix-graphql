defmodule Felixir.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string
    field :published_at, :naive_datetime, default: (NaiveDateTime.truncate NaiveDateTime.utc_now, :second)
    belongs_to :user, Felixir.Account.User
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> unique_constraint(:title)
  end
end

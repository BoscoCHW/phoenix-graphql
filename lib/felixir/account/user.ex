defmodule Felixir.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password, :string
    field :username, :string
    field :token, :string
    has_many :posts, Felixir.Content.Post
    has_many :contacts, Felixir.Account.Contact
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :token])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
  end
end

defmodule Felixir.Account.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :type, :string
    field :value, :string

    belongs_to :user, Felixir.Account.User
    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:type, :value])
    |> unique_constraint([:type, :value])
  end
end

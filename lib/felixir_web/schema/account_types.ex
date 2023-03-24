defmodule FelixirWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  alias FelixirWeb.Resolvers

  @desc "A user of the blog"
  object :user do
    field :id, :id
    field :username, :string
    field :posts, list_of(:post) do
      arg :date, :date
      resolve &Resolvers.Content.list_posts/3
    end
    field :contacts, list_of(:contact) do
      resolve &Resolvers.Accounts.list_contacts/3
    end
  end

  enum :contact_type do
    value :phone, as: "phone"
    value :email, as: "email"
  end

  input_object :contact_input do
    field :type, non_null(:contact_type)
    field :value, non_null(:string)
  end

  @desc "A contact of a user"
  object :contact do
    field :id, :id
    field :type, :contact_type
    field :value, :string
  end

end

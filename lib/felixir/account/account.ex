defmodule Felixir.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Felixir.Repo

  alias Felixir.Account.User

  def datasource() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end

  defp query(User, %{scope: :post}) do
    User
  end

  defp query(model, _) do
    model
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    result = %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
    case result do
      {:ok, user} ->
        create_contact(user, attrs.contact)
        {:ok,user}
      {:error, changeset} -> {:error, changeset}
    end


  end

  def create_contact(user, attrs \\ %{}) do
    user
      |> Ecto.build_assoc(:contacts, attrs)
      |> Repo.insert()
  end

  def list_contacts(user) do
    from(t in Felixir.Account.Contact, where: t.user_id == ^user.id)
    |> Repo.all
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end

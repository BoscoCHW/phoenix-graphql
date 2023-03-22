defmodule Felixir.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias Felixir.{Repo, Content}


  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Content.Post, id)

  def list_posts(author, %{date: date}) do
    from(t in Content.Post,
      where: t.user_id == ^author.id,
      where: fragment("date_trunc('day', ?)", t.published_at) == type(^date, :date))
    |> Repo.all
  end
  def list_posts(author, _) do
    from(t in Content.Post, where: t.user_id == ^author.id)
    |> Repo.all
  end

  def list_posts do
    Repo.all(Content.Post)
  end

  def create_post(user, attrs) do
    user
    |> Ecto.build_assoc(:posts, attrs)
    |> Repo.insert
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Content.Post{} = post, attrs) do
    post
    |> Content.Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Content.Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Content.Post{} = post, attrs \\ %{}) do
    Content.Post.changeset(post, attrs)
  end
end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Felixir.Repo.insert!(%Felixir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Felixir.Content
alias Felixir.Account.User
alias Felixir.Repo

user =
  %User{}
  |> User.changeset(%{username: "Test", password: "test", token: "test_token"})
  |> Repo.insert!

Content.create_post(user, %{title: "Test Post 1", body: "Lorem Ipsum", published_at: ~N[2017-10-26 10:00:00]})
Content.create_post(user, %{title: "Test Post 2", body: "Lorem Ipsum Lorem Ipsum", published_at: ~N[2017-10-27 10:00:00]})

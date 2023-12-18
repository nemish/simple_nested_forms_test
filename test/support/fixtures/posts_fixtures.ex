defmodule MyTestApp.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyTestApp.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        text: "some text"
      })
      |> MyTestApp.Posts.create_post()

    post
  end
end

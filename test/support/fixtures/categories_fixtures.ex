defmodule MyTestApp.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyTestApp.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        text: "some text"
      })
      |> MyTestApp.Categories.create_category()

    category
  end
end

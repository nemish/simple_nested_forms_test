defmodule MyTestApp.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :text, :string
    has_many :posts, MyTestApp.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:text])
    |> cast_assoc(:posts)
    |> validate_required([:text])
  end
end

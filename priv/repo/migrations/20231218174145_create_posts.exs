defmodule MyTestApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :text, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:category_id])
  end
end

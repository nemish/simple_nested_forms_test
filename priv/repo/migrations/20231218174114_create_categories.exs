defmodule MyTestApp.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :text, :string

      timestamps()
    end
  end
end

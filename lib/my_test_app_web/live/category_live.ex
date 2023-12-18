defmodule MyTestAppWeb.CategoryLive do
  use MyTestAppWeb, :live_view

  alias MyTestApp.Categories
  alias MyTestApp.Categories.Category
  alias MyTestApp.Posts.Post

  def mount(params, _session, socket) do
    socket = socket |> init_form(params)

    {:ok, socket}
  end

  def init_form(socket, %{"id" => id}) do
    socket |> assign_existing(id)
  end

  def init_form(socket, %{}) do
    socket |> assign_new()
  end

  defp assign_existing(socket, id) do
    item = id |> Categories.get_category!()
    changeset = item |> Categories.change_category()

    socket
    |> assign(:item, item)
    |> assign_form(changeset)
  end

  defp assign_new(socket) do
    changeset =
      %Category{
        text: "",
        posts: mock_posts()
      }
      |> Categories.change_category()

    socket |> assign_form(changeset)
  end

  defp assign_form(socket, changeset) do
    form = to_form(changeset, as: "category")
    socket |> assign(form: form)
  end

  defp mock_posts() do
    Enum.map(1..3, fn _ ->
      %Post{id: nil, text: ""}
    end)
  end

  def handle_event("create-item", %{"category" => payload}, socket) do
    IO.puts("create-item #{inspect(payload)}")

    case Categories.create_category(payload) do
      {:ok, _category} ->
        {:noreply, socket |> put_flash(:info, "Category created successfully")}

      {:error, changeset} ->
        {:noreply, socket |> assign_form(changeset)}
    end
  end

  def handle_event("update-item", %{"category" => payload}, socket) do
    IO.puts("update-item #{inspect(payload)}")
    item = socket.assigns.item

    case Categories.update_category(item, payload) do
      {:ok, _category} ->
        {:noreply, socket |> put_flash(:info, "Category updated successfully")}

      {:error, changeset} ->
        {:noreply, socket |> assign_form(changeset)}
    end
  end
end

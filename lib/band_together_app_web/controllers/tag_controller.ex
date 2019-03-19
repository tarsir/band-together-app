defmodule BandTogetherAppWeb.TagController do
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Tag

  def index(conn, _params) do
    tags = Musicians.list_tags()
    render(conn, "index.html", tags: tags)
  end

  def new(conn, _params) do
    changeset = Musicians.change_tag(%Tag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tag" => tag_params}) do
    case Musicians.create_tag(tag_params) do
      {:ok, tag} ->
        conn
        |> put_flash(:info, "Tag created successfully.")
        |> redirect(to: tag_path(conn, :show, tag))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Musicians.get_tag!(id)
    render(conn, "show.html", tag: tag)
  end

  def edit(conn, %{"id" => id}) do
    tag = Musicians.get_tag!(id)
    changeset = Musicians.change_tag(tag)
    render(conn, "edit.html", tag: tag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Musicians.get_tag!(id)

    case Musicians.update_tag(tag, tag_params) do
      {:ok, tag} ->
        conn
        |> put_flash(:info, "Tag updated successfully.")
        |> redirect(to: tag_path(conn, :show, tag))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tag: tag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Musicians.get_tag!(id)
    {:ok, _tag} = Musicians.delete_tag(tag)

    conn
    |> put_flash(:info, "Tag deleted successfully.")
    |> redirect(to: tag_path(conn, :index))
  end
end

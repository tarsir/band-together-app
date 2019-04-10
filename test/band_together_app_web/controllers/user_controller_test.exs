defmodule BandTogetherAppWeb.UserControllerTest do
  use BandTogetherAppWeb.ConnCase

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.User

  @create_attrs %{
    biography: "some biography",
    email: "some email",
    first_name: "some first_name",
    last_name: "some last_name",
    password: "some password",
    stage_name: "marilyn manson"
  }
  @update_attrs %{
    biography: "some updated biography",
    email: "some updated email",
    first_name: "some updated first_name",
    last_name: "some updated last_name",
    password: "some updated password",
    stage_name: "iron maiden"
  }
  @invalid_attrs %{
    biography: nil,
    email: nil,
    first_name: nil,
    last_name: nil,
    password: nil,
    stage_name: nil
  }

  def fixture(:user) do
    {:ok, user} = Musicians.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 200) =~ "User List"
    end
  end

  describe "create user" do
    test "renders form", %{conn: conn} do 
      conn = get conn, user_path(conn, :new)
      assert html_response(conn, 200) =~ "User Registration"
    end

    test "renders user when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, user_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete conn, user_path(conn, :delete, user)
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end

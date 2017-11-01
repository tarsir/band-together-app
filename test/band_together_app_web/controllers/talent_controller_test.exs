defmodule BandTogetherAppWeb.TalentControllerTest do
  use BandTogetherAppWeb.ConnCase

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Talent

  @create_attrs %{description: "some description", img_filepath: "some img_filepath", title: "some title"}
  @update_attrs %{description: "some updated description", img_filepath: "some updated img_filepath", title: "some updated title"}
  @invalid_attrs %{description: nil, img_filepath: nil, title: nil}

  def fixture(:talent) do
    {:ok, talent} = Musicians.create_talent(@create_attrs)
    talent
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all talents", %{conn: conn} do
      conn = get conn, talent_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create talent" do
    test "renders talent when data is valid", %{conn: conn} do
      conn = post conn, talent_path(conn, :create), talent: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, talent_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "img_filepath" => "some img_filepath",
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, talent_path(conn, :create), talent: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update talent" do
    setup [:create_talent]

    test "renders talent when data is valid", %{conn: conn, talent: %Talent{id: id} = talent} do
      conn = put conn, talent_path(conn, :update, talent), talent: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, talent_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "img_filepath" => "some updated img_filepath",
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, talent: talent} do
      conn = put conn, talent_path(conn, :update, talent), talent: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete talent" do
    setup [:create_talent]

    test "deletes chosen talent", %{conn: conn, talent: talent} do
      conn = delete conn, talent_path(conn, :delete, talent)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, talent_path(conn, :show, talent)
      end
    end
  end

  defp create_talent(_) do
    talent = fixture(:talent)
    {:ok, talent: talent}
  end
end

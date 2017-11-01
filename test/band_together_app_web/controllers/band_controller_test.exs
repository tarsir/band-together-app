defmodule BandTogetherAppWeb.BandControllerTest do
  use BandTogetherAppWeb.ConnCase

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Band

  @create_attrs %{biography: "some biography", description: "some description", loc_city: "some loc_city", loc_country: "some loc_country", loc_state: "some loc_state", stage_name: "some stage_name"}
  @update_attrs %{biography: "some updated biography", description: "some updated description", loc_city: "some updated loc_city", loc_country: "some updated loc_country", loc_state: "some updated loc_state", stage_name: "some updated stage_name"}
  @invalid_attrs %{biography: nil, description: nil, loc_city: nil, loc_country: nil, loc_state: nil, stage_name: nil}

  def fixture(:band) do
    {:ok, band} = Musicians.create_band(@create_attrs)
    band
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bands", %{conn: conn} do
      conn = get conn, band_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create band" do
    test "renders band when data is valid", %{conn: conn} do
      conn = post conn, band_path(conn, :create), band: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, band_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "biography" => "some biography",
        "description" => "some description",
        "loc_city" => "some loc_city",
        "loc_country" => "some loc_country",
        "loc_state" => "some loc_state",
        "stage_name" => "some stage_name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, band_path(conn, :create), band: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update band" do
    setup [:create_band]

    test "renders band when data is valid", %{conn: conn, band: %Band{id: id} = band} do
      conn = put conn, band_path(conn, :update, band), band: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, band_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "biography" => "some updated biography",
        "description" => "some updated description",
        "loc_city" => "some updated loc_city",
        "loc_country" => "some updated loc_country",
        "loc_state" => "some updated loc_state",
        "stage_name" => "some updated stage_name"}
    end

    test "renders errors when data is invalid", %{conn: conn, band: band} do
      conn = put conn, band_path(conn, :update, band), band: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete band" do
    setup [:create_band]

    test "deletes chosen band", %{conn: conn, band: band} do
      conn = delete conn, band_path(conn, :delete, band)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, band_path(conn, :show, band)
      end
    end
  end

  defp create_band(_) do
    band = fixture(:band)
    {:ok, band: band}
  end
end

defmodule BandTogetherApp.MusiciansTest do
  use BandTogetherApp.DataCase

  alias BandTogetherApp.Musicians

  describe "users" do
    alias BandTogetherApp.Musicians.User

    @valid_attrs %{biography: "some biography", email: "some email", first_name: "some first_name", last_name: "some last_name", password: "some password"}
    @update_attrs %{biography: "some updated biography", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password"}
    @invalid_attrs %{biography: nil, email: nil, first_name: nil, last_name: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musicians.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Musicians.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Musicians.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Musicians.create_user(@valid_attrs)
      assert user.biography == "some biography"
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Musicians.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.biography == "some updated biography"
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_user(user, @invalid_attrs)
      assert user == Musicians.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Musicians.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Musicians.change_user(user)
    end
  end

  describe "talents" do
    alias BandTogetherApp.Musicians.Talent

    @valid_attrs %{description: "some description", img_filepath: "some img_filepath", title: "some title"}
    @update_attrs %{description: "some updated description", img_filepath: "some updated img_filepath", title: "some updated title"}
    @invalid_attrs %{description: nil, img_filepath: nil, title: nil}

    def talent_fixture(attrs \\ %{}) do
      {:ok, talent} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musicians.create_talent()

      talent
    end

    test "list_talents/0 returns all talents" do
      talent = talent_fixture()
      assert Musicians.list_talents() == [talent]
    end

    test "get_talent!/1 returns the talent with given id" do
      talent = talent_fixture()
      assert Musicians.get_talent!(talent.id) == talent
    end

    test "create_talent/1 with valid data creates a talent" do
      assert {:ok, %Talent{} = talent} = Musicians.create_talent(@valid_attrs)
      assert talent.description == "some description"
      assert talent.img_filepath == "some img_filepath"
      assert talent.title == "some title"
    end

    test "create_talent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_talent(@invalid_attrs)
    end

    test "update_talent/2 with valid data updates the talent" do
      talent = talent_fixture()
      assert {:ok, talent} = Musicians.update_talent(talent, @update_attrs)
      assert %Talent{} = talent
      assert talent.description == "some updated description"
      assert talent.img_filepath == "some updated img_filepath"
      assert talent.title == "some updated title"
    end

    test "update_talent/2 with invalid data returns error changeset" do
      talent = talent_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_talent(talent, @invalid_attrs)
      assert talent == Musicians.get_talent!(talent.id)
    end

    test "delete_talent/1 deletes the talent" do
      talent = talent_fixture()
      assert {:ok, %Talent{}} = Musicians.delete_talent(talent)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_talent!(talent.id) end
    end

    test "change_talent/1 returns a talent changeset" do
      talent = talent_fixture()
      assert %Ecto.Changeset{} = Musicians.change_talent(talent)
    end
  end

  describe "portfolios" do
    alias BandTogetherApp.Musicians.Portfolio

    @valid_attrs %{title: "some title", url: "some url"}
    @update_attrs %{title: "some updated title", url: "some updated url"}
    @invalid_attrs %{title: nil, url: nil}

    def portfolio_fixture(attrs \\ %{}) do
      {:ok, portfolio} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musicians.create_portfolio()

      portfolio
    end

    test "list_portfolios/0 returns all portfolios" do
      portfolio = portfolio_fixture()
      assert Musicians.list_portfolios() == [portfolio]
    end

    test "get_portfolio!/1 returns the portfolio with given id" do
      portfolio = portfolio_fixture()
      assert Musicians.get_portfolio!(portfolio.id) == portfolio
    end

    test "create_portfolio/1 with valid data creates a portfolio" do
      assert {:ok, %Portfolio{} = portfolio} = Musicians.create_portfolio(@valid_attrs)
      assert portfolio.title == "some title"
      assert portfolio.url == "some url"
    end

    test "create_portfolio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_portfolio(@invalid_attrs)
    end

    test "update_portfolio/2 with valid data updates the portfolio" do
      portfolio = portfolio_fixture()
      assert {:ok, portfolio} = Musicians.update_portfolio(portfolio, @update_attrs)
      assert %Portfolio{} = portfolio
      assert portfolio.title == "some updated title"
      assert portfolio.url == "some updated url"
    end

    test "update_portfolio/2 with invalid data returns error changeset" do
      portfolio = portfolio_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_portfolio(portfolio, @invalid_attrs)
      assert portfolio == Musicians.get_portfolio!(portfolio.id)
    end

    test "delete_portfolio/1 deletes the portfolio" do
      portfolio = portfolio_fixture()
      assert {:ok, %Portfolio{}} = Musicians.delete_portfolio(portfolio)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_portfolio!(portfolio.id) end
    end

    test "change_portfolio/1 returns a portfolio changeset" do
      portfolio = portfolio_fixture()
      assert %Ecto.Changeset{} = Musicians.change_portfolio(portfolio)
    end
  end

  describe "bands" do
    alias BandTogetherApp.Musicians.Band

    @valid_attrs %{biography: "some biography", description: "some description", loc_city: "some loc_city", loc_country: "some loc_country", loc_state: "some loc_state", stage_name: "some stage_name"}
    @update_attrs %{biography: "some updated biography", description: "some updated description", loc_city: "some updated loc_city", loc_country: "some updated loc_country", loc_state: "some updated loc_state", stage_name: "some updated stage_name"}
    @invalid_attrs %{biography: nil, description: nil, loc_city: nil, loc_country: nil, loc_state: nil, stage_name: nil}

    def band_fixture(attrs \\ %{}) do
      {:ok, band} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musicians.create_band()

      band
    end

    test "list_bands/0 returns all bands" do
      band = band_fixture()
      assert Musicians.list_bands() == [band]
    end

    test "get_band!/1 returns the band with given id" do
      band = band_fixture()
      assert Musicians.get_band!(band.id) == band
    end

    test "create_band/1 with valid data creates a band" do
      assert {:ok, %Band{} = band} = Musicians.create_band(@valid_attrs)
      assert band.biography == "some biography"
      assert band.description == "some description"
      assert band.loc_city == "some loc_city"
      assert band.loc_country == "some loc_country"
      assert band.loc_state == "some loc_state"
      assert band.stage_name == "some stage_name"
    end

    test "create_band/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_band(@invalid_attrs)
    end

    test "update_band/2 with valid data updates the band" do
      band = band_fixture()
      assert {:ok, band} = Musicians.update_band(band, @update_attrs)
      assert %Band{} = band
      assert band.biography == "some updated biography"
      assert band.description == "some updated description"
      assert band.loc_city == "some updated loc_city"
      assert band.loc_country == "some updated loc_country"
      assert band.loc_state == "some updated loc_state"
      assert band.stage_name == "some updated stage_name"
    end

    test "update_band/2 with invalid data returns error changeset" do
      band = band_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_band(band, @invalid_attrs)
      assert band == Musicians.get_band!(band.id)
    end

    test "delete_band/1 deletes the band" do
      band = band_fixture()
      assert {:ok, %Band{}} = Musicians.delete_band(band)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_band!(band.id) end
    end

    test "change_band/1 returns a band changeset" do
      band = band_fixture()
      assert %Ecto.Changeset{} = Musicians.change_band(band)
    end
  end

  describe "tags" do
    alias BandTogetherApp.Musicians.Tag

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musicians.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Musicians.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Musicians.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Musicians.create_tag(@valid_attrs)
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, tag} = Musicians.update_tag(tag, @update_attrs)
      assert %Tag{} = tag
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_tag(tag, @invalid_attrs)
      assert tag == Musicians.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Musicians.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Musicians.change_tag(tag)
    end
  end
end

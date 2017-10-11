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
end

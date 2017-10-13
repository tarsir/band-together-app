defmodule BandTogetherApp.Musicians do
  @moduledoc """
  The Musicians context.
  """

  import Ecto.Query, warn: false
  alias BandTogetherApp.Repo

  alias BandTogetherApp.Musicians.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    Repo.get!(User, id)
    |> Repo.preload (:talents)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias BandTogetherApp.Musicians.Talent

  @doc """
  Returns the list of talents.

  ## Examples

      iex> list_talents()
      [%Talent{}, ...]

  """
  def list_talents do
    Repo.all(Talent)
  end

  @doc """
  Gets a single talent.

  Raises `Ecto.NoResultsError` if the Talent does not exist.

  ## Examples

      iex> get_talent!(123)
      %Talent{}

      iex> get_talent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_talent!(id), do: Repo.get!(Talent, id)

  @doc """
  Creates a talent.

  ## Examples

      iex> create_talent(%{field: value})
      {:ok, %Talent{}}

      iex> create_talent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_talent(attrs \\ %{}) do
    %Talent{}
    |> Talent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a talent.

  ## Examples

      iex> update_talent(talent, %{field: new_value})
      {:ok, %Talent{}}

      iex> update_talent(talent, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_talent(%Talent{} = talent, attrs) do
    talent
    |> Talent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Talent.

  ## Examples

      iex> delete_talent(talent)
      {:ok, %Talent{}}

      iex> delete_talent(talent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_talent(%Talent{} = talent) do
    Repo.delete(talent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking talent changes.

  ## Examples

      iex> change_talent(talent)
      %Ecto.Changeset{source: %Talent{}}

  """
  def change_talent(%Talent{} = talent) do
    Talent.changeset(talent, %{})
  end
end

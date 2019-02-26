defmodule BandTogetherApp.Authentication do
  @moduledoc """
  The Authentication session.
  """

  import Ecto.Query, warn: false
  alias BandTogetherApp.Repo
  alias BandTogetherApp.Musicians.User
  alias BandTogetherApp.Authentication.Session

  def get_user_from_token(token) when is_nil(token), do: nil
  def get_user_from_token(token) do
    with session when not is_nil(session) <- Repo.get_by(Session, token: token),
         user when not is_nil(user) <- Repo.get(User, session.user_id) do
           {:ok, user}
    else
      nil -> {:error, nil}
    end
  end


  def delete_session(%Session{} = session) do
    Repo.delete(session)
  end

  def current_user(conn) do
    case Plug.Conn.get_session(conn, :session_token) do
      nil ->
        {:error, :no_token}
      token ->
        session = BandTogetherApp.Repo.get_by(Session, token: token)
        if session do
          {
            :ok,
            BandTogetherApp.Repo.get(User, session.user_id)
          }
        else
          {:error, :invalid_token}
        end
    end
  end

end

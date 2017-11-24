defmodule BandTogetherApp.Authentication do
  @moduledoc """
  The Authentication session.
  """

  import Ecto.Query, warn: false
  alias BandTogetherApp.Repo
  alias BandTogetherApp.Authentication.Session

  def delete_session(%Session{} = session) do
    Repo.delete(session)
  end

end

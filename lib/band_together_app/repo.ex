defmodule BandTogetherApp.Repo do
  use Ecto.Repo, otp_app: :band_together_app

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("BAND_TOGETHER_DEV_DB"))}
  end
end

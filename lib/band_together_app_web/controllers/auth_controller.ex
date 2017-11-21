defmodule BandTogetherAppWeb.AuthController do
    use BandTogetherAppWeb, :controller

    alias BandTogetherApp.Musicians.User
    alias BandTogetherApp.Repo

    action_fallback BandTogetherAppWeb.FallbackController

    def login(conn, %{"email" => email, "password" => password}) do
        user = Repo.get_by!(User, email: email)
        if password == user.password do
            json(conn, %{id: user.id})
        else
            send_resp(conn, 401, "")
        end
    end

    def login(conn, params) do
        inspect(params)
        send_resp(conn, 400, "")
    end

end
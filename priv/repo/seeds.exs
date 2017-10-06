# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BandTogetherApp.Repo.insert!(%BandTogetherApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule BandTogetherApp.DatabaseSeeder do
    alias BandTogetherApp.Repo

    alias BandTogetherApp.Musicians.User, as: BUser

    @dev_users [ %BUser{first_name: "Joe", last_name: "Hogs", email: "j@hoggo.com", password: "nil", biography: "j hogs"}, \
        %BUser{first_name: "Theodore", last_name: "ZORK", email: "zork@zorric.com", password: "nil", biography: "ZORK"}, \
        %BUser{first_name: "Wilma", last_name: "Jinkies", email: "isaidit@jinkies.com", password: "nil", biography: "it must be a clue"} \
    ]

    def seed_dev() do
        Enum.each(@dev_users, fn (person) -> Repo.insert!(person) end)
    end
end

BandTogetherApp.DatabaseSeeder.seed_dev
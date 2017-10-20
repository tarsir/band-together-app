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
    alias BandTogetherApp.Musicians.Talent, as: BTalent
    alias BandTogetherApp.Musicians.Portfolio, as: BPortfolio
    alias BandTogetherApp.Musicians.Band, as: BBand

    @dev_users [
        %BUser{first_name: "Joe", last_name: "Hogs", email: "j@hoggo.com", password: "nil", biography: "j hogs", stage_name: "Hogger"}, \
        %BUser{first_name: "Theodore", last_name: "ZORK", email: "zork@zorric.com", password: "nil", biography: "ZORK", stage_name: "Party Cannon"}, \
        %BUser{first_name: "Wilma", last_name: "Jinkies", email: "isaidit@jinkies.com", password: "nil", biography: "it must be a clue", stage_name: "Mystery Machine"} \
    ]

    @dev_talents [
        %BTalent{title: "Guitar", img_filepath: "guitar.png"}, \
        %BTalent{title: "Drums", img_filepath: "drums.png"}, \
        %BTalent{title: "Mixing", img_filepath: "mixer.png"}
    ]

    @dev_portfolios [
        %BPortfolio{title: "Isucon Revenge", url: "http://isu.con"}, \
        %BPortfolio{title: "Woodstock", url: "http://wood.stock"}, \
        %BPortfolio{title: "Rime of the Ancient Mariner", url: "http://mad.rimez"}, \
        %BPortfolio{title: "Brave New World", url: "http://ironmaid.en"}, \
        %BPortfolio{title: "OC Remix", url: "https://soundcloud.com/ocremix/sets/mirror-image-a-link-to-the-past-remixed"}
    ]

    @dev_bands [
        %BBand{biography: "hello", description: "We are cool", stage_name: "The Cool Kids", loc_country: "USA"}, \
        %BBand{biography: "mewtwo", description: "We are cooler", stage_name: "The Cooler Kids", loc_country: "Spain"}, \
        %BBand{biography: "hobbit", description: "We are coolest", stage_name: "The Coolest Kids", loc_country: "China"}
    ]


    def seed_dev() do
        Enum.each(@dev_users, fn (person) -> Repo.insert!(person) end)
        Enum.each(@dev_talents, fn (talent) -> Repo.insert!(talent) end)
        Enum.each(@dev_portfolios, fn (talent) -> Repo.insert!(talent) end)
        Enum.each(@dev_bands, fn (talent) -> Repo.insert!(talent) end)
    end
end

BandTogetherApp.DatabaseSeeder.seed_dev
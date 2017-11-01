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

defmodule BandTogetherApp.DatabaseSeeder do
    alias BandTogetherApp.Repo

    alias BandTogetherApp.Musicians.User, as: BUser
    alias BandTogetherApp.Musicians.Talent, as: BTalent
    alias BandTogetherApp.Musicians.Portfolio, as: BPortfolio
    alias BandTogetherApp.Musicians.Band, as: BBand

    @guitar_talent %BTalent{title: "Guitar", img_filepath: "guitar.png"}
    @drum_talent %BTalent{title: "Drums", img_filepath: "drums.png"}
    @mixing_talent %BTalent{title: "Mixing", img_filepath: "mixer.png"}
    @vocals_talent %BTalent{title: "Vocals", img_filepath: "vocals.png"}
    @composing_talent %BTalent{title: "Composign", img_filepath: "composing.png"}

    @dev_talents [@guitar_talent, @drum_talent, @mixing_talent, @vocals_talent, @composing_talent]

    @joe_hogs %BUser{
        first_name: "Joe",
        last_name: "Hogs",
        email: "j@hoggo.com",
        password: "nil",
        biography: "j hogs",
        stage_name: "Hogger",
        talents: [@guitar_talent, @drum_talent]
    }
    @t_zork %BUser{
        first_name: "Theodore",
        last_name: "ZORK",
        email: "zork@zorric.com",
        password: "nil",
        biography: "ZORK",
        stage_name: "Party Cannon",
        talents: [@guitar_talent, @mixing_talent]
    }
    @wilma %BUser{
        first_name: "Wilma",
        last_name: "Jinkies",
        email: "isaidit@jinkies.com",
        password: "nil",
        biography: "it must be a clue",
        stage_name: "Mystery Machine",
        talents: [@mixing_talent]
    }
    @charles_barkley %BUser{
        first_name: "Charles",
        last_name: "Barkley",
        email: "slam@jam.com",
        password: "nil",
        biography: "DJ? TURN IT UP",
        stage_name: "Space Jam",
        talents: [@vocals_talent, @composing_talent]
    }
    @brucey_d %BUser{
        first_name: "Bruce",
        last_name: "Dickinson",
        email: "bruced@thetrooper.com",
        password: "nil",
        biography: "YOU'LL TAKE MY LIFE BUT I'LL TAKE YOURS TOO",
        stage_name: "The Trooper",
        talents: [@vocals_talent, @composing_talent]
    }
    @dev_users [@joe_hogs, @t_zork, @wilma, @brucey_d, @charles_barkley]

    @isucon %BPortfolio{title: "Isucon Revenge", url: "http://isu.con"}
    @woodstock %BPortfolio{title: "Woodstock", url: "http://wood.stock"}
    @rotma %BPortfolio{title: "Rime of the Ancient Mariner", url: "http://mad.rimez"}
    @brave_new_world %BPortfolio{title: "Brave New World", url: "http://ironmaid.en"}
    @oc_remix %BPortfolio{title: "OC Remix", url: "https://soundcloud.com/ocremix/sets/mirror-image-a-link-to-the-past-remixed"}

    @dev_portfolios [@isucon, @woodstock, @rotma, @brave_new_world, @oc_remix]

    @iron_maiden %BBand{
        biography: "FUCKING METAL",
        description: "WE ARE IRON MAIDEN",
        stage_name: "Iron Maiden",
        loc_country: "United Kingdom",
        users: [@brucey_d]
    }
    @megadeth %BBand{
        biography: "mewtwo",
        description: "We are cooler",
        stage_name: "The Cooler Kids",
        loc_country: "Spain",
        users: [@joe_hogs, @t_zork, @wilma]
    }

    @quad_city_djs %BBand{
        biography: "GO GO POWER RANGERS",
        description: "Y'all ready for this?",
        stage_name: "Quad City DJs",
        loc_country: "United States of Jam",
        users: [@charles_barkley]
    }

    @dev_bands [@iron_maiden, @megadeth, @quad_city_djs]


    def seed_dev() do
        Enum.each(@dev_portfolios, fn (talent) -> Repo.insert!(talent) end)
        Enum.each(@dev_bands, fn (talent) -> Repo.insert!(talent) end)
    end
end

BandTogetherApp.DatabaseSeeder.seed_dev
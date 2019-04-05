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
  alias BandTogetherApp.Musicians.Portfolio, as: BPortfolio
  alias BandTogetherApp.Musicians.Band, as: BBand
  alias BandTogetherApp.Musicians.Tag, as: BTag
  alias BandTogetherApp.Musicians.PortfolioTags, as: BPortfolioTags

  @joe_hogs %BUser{
    first_name: "Joe",
    last_name: "Hogs",
    email: "j@hoggo.com",
    password_hash: Comeonin.Bcrypt.hashpwsalt("nillop"),
    biography: "j hogs",
    stage_name: "Hogger"
  }
  @t_zork %BUser{
    first_name: "Theodore",
    last_name: "ZORK",
    email: "zork@zorric.com",
    password_hash: Comeonin.Bcrypt.hashpwsalt("nillop"),
    biography: "ZORK",
    stage_name: "Party Cannon"
  }
  @wilma %BUser{
    first_name: "Wilma",
    last_name: "Jinkies",
    email: "isaidit@jinkies.com",
    password_hash: Comeonin.Bcrypt.hashpwsalt("nillop"),
    biography: "it must be a clue",
    stage_name: "Mystery Machine"
  }
  @charles_barkley %BUser{
    first_name: "Charles",
    last_name: "Barkley",
    email: "slam@jam.com",
    password_hash: Comeonin.Bcrypt.hashpwsalt("nillop"),
    biography: "DJ? TURN IT UP",
    stage_name: "Space Jam"
  }
  @brucey_d %BUser{
    first_name: "Bruce",
    last_name: "Dickinson",
    email: "bruced@thetrooper.com",
    password_hash: Comeonin.Bcrypt.hashpwsalt("nillop"),
    biography: "YOU'LL TAKE MY LIFE BUT I'LL TAKE YOURS TOO",
    stage_name: "The Trooper"
  }
  @dev_users [@joe_hogs, @t_zork, @wilma, @brucey_d, @charles_barkley]

  @guitar_tag %BTag{tag_name: "guitar"}
  @vocals_tag %BTag{tag_name: "vocals"}
  @mixing_tag %BTag{tag_name: "mixing"}
  @performing_tag %BTag{tag_name: "performing"}
  @composing_tag %BTag{tag_name: "composing"}

  @dev_tags [@guitar_tag, @vocals_tag, @mixing_tag, @performing_tag, @composing_tag]

  @isucon %{ 
    portfolio: %BPortfolio{
      title: "Isucon Revenge",
      url: "http://isu.con"
    },
    tags: [@performing_tag]
  }
  @woodstock %{ portfolio: %BPortfolio{title: "Woodstock", url: "http://wood.stock"}, tags: [@performing_tag, @vocals_tag]}
  @rotma %{ portfolio: %BPortfolio{title: "Rime of the Ancient Mariner", url: "http://mad.rimez"}, tags: [@guitar_tag, @vocals_tag]}
  @brave_new_world %{ portfolio: %BPortfolio{title: "Brave New World", url: "http://ironmaid.en"}, tags: [@guitar_tag, @vocals_tag, @composing_tag]}
  @oc_remix %{ 
    portfolio: %BPortfolio{
      title: "OC Remix", 
      url: "https://soundcloud.com/ocremix/sets/mirror-image-a-link-to-the-past-remixed"
    },
    tags: [@mixing_tag]
  }

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
    Enum.each(@dev_tags, fn (tag) -> Repo.insert!(tag) end)
    Enum.each(@dev_portfolios, fn (portfolio) -> 
      IO.inspect(portfolio)
      portfolio_record = Repo.insert!(portfolio[:portfolio]) 
      Enum.each(portfolio[:tags], fn tag ->
        tag_record = Repo.get_by(BTag, tag_name: tag.tag_name)
        changeset = BPortfolioTags.changeset(
          %BPortfolioTags{},
          %{portfolio_id: portfolio_record.id, tag_id: tag_record.id}
        )
        Repo.insert(changeset)
      end)
    end)
    Enum.each(@dev_bands, fn (band) -> Repo.insert!(band) end)
  end
end

BandTogetherApp.DatabaseSeeder.seed_dev

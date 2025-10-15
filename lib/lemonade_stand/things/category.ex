defmodule LemonadeStand.Things.Category do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "categories"
    repo LemonadeStand.Repo
  end

  attributes do
    uuid_primary_key :id
  end

  relationships do
    has_many :parts, LemonadeStand.Things.Part
  end
end

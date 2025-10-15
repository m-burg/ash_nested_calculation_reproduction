defmodule LemonadeStand.Things.Part do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "parts"
    repo LemonadeStand.Repo
  end

  attributes do
    uuid_primary_key :id
  end
end

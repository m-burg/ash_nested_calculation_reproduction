defmodule LemonadeStand.Things.Component do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "components"
    repo LemonadeStand.Repo
  end

  attributes do
    uuid_primary_key :id
  end

  relationships do
    belongs_to :part, LemonadeStand.Things.Part do
      public? true
    end

    has_many :substitutes, LemonadeStand.Things.ComponentSubstitute
  end
end

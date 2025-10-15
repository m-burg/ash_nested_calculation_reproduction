defmodule LemonadeStand.Things.Component do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "components"
    repo LemonadeStand.Repo
  end

  actions do
    defaults [:read]
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

  calculations do
    calculate :suitable,
              :boolean,
              expr(part.suitable or exists(substitutes, part.suitable == true)) do
      public? true
    end
  end
end

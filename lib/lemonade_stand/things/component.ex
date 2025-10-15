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
              expr(
                part.suitable(machine_id: ^arg(:machine_id)) or
                  exists(substitutes, part.suitable(machine_id: ^arg(:machine_id)) == true)
              ) do
      public? true

      argument :machine_id, :uuid do
        allow_nil? false
      end
    end
  end
end

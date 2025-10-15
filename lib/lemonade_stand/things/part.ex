defmodule LemonadeStand.Things.Part do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "parts"
    repo LemonadeStand.Repo
  end

  actions do
    defaults [:read]
  end

  attributes do
    uuid_primary_key :id
  end

  relationships do
    belongs_to :category, LemonadeStand.Things.Category do
      public? true
    end
  end

  calculations do
    calculate :suitable,
              :boolean,
              expr(
                not exists(
                  LemonadeStand.Things.MachineExcludedCategory,
                  machine_id == ^arg(:machine_id) && category_id == parent(category_id)
                )
              ) do
      public? true

      argument :machine_id, :uuid do
        allow_nil? false
      end
    end
  end
end

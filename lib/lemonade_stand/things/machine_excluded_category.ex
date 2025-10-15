defmodule LemonadeStand.Things.MachineExcludedCategory do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "machine_excluded_categories"
    repo LemonadeStand.Repo
  end

  actions do
    defaults [:read]
  end

  relationships do
    belongs_to :machine, LemonadeStand.Things.Machine do
      allow_nil? false
      public? true
      primary_key? true
    end

    belongs_to :category, LemonadeStand.Things.Category do
      allow_nil? false
      public? true
      primary_key? true
    end
  end
end

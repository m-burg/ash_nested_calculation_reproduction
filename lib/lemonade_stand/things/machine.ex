defmodule LemonadeStand.Things.Machine do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "machines"
    repo LemonadeStand.Repo
  end

  actions do
    defaults [:read]
  end

  attributes do
    uuid_primary_key :id
  end

  relationships do
    has_many :exclusion_relationships, LemonadeStand.Things.MachineExcludedCategory

    many_to_many :excluded_categories, LemonadeStand.Things.Category do
      join_relationship :exclusion_relationships
    end
  end
end

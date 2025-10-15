defmodule LemonadeStand.Things.ComponentSubstitute do
  use Ash.Resource,
    otp_app: :lemonade_stand,
    domain: LemonadeStand.Things,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "component_substitutes"
    repo LemonadeStand.Repo
  end

  relationships do
    belongs_to :component, LemonadeStand.Things.Component do
      public? true
      primary_key? true
      allow_nil? false
    end

    belongs_to :part, LemonadeStand.Things.Part do
      public? true
      primary_key? true
      allow_nil? false
    end
  end
end

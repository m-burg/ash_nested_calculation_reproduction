defmodule LemonadeStand.Things do
  use Ash.Domain,
    otp_app: :lemonade_stand

  resources do
    resource LemonadeStand.Things.Component
    resource LemonadeStand.Things.ComponentSubstitute
    resource LemonadeStand.Things.Part
    resource LemonadeStand.Things.Category
    resource LemonadeStand.Things.Machine
    resource LemonadeStand.Things.MachineExcludedCategory
  end
end

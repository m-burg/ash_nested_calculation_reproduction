defmodule LemonadeStand.Things do
  use Ash.Domain,
    otp_app: :lemonade_stand

  resources do
    resource LemonadeStand.Things.Component
    resource LemonadeStand.Things.ComponentSubstitute
    resource LemonadeStand.Things.Part
  end
end

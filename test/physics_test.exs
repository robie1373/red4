defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics
  import Physics

  test "escape_velocity :earth" do
    assert Physics.Rocketry.escape_velocity(:earth) 
      == 11.2
  end
  
  test "escape_velocity :mars" do
    assert Physics.Rocketry.escape_velocity(:mars) 
      == 5.03 
  end

  test "escape_velocity :moon" do
    assert Physics.Rocketry.escape_velocity(:moon) 
      == 2.38 
  end

  test "escape_velocity/1" do
    mars = %{mass: 6.39e23, radius: 3.39e6}
    assert Physics.Rocketry.escape_velocity(mars) ==
     158.6 
  end

  test "Calcs#rounded_to_nearest_tenth/1" do
    assert Calcs.rounded_to_nearest_tenth(1.12) 
      == 1.2
  end

  test "Calcs#convert_to_km/1" do
    assert Calcs.convert_to_km(3_845)
      == 3.845
  end
end


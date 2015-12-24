defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape_velocity :earth" do
    assert Physics.Rocketry.escape_velocity(:earth) 
      == 11.2
  end
  
  test "escape_velocity :mars" do
    assert Physics.Rocketry.escape_velocity(:mars) 
      == 5.1 
  end

  test "escape_velocity :moon" do
    assert Physics.Rocketry.escape_velocity(:moon) 
      == 2.4
  end

  test "escape_velocity/1" do
    mars = %{mass: 6.39e23, radius: 3.39e6}
    assert Physics.Rocketry.escape_velocity(mars) ==
     5.1 
  end

  test "orbital_acceleration" do
    speed = 100
    height = 2.0e9
    orbital_radius = 6.371e6 + height
    result = (speed * speed) / orbital_radius
    assert Physics.Rocketry.orbital_acceleration(height)
      == result
  end

end


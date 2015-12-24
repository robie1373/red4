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
    mars = Planets.mars
    assert Physics.Rocketry.escape_velocity(mars) 
    == 5.1 
  end

  test "orbital_acceleration" do
    assert {Physics.Rocketry.orbital_acceleration(
      %{planet: Planets.earth, height: 100}), 2} |> Calcs.to_nearest 
      == 9.52

    assert {Physics.Rocketry.orbital_acceleration(
      %{planet: Planets.mars, height: 75}), 2} |> Calcs.to_nearest 
      == 3.53

    assert {Physics.Rocketry.orbital_acceleration(
      %{planet: Planets.moon , height: 175}), 2} |> Calcs.to_nearest 
      == 1.34 
  end

  test "orbital_speed" do
    assert Physics.Rocketry.orbital_speed(
      %{planet: Planets.earth, height: 100_000}) 
      |> Calcs.to_nearest_tenth
      == 1935.2

    assert Physics.Rocketry.orbital_speed(
      %{planet: Planets.mars, height: 125_000}) 
      |> Calcs.to_nearest_tenth
      == 576.2

    assert Physics.Rocketry.orbital_speed(
      %{planet: Planets.moon, height: 85_000}) 
      |> Calcs.to_nearest_tenth
      == 237.8 
  end

  test "orbital_term_hrs" do
    assert Physics.Rocketry.orbital_term_hrs(
      %{planet: Planets.earth, height: 100})
      == 1.5

    assert Physics.Rocketry.orbital_term_hrs(
      %{planet: Planets.mars, height: 120})
      == 1.8

    assert Physics.Rocketry.orbital_term_hrs(
      %{planet: Planets.moon, height: 220})
      == 2.2
  end

  test "orbital_height_meters" do
    desired_period = 4 * 3600
    actual = Physics.Rocketry.orbital_height(
      %{planet: Planets.earth, desired_period: desired_period})
    expected = 58_848_000
    delta = 1_000
    assert_in_delta actual, expected, delta, 
      "#{actual} is not within #{delta} of #{expected}."

    desired_period = 4 * 3600
    actual = Physics.Rocketry.orbital_height(
      %{planet: Planets.mars, desired_period: desired_period})
    expected = 27_938_000
    delta = 1_000
    assert_in_delta actual, expected, delta, 
      "#{actual} is not within #{delta} of #{expected}."

    desired_period = 4 * 3600
    actual = Physics.Rocketry.orbital_height(
      %{planet: Planets.moon, desired_period: desired_period})
    expected = 13_587_000
    delta = 1_000
    assert_in_delta actual, expected, delta, 
      "#{actual} is not within #{delta} of #{expected}."
  end

end


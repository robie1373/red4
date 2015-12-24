defmodule Physics.Rocketry do

  import Calcs
  import Physics.Laws

  def escape_velocity(:earth) do
    Planets.earth
    |> escape_velocity
  end

  def escape_velocity(:mars) do
    Planets.mars
    |> escape_velocity
  end

  def escape_velocity(:moon) do
    Planets.moon
    |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Calcs.to_km
      |> Calcs.to_nearest_tenth
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * Planets.earth.mass / orbital_radius(height)
    |> Calcs.square_root
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> Calcs.squared) / orbital_radius(height)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> Calcs.square_root
  end

  defp orbital_radius(height) do
    Planets.earth.radius + (height |> Calcs.to_m)
  end

end


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

  def orbital_speed(height) when is_number(height), do: orbital_speed(%{planet: Planets.earth, height: height})
  
  def orbital_speed(args = %{planet: planet, height: _height}) do
    newtons_gravitational_constant * planet.mass / orbital_radius(args)
    |> Calcs.square_root
  end

  def orbital_acceleration(args) do
    (orbital_speed(args) |> Calcs.squared) / orbital_radius(args)
  end

  def orbital_term(args = %{planet: planet, height: _height}) do
    4 * ( :math.pi |> Calcs.squared ) * ( orbital_radius(args) 
      |> Calcs.cubed ) / ( newtons_gravitational_constant * planet.mass )
    |> Calcs.square_root
  end

  def orbital_term_hrs(args = %{planet: planet, height: _height}) do
    orbital_term(args)
    |> Calcs.seconds_to_hours
  end

  def orbital_height(%{planet: planet, desired_period: desired_period}) do
    (newtons_gravitational_constant * planet.mass 
      * (desired_period |> Calcs.squared) / 4 
      * (:math.pi |> Calcs.squared)) |> Calcs.cubed_root
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> Calcs.square_root
  end

  defp orbital_radius(%{planet: planet, height: height}) do
    planet.radius + (height |> Calcs.to_m)
  end

end


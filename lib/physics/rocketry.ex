defmodule Calcs do
  def rounded_to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  def convert_to_km(velocity) do
    velocity / 1_000
  end
end

defmodule Physics.Rocketry do
#  import Calcs, only: [convert_to_km: 1]  

  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
    |> escape_velocity
  end

  def escape_velocity(:mars) do
    %{mass: 6.39e23, radius: 3.4e6}
    |> escape_velocity
  end

  def escape_velocity(:moon) do
    %{mass: 7.35e22, radius: 1.738e6}
    |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Calcs.convert_to_km
      |> Calcs.rounded_to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    2 * newtons_constant * mass / radius
      |> :math.sqrt
  end

end


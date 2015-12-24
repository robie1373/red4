defmodule Calcs do
  def to_nearest_tenth(val) do
    to_nearest({val, 1})
  end

  def to_nearest({val, dec_place}) do
    Float.ceil(val, dec_place) 
  end

  def to_km(velocity) do
    velocity / 1_000
  end

  def square_root(val) do
    :math.sqrt(val)
  end

  def squared(val) do
    val * val
  end

  def cubed(val) do
    val * val * val
  end

  def seconds_to_hours(sec) do
    sec / 3600 |> to_nearest_tenth
  end

  def to_m(km) do
    km * 1_000
  end

  def cubed_root(val) do
    nth_root(3, val)
  end

  ############################
  # Begin mission cargo cult!
  def nth_root(n, x, precision \\ 1.0e-5) do
    f = fn(prev) -> ((n - 1) * prev + x / :math.pow(prev, (n-1))) / n end
    fixed_point(f, x, precision, f.(x))
  end
            
  defp fixed_point(_, guess, tolerance, next) when abs(guess - next) < tolerance, do: next
  defp fixed_point(f, _, tolerance, next), do: fixed_point(f, next, tolerance, f.(next))
  # End mission cargo cult
  ##########################
end


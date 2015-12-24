defmodule Calcs do
  def to_nearest_tenth(val) do
    Float.ceil(val, 1)
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

  def to_m(km) do
    km / 1_000
  end

end


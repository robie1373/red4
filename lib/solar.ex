defmodule Physics.Solar do

  def power(%{classification: :X, scale: scale, date: _ }) do
    1_000 * scale 
  end

  def power(%{classification: :M, scale: scale, date: _ }) do
    10 * scale 
  end

  def power(%{classification: :C, scale: scale, date: _ }) do
    scale 
  end

end

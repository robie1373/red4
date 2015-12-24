defmodule CalcsTest do
  use ExUnit.Case
  doctest Calcs

  test "Calcs#to_nearest_tenth/1" do
    assert Calcs.to_nearest_tenth(1.12) 
      == 1.2
  end

  test "Calcs#to_km/1" do
    assert Calcs.to_km(3_845)
      == 3.845
  end
end

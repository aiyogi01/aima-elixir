defmodule RomaniaTest do
  alias Problems.Romania, as: Romania
  use ExUnit.Case
  doctest Romania

  def from_sibui_to_bucharest() do
    Romania.define_problem(%{initial: "Sibui", goal: "Bucharest"})
  end

  test "initial state" do
    p = from_sibui_to_bucharest()
    assert Problem.initial_state(p) == "Sibui"
  end

  test "actions" do
    p = from_sibui_to_bucharest()
    assert Problem.actions(p, "Sibui") == [
      "go to Faragas",
      "go to Oradea",
      "go to Rimnicu Vilcea"
    ]
    assert Problem.actions(p, "Berlin") == []
  end

  test "result" do
    p = from_sibui_to_bucharest()
    assert Problem.result(p, "Sibui", "go to Oradea") == "Oradea"
    assert Problem.result(p, "Sibui", "go to Bucharest") == nil
    assert Problem.result(p, "Sibui", "jump in the air") == nil
  end

  test "goal test" do
    p = from_sibui_to_bucharest()
    assert Problem.goal_test(p, "Bucharest")
    assert not Problem.goal_test(p, "Pitesti")
  end

  test "step cost" do
    p = from_sibui_to_bucharest()
    assert Problem.step_cost(p, "Sibui", "go to Oradea") == 151
    assert Problem.step_cost(p, "Sibui", "go to Bucharest") == nil
    assert Problem.step_cost(p, "Sibui", "jump in the air") == nil
  end

end

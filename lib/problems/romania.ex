defmodule Problems.Romania do
  def actions() do
    %{
      "Oradea" => [
        %Action{result: "Zerind", cost: 71},
        %Action{result: "Sibui", cost: 151},
      ],
      "Zerind" => [
        %Action{result: "Arad", cost: 75},
        %Action{result: "Oradea", cost: 71},
      ],
      "Arad" => [
        %Action{result: "Zerind", cost: 75},
        %Action{result: "Sibui", cost: 140},
        %Action{result: "Timisoara", cost: 118},
      ],
      "Timisoara" => [
        %Action{result: "Arad", cost: 118},
        %Action{result: "Logoj", cost: 111},
      ],
      "Lugoj" => [
        %Action{result: "Timisoara", cost: 111},
        %Action{result: "Mehadia", cost: 70},
      ],
      "Mehadia" => [
        %Action{result: "Lugoj", cost: 70},
        %Action{result: "Drobeta", cost: 75},
      ],
      "Drobeta" => [
        %Action{result: "Mehadia", cost: 75},
        %Action{result: "Craiova", cost: 120},
      ],
      "Craiova" => [
        %Action{result: "Drobeta", cost: 120},
        %Action{result: "Rimnicu Vilcea", cost: 146},
        %Action{result: "Pitesti", cost: 138}
      ],
      "Rimnicu Vilcea" => [
        %Action{result: "Craiova", cost: 146},
        %Action{result: "Sibui", cost: 80},
        %Action{result: "Pitesti", cost: 97},
      ],
      "Sibui" => [
        %Action{result: "Oradea", cost: 151},
        %Action{result: "Rimnicu Vilcea", cost: 80},
        %Action{result: "Faragas", cost: 99},
      ],
      "Fagaras" => [
        %Action{result: "Sibui", cost: 99},
        %Action{result: "Bucharest", cost: 211},
      ],
      "Pitesti" => [
        %Action{result: "Rimnicu Vilcea", cost: 97},
        %Action{result: "Craiova", cost: 138},
        %Action{result: "Bucharest", cost: 101},
      ],
      "Bucharest" => [
        %Action{result: "Fagaras", cost: 211},
        %Action{result: "Pitesti", cost: 101},
        %Action{result: "Giurgui", cost: 90},
        %Action{result: "Urziceni", cost: 85},
      ],
      "Guirgui" => [
        %Action{result: "Bucharest", cost: 90},
      ],
      "Urziceni" => [
        %Action{result: "Bucharest", cost: 85},
        %Action{result: "Hirsova", cost: 98},
        %Action{result: "Vaslui", cost: 142},
      ],
      "Hirsova" => [
        %Action{result: "Urziceni", cost: 98},
        %Action{result: "Eforie", cost: 86},
      ],
      "Eforie" => [
        %Action{result: "Hirsova", cost: 86},
      ],
      "Vaslui" => [
        %Action{result: "Urziceni", cost: 142},
        %Action{result: "Iasi", cost: 92},
      ],
      "Iasi" => [
        %Action{result: "Vaslui", cost: 142},
        %Action{result: "Neamt", cost: 87},
      ],
      "Neamt" => [
        %Action{result: "Iasi", cost: 87},
      ],
    }
  end

  def define(%{initial: initial, goal: goal}) do
    %Problem{initial: initial, goal: goal, actions: actions()}
  end

  def goal_test(%{goal: goal}, state) do
    goal == state
  end

end

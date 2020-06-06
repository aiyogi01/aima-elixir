defmodule Problems.Romania do
  alias Problems.Romania, as: Romania

  defstruct initial: nil, goal: nil, transitions: %{
    "Oradea" => %{
      "go to Zerind" => %{result: "Zerind", cost: 71},
      "go to Sibui" => %{result: "Sibui", cost: 151},
    },
    "Zerind" => %{
      "go to Arad" => %{result: "Arad", cost: 75},
      "go to Oradea" => %{result: "Oradea", cost: 71},
    },
    "Arad" => %{
      "go to Zerind" => %{result: "Zerind", cost: 75},
      "go to Sibui" => %{result: "Sibui", cost: 140},
      "go to Timisoara" => %{result: "Timisoara", cost: 118},
    },
    "Timisoara" => %{
      "go to Arad" => %{result: "Arad", cost: 118},
      "go to Logoj" => %{result: "Logoj", cost: 111},
    },
    "Lugoj" => %{
      "go to Timisoara" => %{result: "Timisoara", cost: 111},
      "go to Mehadia" => %{result: "Mehadia", cost: 70},
    },
    "Mehadia" => %{
      "go to Lugoj" => %{result: "Lugoj", cost: 70},
      "go to Drobeta" => %{result: "Drobeta", cost: 75},
    },
    "Drobeta" => %{
      "go to Mehadia" => %{result: "Mehadia", cost: 75},
      "go to Craiova" => %{result: "Craiova", cost: 120},
    },
    "Craiova" => %{
      "go to Drobeta" => %{result: "Drobeta", cost: 120},
      "go to Rimnicu Vilcea" => %{result: "Rimnicu Vilcea", cost: 146},
      "go to Pitesti" => %{result: "Pitesti", cost: 138}
    },
    "Rimnicu Vilcea" => %{
      "go to Craiova" => %{result: "Craiova", cost: 146},
      "go to Sibui" => %{result: "Sibui", cost: 80},
      "go to Pitesti" => %{result: "Pitesti", cost: 97},
    },
    "Sibui" => %{
      "go to Oradea" => %{result: "Oradea", cost: 151},
      "go to Rimnicu Vilcea" => %{result: "Rimnicu Vilcea", cost: 80},
      "go to Faragas" => %{result: "Faragas", cost: 99},
    },
    "Fagaras" => %{
      "go to Sibui" => %{result: "Sibui", cost: 99},
      "go to Bucharest" => %{result: "Bucharest", cost: 211},
    },
    "Pitesti" => %{
      "go to Rimnicu Vilcea" => %{result: "Rimnicu Vilcea", cost: 97},
      "go to Craiova" => %{result: "Craiova", cost: 138},
      "go to Bucharest" => %{result: "Bucharest", cost: 101},
    },
    "Bucharest" => %{
      "go to Fagaras" => %{result: "Fagaras", cost: 211},
      "go to Pitesti" => %{result: "Pitesti", cost: 101},
      "go to Giurgui" => %{result: "Giurgui", cost: 90},
      "go to Urziceni" => %{result: "Urziceni", cost: 85},
    },
    "Guirgui" => %{
      "go to Bucharest" => %{result: "Bucharest", cost: 90},
    },
    "Urziceni" => %{
      "go to Bucharest" => %{result: "Bucharest", cost: 85},
      "go to Hirsova" => %{result: "Hirsova", cost: 98},
      "go to Vaslui" => %{result: "Vaslui", cost: 142},
    },
    "Hirsova" => %{
      "go to Urziceni" => %{result: "Urziceni", cost: 98},
      "go to Eforie" => %{result: "Eforie", cost: 86},
    },
    "Eforie" => %{
      "go to Hirsova" => %{result: "Hirsova", cost: 86},
    },
    "Vaslui" => %{
      "go to Urziceni" => %{result: "Urziceni", cost: 142},
      "go to Iasi" => %{result: "Iasi", cost: 92},
    },
    "Iasi" => %{
      "go to Vaslui" => %{result: "Vaslui", cost: 142},
      "go to Neamt" => %{result: "Neamt", cost: 87},
    },
    "Neamt" => %{
      "go to Iasi" => %{result: "Iasi", cost: 87},
    },
  }

  def define_problem(%{initial: initial, goal: goal}) do
    %Romania{initial: initial, goal: goal}
  end

end

defimpl Problem, for: Problems.Romania do
  alias Problems.Romania, as: Romania

  def initial_state(%Romania{initial: initial, goal: _, transitions: _}) do
    initial
  end

  def actions(%Romania{initial: _, goal: _, transitions: t}, state) do
    t
    |> Map.get(state, %{})
    |> Map.keys()
  end

  def result(%Romania{initial: _, goal: _, transitions: t}, state, action) do
    t
    |> Map.get(state, %{})
    |> Map.get(action, %{})
    |> Map.get(:result)
  end

  def goal_test(%Romania{initial: _, goal: goal, transitions: _}, state) do
    state == goal
  end

  def step_cost(%Romania{initial: _, goal: _, transitions: t}, state, action) do
    t
    |> Map.get(state, %{})
    |> Map.get(action, %{})
    |> Map.get(:cost)
  end

end

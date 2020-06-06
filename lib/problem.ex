defprotocol Problem do

  @doc "Return the initial state of the problem."
  def initial_state(problem)

  @doc "Return the applicable actions in the given `state`."
  def actions(problem, state)

  @doc "Return the result of applying `action` in the given `state`."
  def result(problem, state, action)

  @doc "Determine whether the given `state` is a goal state."
  def goal_test(problem, state)

  @doc "Return the cost of applying `action` in the given `state`."
  def step_cost(problem, state, action)

end

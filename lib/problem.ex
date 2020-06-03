defmodule Problem do
  defstruct initial: nil, goal: nil, actions: nil

  def gaol_test(%Problem{goal: goal, initial: _, actions: _}, state) do
    goal == state
  end

end

defmodule Queue do
  defstruct type: nil, fun: nil, content: nil

  def new(:fifo) do
    %Queue{type: :fifo, fun: nil, content: []}
  end

  def new(:lifo) do
    %Queue{type: :lifo, fun: nil, content: []}
  end

  def new(:priority, sort) do
    %Queue{type: :priority, fun: sort, content: []}
  end

  def empty?(%Queue{type: _, fun: _, content: content}) do
    Enum.empty?(content)
  end

  def add(%Queue{type: type, fun: fun, content: content}, element) do
    case type do
      :fifo -> %Queue{type: type, fun: fun, content: content ++ [element]}
      :lifo -> %Queue{type: type, fun: fun, content: [element | content]}
      :priority -> %Queue{type: type, fun: fun, content: Enum.sort([element | content], fun)}
    end
  end

  def pop(%Queue{type: type, fun: sort, content: [head | tail]}) do
    {head, %Queue{type: type, fun: sort, content: tail}}
  end

  def pop(%Queue{type: type, fun: fun, content: []}) do
    {nil, %Queue{type: type, fun: fun, content: []}}
  end

end

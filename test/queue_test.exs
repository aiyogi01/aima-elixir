defmodule QueueTest do
  use ExUnit.Case
  doctest Queue

  def assert_popped_equals(queue, expected) do
    {element, queue} = Queue.pop(queue)
    assert element == expected
    queue
  end

  test "empty queue pops nil" do
    q = Queue.new(:fifo)
    {elem, q} = Queue.pop(q)
    assert elem == nil
    assert Queue.empty?(q)
  end

  test "FIFO queue" do
    q = Queue.new(:fifo)
    |> Queue.add(0)
    |> Queue.add(1)
    |> Queue.add(2)

    q = q
    |> assert_popped_equals(0)
    |> assert_popped_equals(1)
    |> assert_popped_equals(2)

    assert Queue.empty?(q)
  end

  test "LIFO queue" do
    q = Queue.new(:lifo)
    |> Queue.add(0)
    |> Queue.add(1)
    |> Queue.add(2)

    q = q
    |> assert_popped_equals(2)
    |> assert_popped_equals(1)
    |> assert_popped_equals(0)

    assert Queue.empty?(q)
  end

  test "priority queue" do
    q = Queue.new(:priority, fn (x, y) -> x.cost < y.cost end)
    |> Queue.add(%{state: "a", cost: 2})
    |> Queue.add(%{state: "b", cost: 0})
    |> Queue.add(%{state: "c", cost: 1})

    q = q
    |> assert_popped_equals(%{state: "b", cost: 0})
    |> assert_popped_equals(%{state: "c", cost: 1})
    |> assert_popped_equals(%{state: "a", cost: 2})

    assert Queue.empty?(q)
  end

end

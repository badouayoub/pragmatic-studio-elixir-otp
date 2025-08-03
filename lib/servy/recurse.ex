defmodule Recurse do
  def loopy([head | tail]) do
    IO.puts("Head: #{head} Tail: #{inspect(tail)}")
    loopy(tail)
  end

  def loopy([]), do: IO.puts("Done!")

  def sum([head | tail], total) do
    sum(tail, total + head)
  end

  def sum([], total), do: total

  def triple([head | tail]) do
    IO.puts("Head: #{head * 3} Tail: #{inspect(tail)}")
    [head * 3 | triple(tail)]
  end

  def triple([]), do: []

  def triple_tail_opti(list), do: triple_tail_opti(list, [])

  defp triple_tail_opti([head | tail], current_list) do
    triple_tail_opti(tail, [head * 3 | current_list])
  end

  defp triple_tail_opti([], current_list), do: current_list |> Enum.reverse()
end

Recurse.sum([1, 2, 3, 4, 5, 5], 0) |> IO.puts()
Recurse.triple([1, 2, 3, 4, 5, 5]) |> IO.inspect()
Recurse.triple_tail_opti([1, 2, 3, 4, 5, 5]) |> IO.inspect()

defmodule Day1 do
    def read_from_file(trim \\ true) do
      case {trim, File.read!("./day1.txt")} do
        {true, data} -> String.trim(data) 
        {_, data} -> data
      end
    end

    def input, do: read_from_file()

    def run(input \\ input()) do
      calories = parse(input)

      IO.inspect(calories)
     {
          Enum.max(calories),
          calories |> Enum.sort(:desc) |> Enum.take(3) |> Enum.sum()
      }
    end

    def parse(data) do
      data
      |> String.split("\n")
      |> Enum.reduce({[], 0}, fn "", {calories, total} -> {[total | calories], 0}
        calorie, {calories, total} -> {calories, total + String.to_integer(calorie)}
      end)
      |> then(fn {calories, last_calorie} -> [last_calorie | calories] end)
    end
end

defmodule Challenge do
  @moduledoc """
  challenge 1 obtains a message of letters, the entire chain of letters will be counted to
  find out how many letters are the same and place the letter number on the right side of the
  letter counted, in case of not having equality a letter with the one that follows it will
  be will place the letter without number to the right.
  """

  @doc """
  enter_msg() is a function that obtains a string of characters and turns it into a list to
  then show a String with the number of equal letters and their number next to the letter,
  otherwise it will only show the letter without number.

  ## Example

    iex> c ("challenge1.exs)
    iex> Solution.enter_msg()
    aahhssjkssl
    "a2h2s2jks2l"

  """
  @spec enter_msg() :: String.t()
  def enter_msg do
    msg = IO.gets("") |> String.trim()
    new_msg = String.split(msg, "")
    IO.inspect(counter(new_msg -- ["", ""], 1, "", ""))
  end

  @spec counter(message :: list(), count :: integer, str :: String.t(), str2 :: String.t()) :: String.t()
  defp counter([hd | []], count, str, _str2) when count == 1, do: str <> "#{hd}"
  defp counter([hd | []], count, str, str2) when str2 == hd, do: str <> str2 <> "#{count}"
  defp counter([hd | tl], count, str, _str2) when hd == hd(tl), do: counter(tl, count + 1, str, "#{hd}")
  defp counter([_hd | tl], count, str, str2) when count > 1, do: counter(tl, 1, str <> str2 <> "#{count}", str2)
  defp counter([hd | tl], count, str, str2) when count == 1, do: counter(tl, count, str <> "#{hd}", str2)
end

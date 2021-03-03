defmodule WebScraping do
  @moduledoc """
  Documentation for `WebScraping`.
  """
  def star_scraping do
    get_books()
    |> format_content()
  end

  def get_books do
    IO.puts "Livros: Elixir"

    case HTTPoison.get("https://elixir-lang.org/learning.html") do
      {:ok, %HTTPoison.Response{body: body}} ->
        content = body
        |> Floki.find("a.cover")
        |> Floki.attribute("title")
        |> Floki.text(sep: "->")
        |> String.split("->")
      {:ok, content}
    end
  end

  def format_content{_, content} do
    Enum.map(content, fn str ->
      IO.puts"*****************************************************"
      IO.puts" " <> str
    end)
  end

end

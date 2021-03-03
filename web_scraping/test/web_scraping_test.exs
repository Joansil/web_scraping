defmodule WebScrapingTest do
  use ExUnit.Case
  doctest WebScraping

  test "greets the world" do
    assert WebScraping.hello() == :world
  end
end

defmodule Servy do
  def greet(name) do
    "Hello, #{name}"
  end
end

IO.puts(Servy.greet("Ayoub"))

defmodule HttpServerTest do
  use ExUnit.Case

  alias Servy.HttpServer
  alias Servy.HttpClient

  test "Testing HttpSever" do
    port = 5678
    spawn(HttpServer, :start, [port])

    parent = self()
    max_concurrent_requests = 5

    for _ <- 1..max_concurrent_requests do
      spawn(fn ->
        {:ok, response} = HTTPoison.get("localhost:" <> Integer.to_string(port) <> "/wildthings")

        send(parent, {:ok, response})
      end)
    end

    for _ <- 1..max_concurrent_requests do
      receive do
        {:ok, response} ->
          assert response.status_code == 200
          assert response.body == "Bears, Lions, Tigers"
      end
    end
  end
end

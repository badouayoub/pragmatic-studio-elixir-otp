defmodule HttpServerTest do
  alias Servy.HttpServer
  use ExUnit.Case

  alias Servy.HttpServer
  alias Servy.HttpClient

  test "Testing HttpSever" do
    port = 5678
    spawn(HttpServer, :start, [port])

    request = """
    GET /wildthings HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = HttpClient.send(request, port)

    assert response == """
           HTTP/1.1 200 OK\r
           Content-Type: text/html\r
           Content-Length: 20\r
           \r
           Bears, Lions, Tigers
           """
  end
end

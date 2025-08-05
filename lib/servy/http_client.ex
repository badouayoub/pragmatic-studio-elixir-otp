defmodule Servy.HttpClient do
  def send() do
    host = ~c"localhost"

    request = ~c"""
    GET /bears HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    {:ok, sock} = :gen_tcp.connect(host, 5678, [:binary, packet: :raw, active: false])
    :ok = :gen_tcp.send(sock, request)

    {:ok, response} = :gen_tcp.recv(sock, 0)
    IO.puts(response)

    :ok = :gen_tcp.close(sock)
  end
end

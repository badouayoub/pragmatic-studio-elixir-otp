defmodule Servy.HttpClient do
  def send(request, port) do
    host = ~c"localhost"

    {:ok, sock} = :gen_tcp.connect(host, port, [:binary, packet: :raw, active: false])
    :ok = :gen_tcp.send(sock, request)

    {:ok, response} = :gen_tcp.recv(sock, 0)

    :gen_tcp.close(sock)
    response
  end
end

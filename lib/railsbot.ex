defmodule Railsbot do
  use Summer.API

  def handle_raw(conn, "376", _sender, _receiver, _message) do
    conn |> Summer.Connection.join("#logga")
  end

  def handle_raw(_conn, _, _sender, _receiver, _message) do
    # A raw that we don't care about.
  end

  def handle_command(conn, %{ nick: nick, hostname: hostname }, receiver, "botsnack", _opts) do
    conn |> Summer.Connection.privmsg(receiver, "Nom nom. Thanks, #{nick}!")
  end
end

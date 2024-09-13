defmodule Engine.Session do
  @moduledoc """
  Provides API endpoint related to session
  """

  @default_client Engine.Client

  @doc """
  Initialize interactive session

  Start a new interactive session with a server. Session allows server to
  call back to the client for advanced capabilities.

  ### Hijacking

  This endpoint hijacks the HTTP connection to HTTP2 transport that allows
  the client to expose gPRC services on that connection.

  For example, the client sends this request to upgrade the connection:

  ```
  POST /session HTTP/1.1
  Upgrade: h2c
  Connection: Upgrade
  ```

  The Docker daemon responds with a `101 UPGRADED` response follow with
  the raw stream:

  ```
  HTTP/1.1 101 UPGRADED
  Connection: Upgrade
  Upgrade: h2c
  ```

  """
  @spec session(keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def session(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.Session, :session},
      url: "/session",
      method: :post,
      response: [
        {101, :null},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end
end

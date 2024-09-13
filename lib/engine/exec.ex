defmodule Engine.Exec do
  @moduledoc """
  Provides API endpoints related to exec
  """

  @default_client Engine.Client

  @doc """
  Create an exec instance

  Run a command inside a running container.
  """
  @spec container_exec(String.t(), map, keyword) ::
          {:ok, Engine.IdResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def container_exec(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Exec, :container_exec},
      url: "/containers/#{id}/exec",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Engine.IdResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type exec_inspect_200_json_resp :: %{
          CanRemove: boolean | nil,
          ContainerID: String.t() | nil,
          DetachKeys: String.t() | nil,
          ExitCode: integer | nil,
          ID: String.t() | nil,
          OpenStderr: boolean | nil,
          OpenStdin: boolean | nil,
          OpenStdout: boolean | nil,
          Pid: integer | nil,
          ProcessConfig: Engine.ProcessConfig.t() | nil,
          Running: boolean | nil
        }

  @doc """
  Inspect an exec instance

  Return low-level information about an exec instance.
  """
  @spec exec_inspect(String.t(), keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def exec_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Exec, :exec_inspect},
      url: "/exec/#{id}/json",
      method: :get,
      response: [
        {200, {Engine.Exec, :exec_inspect_200_json_resp}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Resize an exec instance

  Resize the TTY session used by an exec instance. This endpoint only works
  if `tty` was specified as part of creating and starting the exec instance.


  ## Options

    * `h`: Height of the TTY session in characters
    * `w`: Width of the TTY session in characters

  """
  @spec exec_resize(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def exec_resize(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:h, :w])

    client.request(%{
      args: [id: id],
      call: {Engine.Exec, :exec_resize},
      url: "/exec/#{id}/resize",
      method: :post,
      query: query,
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Start an exec instance

  Starts a previously set up exec instance. If detach is true, this endpoint
  returns immediately after starting the command. Otherwise, it sets up an
  interactive session with the command.

  """
  @spec exec_start(String.t(), map, keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def exec_start(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Exec, :exec_start},
      url: "/exec/#{id}/start",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:exec_inspect_200_json_resp) do
    [
      CanRemove: :boolean,
      ContainerID: {:string, :generic},
      DetachKeys: {:string, :generic},
      ExitCode: :integer,
      ID: {:string, :generic},
      OpenStderr: :boolean,
      OpenStdin: :boolean,
      OpenStdout: :boolean,
      Pid: :integer,
      ProcessConfig: {Engine.ProcessConfig, :t},
      Running: :boolean
    ]
  end
end

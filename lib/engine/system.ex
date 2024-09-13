defmodule Engine.System do
  @moduledoc """
  Provides API endpoints related to system
  """

  @default_client Engine.Client

  @type system_auth_200_json_resp :: %{IdentityToken: String.t() | nil, Status: String.t()}

  @doc """
  Check auth configuration

  Validate credentials for a registry and, if available, get an identity
  token for accessing the registry without password.

  """
  @spec system_auth(Engine.AuthConfig.t(), keyword) ::
          {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def system_auth(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.System, :system_auth},
      url: "/auth",
      body: body,
      method: :post,
      request: [{"application/json", {Engine.AuthConfig, :t}}],
      response: [
        {200, {Engine.System, :system_auth_200_json_resp}},
        {204, :null},
        {401, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type system_data_usage_200__resp :: %{
          BuildCache: [Engine.BuildCache.t()] | nil,
          Containers: [Engine.ContainerSummary.t()] | nil,
          Images: [Engine.ImageSummary.t()] | nil,
          LayersSize: integer | nil,
          Volumes: [Engine.Volume.t()] | nil
        }

  @type system_data_usage_200_json_resp :: %{
          BuildCache: [Engine.BuildCache.t()] | nil,
          Containers: [Engine.ContainerSummary.t()] | nil,
          Images: [Engine.ImageSummary.t()] | nil,
          LayersSize: integer | nil,
          Volumes: [Engine.Volume.t()] | nil
        }

  @doc """
  Get data usage information

  ## Options

    * `type`: Object types, for which to compute and return data.
      

  """
  @spec system_data_usage(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def system_data_usage(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:type])

    client.request(%{
      args: [],
      call: {Engine.System, :system_data_usage},
      url: "/system/df",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            {Engine.System, :system_data_usage_200__resp},
            {Engine.System, :system_data_usage_200_json_resp}
          ]}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Monitor events

  Stream real-time events from the server.

  Various objects within Docker report events when something happens to them.

  Containers report these events: `attach`, `commit`, `copy`, `create`, `destroy`, `detach`, `die`, `exec_create`, `exec_detach`, `exec_start`, `exec_die`, `export`, `health_status`, `kill`, `oom`, `pause`, `rename`, `resize`, `restart`, `start`, `stop`, `top`, `unpause`, `update`, and `prune`

  Images report these events: `create`, `delete`, `import`, `load`, `pull`, `push`, `save`, `tag`, `untag`, and `prune`

  Volumes report these events: `create`, `mount`, `unmount`, `destroy`, and `prune`

  Networks report these events: `create`, `connect`, `disconnect`, `destroy`, `update`, `remove`, and `prune`

  The Docker daemon reports these events: `reload`

  Services report these events: `create`, `update`, and `remove`

  Nodes report these events: `create`, `update`, and `remove`

  Secrets report these events: `create`, `update`, and `remove`

  Configs report these events: `create`, `update`, and `remove`

  The Builder reports `prune` events


  ## Options

    * `since`: Show events created since this timestamp then stream new events.
    * `until`: Show events created until this timestamp then stop streaming.
    * `filters`: A JSON encoded value of filters (a `map[string][]string`) to process on the event list. Available filters:
      
      - `config=<string>` config name or ID
      - `container=<string>` container name or ID
      - `daemon=<string>` daemon name or ID
      - `event=<string>` event type
      - `image=<string>` image name or ID
      - `label=<string>` image or container label
      - `network=<string>` network name or ID
      - `node=<string>` node ID
      - `plugin`=<string> plugin name or ID
      - `scope`=<string> local or swarm
      - `secret=<string>` secret name or ID
      - `service=<string>` service name or ID
      - `type=<string>` object to filter by, one of `container`, `image`, `volume`, `network`, `daemon`, `plugin`, `node`, `service`, `secret` or `config`
      - `volume=<string>` volume name
      

  """
  @spec system_events(keyword) ::
          {:ok, Engine.EventMessage.t()} | {:error, Engine.ErrorResponse.t()}
  def system_events(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters, :since, :until])

    client.request(%{
      args: [],
      call: {Engine.System, :system_events},
      url: "/events",
      method: :get,
      query: query,
      response: [
        {200, {Engine.EventMessage, :t}},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get system information
  """
  @spec system_info(keyword) :: {:ok, Engine.SystemInfo.t()} | {:error, Engine.ErrorResponse.t()}
  def system_info(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.System, :system_info},
      url: "/info",
      method: :get,
      response: [{200, {Engine.SystemInfo, :t}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Ping

  This is a dummy endpoint you can use to test if the server is accessible.
  """
  @spec system_ping(keyword) :: {:ok, String.t()} | {:error, Engine.ErrorResponse.t()}
  def system_ping(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.System, :system_ping},
      url: "/_ping",
      method: :get,
      response: [{200, {:string, :generic}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Ping

  This is a dummy endpoint you can use to test if the server is accessible.
  """
  @spec system_ping_head(keyword) :: {:ok, String.t()} | {:error, Engine.ErrorResponse.t()}
  def system_ping_head(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.System, :system_ping_head},
      url: "/_ping",
      method: :head,
      response: [{200, {:string, :generic}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get version

  Returns the version of Docker that is running and various information about the system that Docker is running on.
  """
  @spec system_version(keyword) ::
          {:ok, Engine.SystemVersion.t()} | {:error, Engine.ErrorResponse.t()}
  def system_version(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.System, :system_version},
      url: "/version",
      method: :get,
      response: [{200, {Engine.SystemVersion, :t}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:system_auth_200_json_resp) do
    [IdentityToken: {:string, :generic}, Status: {:string, :generic}]
  end

  def __fields__(:system_data_usage_200__resp) do
    [
      BuildCache: [{Engine.BuildCache, :t}],
      Containers: [{Engine.ContainerSummary, :t}],
      Images: [{Engine.ImageSummary, :t}],
      LayersSize: :integer,
      Volumes: [{Engine.Volume, :t}]
    ]
  end

  def __fields__(:system_data_usage_200_json_resp) do
    [
      BuildCache: [{Engine.BuildCache, :t}],
      Containers: [{Engine.ContainerSummary, :t}],
      Images: [{Engine.ImageSummary, :t}],
      LayersSize: :integer,
      Volumes: [{Engine.Volume, :t}]
    ]
  end
end

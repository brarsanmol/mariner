defmodule Engine.Network do
  @moduledoc """
  Provides API endpoints related to network
  """

  @default_client Engine.Client

  @doc """
  Connect a container to a network

  The network must be either a local-scoped network or a swarm-scoped network with the `attachable` option set. A network cannot be re-attached to a running container
  """
  @spec network_connect(String.t(), map, keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def network_connect(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Network, :network_connect},
      url: "/networks/#{id}/connect",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {403, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a network
  """
  @spec network_create(map, keyword) ::
          {:ok, Engine.NetworkCreateResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def network_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Network, :network_create},
      url: "/networks/create",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Engine.NetworkCreateResponse, :t}},
        {400, {Engine.ErrorResponse, :t}},
        {403, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a network
  """
  @spec network_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def network_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Network, :network_delete},
      url: "/networks/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Disconnect a container from a network
  """
  @spec network_disconnect(String.t(), map, keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def network_disconnect(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Network, :network_disconnect},
      url: "/networks/#{id}/disconnect",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {403, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect a network

  ## Options

    * `verbose`: Detailed inspect output for troubleshooting
    * `scope`: Filter the network by scope (swarm, global, or local)

  """
  @spec network_inspect(String.t(), keyword) ::
          {:ok, Engine.Network.t()} | {:error, Engine.ErrorResponse.t()}
  def network_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:scope, :verbose])

    client.request(%{
      args: [id: id],
      call: {Engine.Network, :network_inspect},
      url: "/networks/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Engine.Network, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List networks

  Returns a list of networks. For details on the format, see the
  [network inspect endpoint](#operation/NetworkInspect).

  Note that it uses a different, smaller representation of a network than
  inspecting a single network. For example, the list of containers attached
  to the network is not propagated in API versions 1.28 and up.


  ## Options

    * `filters`: JSON encoded value of the filters (a `map[string][]string`) to process
      on the networks list.
      
      Available filters:
      
      - `dangling=<boolean>` When set to `true` (or `1`), returns all
         networks that are not in use by a container. When set to `false`
         (or `0`), only networks that are in use by one or more
         containers are returned.
      - `driver=<driver-name>` Matches a network's driver.
      - `id=<network-id>` Matches all or part of a network ID.
      - `label=<key>` or `label=<key>=<value>` of a network label.
      - `name=<network-name>` Matches all or part of a network name.
      - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`, `global`, or `local`).
      - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword returns all user-defined networks.
      

  """
  @spec network_list(keyword) :: {:ok, [Engine.Network.t()]} | {:error, Engine.ErrorResponse.t()}
  def network_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Network, :network_list},
      url: "/networks",
      method: :get,
      query: query,
      response: [{200, [{Engine.Network, :t}]}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type network_prune_200_json_resp :: %{NetworksDeleted: [String.t()] | nil}

  @doc """
  Delete unused networks

  ## Options

    * `filters`: Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      
      Available filters:
      - `until=<timestamp>` Prune networks created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
      - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...` is used) the specified labels.
      

  """
  @spec network_prune(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def network_prune(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Network, :network_prune},
      url: "/networks/prune",
      method: :post,
      query: query,
      response: [
        {200, {Engine.Network, :network_prune_200_json_resp}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          Attachable: boolean | nil,
          ConfigFrom: Engine.ConfigReference.t() | nil,
          ConfigOnly: boolean | nil,
          Containers: Engine.NetworkContainers.t() | nil,
          Created: String.t() | nil,
          Driver: String.t() | nil,
          EnableIPv4: boolean | nil,
          EnableIPv6: boolean | nil,
          IPAM: Engine.IPAM.t() | nil,
          Id: String.t() | nil,
          Ingress: boolean | nil,
          Internal: boolean | nil,
          Labels: Engine.NetworkLabels.t() | nil,
          Name: String.t() | nil,
          Options: Engine.NetworkOptions.t() | nil,
          Peers: [Engine.PeerInfo.t()] | nil,
          Scope: String.t() | nil
        }

  defstruct [
    :Attachable,
    :ConfigFrom,
    :ConfigOnly,
    :Containers,
    :Created,
    :Driver,
    :EnableIPv4,
    :EnableIPv6,
    :IPAM,
    :Id,
    :Ingress,
    :Internal,
    :Labels,
    :Name,
    :Options,
    :Peers,
    :Scope
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:network_prune_200_json_resp) do
    [NetworksDeleted: [string: :generic]]
  end

  def __fields__(:t) do
    [
      Attachable: :boolean,
      ConfigFrom: {Engine.ConfigReference, :t},
      ConfigOnly: :boolean,
      Containers: {Engine.NetworkContainers, :t},
      Created: {:string, :generic},
      Driver: {:string, :generic},
      EnableIPv4: :boolean,
      EnableIPv6: :boolean,
      IPAM: {Engine.IPAM, :t},
      Id: {:string, :generic},
      Ingress: :boolean,
      Internal: :boolean,
      Labels: {Engine.NetworkLabels, :t},
      Name: {:string, :generic},
      Options: {Engine.NetworkOptions, :t},
      Peers: [{Engine.PeerInfo, :t}],
      Scope: {:string, :generic}
    ]
  end
end

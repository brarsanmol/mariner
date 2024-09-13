defmodule Engine.Swarm do
  @moduledoc """
  Provides API endpoints related to swarm
  """

  @default_client Engine.Client

  @doc """
  Initialize a new swarm
  """
  @spec swarm_init(map, keyword) :: {:ok, String.t()} | {:error, Engine.ErrorResponse.t()}
  def swarm_init(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Swarm, :swarm_init},
      url: "/swarm/init",
      body: body,
      method: :post,
      request: [{"application/json", :map}, {"text/plain", :map}],
      response: [
        {200, {:string, :generic}},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect swarm
  """
  @spec swarm_inspect(keyword) :: {:ok, Engine.Swarm.t()} | {:error, Engine.ErrorResponse.t()}
  def swarm_inspect(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.Swarm, :swarm_inspect},
      url: "/swarm",
      method: :get,
      response: [
        {200, {Engine.Swarm, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Join an existing swarm
  """
  @spec swarm_join(map, keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def swarm_join(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Swarm, :swarm_join},
      url: "/swarm/join",
      body: body,
      method: :post,
      request: [{"application/json", :map}, {"text/plain", :map}],
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Leave a swarm

  ## Options

    * `force`: Force leave swarm, even if this is the last manager or that it will
      break the cluster.
      

  """
  @spec swarm_leave(keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def swarm_leave(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force])

    client.request(%{
      args: [],
      call: {Engine.Swarm, :swarm_leave},
      url: "/swarm/leave",
      method: :post,
      query: query,
      response: [
        {200, :null},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Unlock a locked manager
  """
  @spec swarm_unlock(map, keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def swarm_unlock(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Swarm, :swarm_unlock},
      url: "/swarm/unlock",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, :null},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type swarm_unlockkey_200__resp :: %{UnlockKey: String.t() | nil}

  @type swarm_unlockkey_200_json_resp :: %{UnlockKey: String.t() | nil}

  @doc """
  Get the unlock key
  """
  @spec swarm_unlockkey(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def swarm_unlockkey(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engine.Swarm, :swarm_unlockkey},
      url: "/swarm/unlockkey",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Engine.Swarm, :swarm_unlockkey_200__resp},
            {Engine.Swarm, :swarm_unlockkey_200_json_resp}
          ]}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a swarm

  ## Options

    * `version`: The version number of the swarm object being updated. This is
      required to avoid conflicting writes.
      
    * `rotateWorkerToken`: Rotate the worker join token.
    * `rotateManagerToken`: Rotate the manager join token.
    * `rotateManagerUnlockKey`: Rotate the manager unlock key.

  """
  @spec swarm_update(Engine.SwarmSpec.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def swarm_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :rotateManagerToken,
        :rotateManagerUnlockKey,
        :rotateWorkerToken,
        :version
      ])

    client.request(%{
      args: [body: body],
      call: {Engine.Swarm, :swarm_update},
      url: "/swarm/update",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", {Engine.SwarmSpec, :t}},
        {"text/plain", {Engine.SwarmSpec, :t}}
      ],
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          CreatedAt: String.t() | nil,
          DataPathPort: integer | nil,
          DefaultAddrPool: [String.t()] | nil,
          ID: String.t() | nil,
          JoinTokens: Engine.JoinTokens.t() | nil,
          RootRotationInProgress: boolean | nil,
          Spec: Engine.SwarmSpec.t() | nil,
          SubnetSize: integer | nil,
          TLSInfo: Engine.TLSInfo.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [
    :CreatedAt,
    :DataPathPort,
    :DefaultAddrPool,
    :ID,
    :JoinTokens,
    :RootRotationInProgress,
    :Spec,
    :SubnetSize,
    :TLSInfo,
    :UpdatedAt,
    :Version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:swarm_unlockkey_200__resp) do
    [UnlockKey: {:string, :generic}]
  end

  def __fields__(:swarm_unlockkey_200_json_resp) do
    [UnlockKey: {:string, :generic}]
  end

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      DataPathPort: :integer,
      DefaultAddrPool: [string: :generic],
      ID: {:string, :generic},
      JoinTokens: {Engine.JoinTokens, :t},
      RootRotationInProgress: :boolean,
      Spec: {Engine.SwarmSpec, :t},
      SubnetSize: :integer,
      TLSInfo: {Engine.TLSInfo, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

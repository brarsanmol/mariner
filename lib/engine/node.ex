defmodule Engine.Node do
  @moduledoc """
  Provides API endpoints related to node
  """

  @default_client Engine.Client

  @doc """
  Delete a node

  ## Options

    * `force`: Force remove a node from the swarm

  """
  @spec node_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def node_delete(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force])

    client.request(%{
      args: [id: id],
      call: {Engine.Node, :node_delete},
      url: "/nodes/#{id}",
      method: :delete,
      query: query,
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect a node
  """
  @spec node_inspect(String.t(), keyword) ::
          {:ok, Engine.Node.t()} | {:error, Engine.ErrorResponse.t()}
  def node_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Node, :node_inspect},
      url: "/nodes/#{id}",
      method: :get,
      response: [
        {200, {Engine.Node, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List nodes

  ## Options

    * `filters`: Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
      
      Available filters:
      - `id=<node id>`
      - `label=<engine label>`
      - `membership=`(`accepted`|`pending`)`
      - `name=<node name>`
      - `node.label=<node label>`
      - `role=`(`manager`|`worker`)`
      

  """
  @spec node_list(keyword) :: {:ok, [Engine.Node.t()]} | {:error, Engine.ErrorResponse.t()}
  def node_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Node, :node_list},
      url: "/nodes",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.Node, :t}]},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a node

  ## Options

    * `version`: The version number of the node object being updated. This is required
      to avoid conflicting writes.
      

  """
  @spec node_update(String.t(), Engine.NodeSpec.t(), keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def node_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:version])

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Node, :node_update},
      url: "/nodes/#{id}/update",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", {Engine.NodeSpec, :t}},
        {"text/plain", {Engine.NodeSpec, :t}}
      ],
      response: [
        {200, :null},
        {400, {Engine.ErrorResponse, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          CreatedAt: String.t() | nil,
          Description: Engine.NodeDescription.t() | nil,
          ID: String.t() | nil,
          ManagerStatus: Engine.ManagerStatus.t() | nil,
          Spec: Engine.NodeSpec.t() | nil,
          Status: Engine.NodeStatus.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [:CreatedAt, :Description, :ID, :ManagerStatus, :Spec, :Status, :UpdatedAt, :Version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      Description: {Engine.NodeDescription, :t},
      ID: {:string, :generic},
      ManagerStatus: {Engine.ManagerStatus, :t},
      Spec: {Engine.NodeSpec, :t},
      Status: {Engine.NodeStatus, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

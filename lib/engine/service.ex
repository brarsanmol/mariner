defmodule Engine.Service do
  @moduledoc """
  Provides API endpoints related to service
  """

  @default_client Engine.Client

  @doc """
  Create a service
  """
  @spec service_create(map, keyword) ::
          {:ok, Engine.ServiceCreateResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def service_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Service, :service_create},
      url: "/services/create",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Engine.ServiceCreateResponse, :t}},
        {400, {Engine.ErrorResponse, :t}},
        {403, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a service
  """
  @spec service_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def service_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Service, :service_delete},
      url: "/services/#{id}",
      method: :delete,
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
  Inspect a service

  ## Options

    * `insertDefaults`: Fill empty fields with default values.

  """
  @spec service_inspect(String.t(), keyword) ::
          {:ok, Engine.Service.t()} | {:error, Engine.ErrorResponse.t()}
  def service_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:insertDefaults])

    client.request(%{
      args: [id: id],
      call: {Engine.Service, :service_inspect},
      url: "/services/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Engine.Service, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List services

  ## Options

    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the services list.
      
      Available filters:
      
      - `id=<service id>`
      - `label=<service label>`
      - `mode=["replicated"|"global"]`
      - `name=<service name>`
      
    * `status`: Include service status, with count of running and desired tasks.
      

  """
  @spec service_list(keyword) :: {:ok, [Engine.Service.t()]} | {:error, Engine.ErrorResponse.t()}
  def service_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters, :status])

    client.request(%{
      args: [],
      call: {Engine.Service, :service_list},
      url: "/services",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.Service, :t}]},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get service logs

  Get `stdout` and `stderr` logs from a service. See also
  [`/containers/{id}/logs`](#operation/ContainerLogs).

  **Note**: This endpoint works only for services with the `local`,
  `json-file` or `journald` logging drivers.


  ## Options

    * `details`: Show service context and extra details provided to logs.
    * `follow`: Keep connection after returning logs.
    * `stdout`: Return logs from `stdout`
    * `stderr`: Return logs from `stderr`
    * `since`: Only return logs since this time, as a UNIX timestamp
    * `timestamps`: Add timestamps to every log line
    * `tail`: Only return this number of log lines from the end of the logs.
      Specify as an integer or `all` to output all log lines.
      

  """
  @spec service_logs(String.t(), keyword) ::
          {:ok, String.t()} | {:error, any | Engine.ErrorResponse.t()}
  def service_logs(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:details, :follow, :since, :stderr, :stdout, :tail, :timestamps])

    client.request(%{
      args: [id: id],
      call: {Engine.Service, :service_logs},
      url: "/services/#{id}/logs",
      method: :get,
      query: query,
      response: [
        {200, {:string, :generic}},
        {404, {:union, [:unknown, {Engine.ErrorResponse, :t}]}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a service

  ## Options

    * `version`: The version number of the service object being updated. This is
      required to avoid conflicting writes.
      This version number should be the value as currently set on the
      service *before* the update. You can find the current version by
      calling `GET /services/{id}`
      
    * `registryAuthFrom`: If the `X-Registry-Auth` header is not specified, this parameter
      indicates where to find registry authorization credentials.
      
    * `rollback`: Set to this parameter to `previous` to cause a server-side rollback
      to the previous service spec. The supplied spec will be ignored in
      this case.
      

  """
  @spec service_update(String.t(), map, keyword) ::
          {:ok, Engine.ServiceUpdateResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def service_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:registryAuthFrom, :rollback, :version])

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Service, :service_update},
      url: "/services/#{id}/update",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Engine.ServiceUpdateResponse, :t}},
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
          Endpoint: Engine.ServiceEndpoint.t() | nil,
          ID: String.t() | nil,
          JobStatus: Engine.ServiceJobStatus.t() | nil,
          ServiceStatus: Engine.ServiceServiceStatus.t() | nil,
          Spec: Engine.ServiceSpec.t() | nil,
          UpdateStatus: Engine.ServiceUpdateStatus.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [
    :CreatedAt,
    :Endpoint,
    :ID,
    :JobStatus,
    :ServiceStatus,
    :Spec,
    :UpdateStatus,
    :UpdatedAt,
    :Version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      Endpoint: {Engine.ServiceEndpoint, :t},
      ID: {:string, :generic},
      JobStatus: {Engine.ServiceJobStatus, :t},
      ServiceStatus: {Engine.ServiceServiceStatus, :t},
      Spec: {Engine.ServiceSpec, :t},
      UpdateStatus: {Engine.ServiceUpdateStatus, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

defmodule Engine.Secret do
  @moduledoc """
  Provides API endpoints related to secret
  """

  @default_client Engine.Client

  @doc """
  Create a secret
  """
  @spec secret_create(map, keyword) ::
          {:ok, Engine.IdResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def secret_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Secret, :secret_create},
      url: "/secrets/create",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Engine.IdResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a secret
  """
  @spec secret_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def secret_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Secret, :secret_delete},
      url: "/secrets/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect a secret
  """
  @spec secret_inspect(String.t(), keyword) ::
          {:ok, Engine.Secret.t()} | {:error, Engine.ErrorResponse.t()}
  def secret_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Secret, :secret_inspect},
      url: "/secrets/#{id}",
      method: :get,
      response: [
        {200, {Engine.Secret, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List secrets

  ## Options

    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the secrets list.
      
      Available filters:
      
      - `id=<secret id>`
      - `label=<key> or label=<key>=value`
      - `name=<secret name>`
      - `names=<secret name>`
      

  """
  @spec secret_list(keyword) :: {:ok, [Engine.Secret.t()]} | {:error, Engine.ErrorResponse.t()}
  def secret_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Secret, :secret_list},
      url: "/secrets",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.Secret, :t}]},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a Secret

  ## Options

    * `version`: The version number of the secret object being updated. This is
      required to avoid conflicting writes.
      

  """
  @spec secret_update(String.t(), Engine.SecretSpec.t(), keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def secret_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:version])

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Secret, :secret_update},
      url: "/secrets/#{id}/update",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", {Engine.SecretSpec, :t}},
        {"text/plain", {Engine.SecretSpec, :t}}
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
          ID: String.t() | nil,
          Spec: Engine.SecretSpec.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [:CreatedAt, :ID, :Spec, :UpdatedAt, :Version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      ID: {:string, :generic},
      Spec: {Engine.SecretSpec, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

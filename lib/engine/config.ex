defmodule Engine.Config do
  @moduledoc """
  Provides API endpoints related to config
  """

  @default_client Engine.Client

  @doc """
  Create a config
  """
  @spec config_create(map, keyword) ::
          {:ok, Engine.IdResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def config_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Config, :config_create},
      url: "/configs/create",
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
  Delete a config
  """
  @spec config_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def config_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Config, :config_delete},
      url: "/configs/#{id}",
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
  Inspect a config
  """
  @spec config_inspect(String.t(), keyword) ::
          {:ok, Engine.Config.t()} | {:error, Engine.ErrorResponse.t()}
  def config_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Config, :config_inspect},
      url: "/configs/#{id}",
      method: :get,
      response: [
        {200, {Engine.Config, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List configs

  ## Options

    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the configs list.

      Available filters:

      - `id=<config id>`
      - `label=<key> or label=<key>=value`
      - `name=<config name>`
      - `names=<config name>`


  """
  @spec config_list(keyword) :: {:ok, [Engine.Config.t()]} | {:error, Engine.ErrorResponse.t()}
  def config_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Config, :config_list},
      url: "/configs",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.Config, :t}]},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a Config

  ## Options

    * `version`: The version number of the config object being updated. This is
      required to avoid conflicting writes.


  """
  @spec config_update(String.t(), Engine.ConfigSpec.t(), keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def config_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:version])

    client.request(%{
      args: [id: id, body: body],
      call: {Engine.Config, :config_update},
      url: "/configs/#{id}/update",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", {Engine.ConfigSpec, :t}},
        {"text/plain", {Engine.ConfigSpec, :t}}
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
          Spec: Engine.ConfigSpec.t() | nil,
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
      Spec: {Engine.ConfigSpec, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

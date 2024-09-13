defmodule Engine.Plugin do
  @moduledoc """
  Provides API endpoints related to plugin
  """

  @default_client Engine.Client

  @doc """
  Get plugin privileges

  ## Options

    * `remote`: The name of the plugin. The `:latest` tag is optional, and is the
      default if omitted.
      

  """
  @spec get_plugin_privileges(keyword) ::
          {:ok, [Engine.PluginPrivilege.t()]} | {:error, Engine.ErrorResponse.t()}
  def get_plugin_privileges(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:remote])

    client.request(%{
      args: [],
      call: {Engine.Plugin, :get_plugin_privileges},
      url: "/plugins/privileges",
      method: :get,
      query: query,
      response: [{200, [{Engine.PluginPrivilege, :t}]}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a plugin

  ## Options

    * `name`: The name of the plugin. The `:latest` tag is optional, and is the
      default if omitted.
      

  """
  @spec plugin_create(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name])

    client.request(%{
      args: [body: body],
      call: {Engine.Plugin, :plugin_create},
      url: "/plugins/create",
      body: body,
      method: :post,
      query: query,
      request: [{"application/x-tar", {:string, :generic}}],
      response: [{204, :null}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Remove a plugin

  ## Options

    * `force`: Disable the plugin before removing. This may result in issues if the
      plugin is in use by a container.
      

  """
  @spec plugin_delete(String.t(), keyword) ::
          {:ok, Engine.Plugin.t()} | {:error, Engine.ErrorResponse.t()}
  def plugin_delete(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force])

    client.request(%{
      args: [name: name],
      call: {Engine.Plugin, :plugin_delete},
      url: "/plugins/#{name}",
      method: :delete,
      query: query,
      response: [
        {200, {Engine.Plugin, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Disable a plugin

  ## Options

    * `force`: Force disable a plugin even if still in use.
      

  """
  @spec plugin_disable(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_disable(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force])

    client.request(%{
      args: [name: name],
      call: {Engine.Plugin, :plugin_disable},
      url: "/plugins/#{name}/disable",
      method: :post,
      query: query,
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Enable a plugin

  ## Options

    * `timeout`: Set the HTTP client timeout (in seconds)

  """
  @spec plugin_enable(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_enable(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:timeout])

    client.request(%{
      args: [name: name],
      call: {Engine.Plugin, :plugin_enable},
      url: "/plugins/#{name}/enable",
      method: :post,
      query: query,
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect a plugin
  """
  @spec plugin_inspect(String.t(), keyword) ::
          {:ok, Engine.Plugin.t()} | {:error, Engine.ErrorResponse.t()}
  def plugin_inspect(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Plugin, :plugin_inspect},
      url: "/plugins/#{name}/json",
      method: :get,
      response: [
        {200, {Engine.Plugin, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List plugins

  Returns information about installed plugins.

  ## Options

    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the plugin list.
      
      Available filters:
      
      - `capability=<capability name>`
      - `enable=<true>|<false>`
      

  """
  @spec plugin_list(keyword) :: {:ok, [Engine.Plugin.t()]} | {:error, Engine.ErrorResponse.t()}
  def plugin_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Plugin, :plugin_list},
      url: "/plugins",
      method: :get,
      query: query,
      response: [{200, [{Engine.Plugin, :t}]}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Install a plugin

  Pulls and installs a plugin. After the plugin is installed, it can be
  enabled using the [`POST /plugins/{name}/enable` endpoint](#operation/PostPluginsEnable).


  ## Options

    * `remote`: Remote reference for plugin to install.
      
      The `:latest` tag is optional, and is used as the default if omitted.
      
    * `name`: Local name for the pulled plugin.
      
      The `:latest` tag is optional, and is used as the default if omitted.
      

  """
  @spec plugin_pull([Engine.PluginPrivilege.t()], keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_pull(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name, :remote])

    client.request(%{
      args: [body: body],
      call: {Engine.Plugin, :plugin_pull},
      url: "/plugins/pull",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", [{Engine.PluginPrivilege, :t}]},
        {"text/plain", [{Engine.PluginPrivilege, :t}]}
      ],
      response: [{204, :null}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Push a plugin

  Push a plugin to the registry.

  """
  @spec plugin_push(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_push(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Plugin, :plugin_push},
      url: "/plugins/#{name}/push",
      method: :post,
      response: [
        {200, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Configure a plugin
  """
  @spec plugin_set(String.t(), [String.t()], keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_set(name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name, body: body],
      call: {Engine.Plugin, :plugin_set},
      url: "/plugins/#{name}/set",
      body: body,
      method: :post,
      request: [{"application/json", [string: :generic]}],
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Upgrade a plugin

  ## Options

    * `remote`: Remote reference to upgrade to.
      
      The `:latest` tag is optional, and is used as the default if omitted.
      

  """
  @spec plugin_upgrade(String.t(), [Engine.PluginPrivilege.t()], keyword) ::
          :ok | {:error, Engine.ErrorResponse.t()}
  def plugin_upgrade(name, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:remote])

    client.request(%{
      args: [name: name, body: body],
      call: {Engine.Plugin, :plugin_upgrade},
      url: "/plugins/#{name}/upgrade",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", [{Engine.PluginPrivilege, :t}]},
        {"text/plain", [{Engine.PluginPrivilege, :t}]}
      ],
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          Config: Engine.PluginConfig.t(),
          Enabled: boolean,
          Id: String.t() | nil,
          Name: String.t(),
          PluginReference: String.t() | nil,
          Settings: Engine.PluginSettings.t()
        }

  defstruct [:Config, :Enabled, :Id, :Name, :PluginReference, :Settings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Config: {Engine.PluginConfig, :t},
      Enabled: :boolean,
      Id: {:string, :generic},
      Name: {:string, :generic},
      PluginReference: {:string, :generic},
      Settings: {Engine.PluginSettings, :t}
    ]
  end
end

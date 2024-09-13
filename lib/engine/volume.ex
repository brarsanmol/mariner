defmodule Engine.Volume do
  @moduledoc """
  Provides API endpoints related to volume
  """

  @default_client Engine.Client

  @doc """
  Create a volume
  """
  @spec volume_create(Engine.VolumeCreateOptions.t(), keyword) ::
          {:ok, Engine.Volume.t()} | {:error, Engine.ErrorResponse.t()}
  def volume_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Engine.Volume, :volume_create},
      url: "/volumes/create",
      body: body,
      method: :post,
      request: [{"application/json", {Engine.VolumeCreateOptions, :t}}],
      response: [{201, {Engine.Volume, :t}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Remove a volume

  Instruct the driver to remove the volume.

  ## Options

    * `force`: Force the removal of the volume

  """
  @spec volume_delete(String.t(), keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def volume_delete(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force])

    client.request(%{
      args: [name: name],
      call: {Engine.Volume, :volume_delete},
      url: "/volumes/#{name}",
      method: :delete,
      query: query,
      response: [
        {204, :null},
        {404, {Engine.ErrorResponse, :t}},
        {409, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Inspect a volume
  """
  @spec volume_inspect(String.t(), keyword) ::
          {:ok, Engine.Volume.t()} | {:error, Engine.ErrorResponse.t()}
  def volume_inspect(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Engine.Volume, :volume_inspect},
      url: "/volumes/#{name}",
      method: :get,
      response: [
        {200, {Engine.Volume, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List volumes

  ## Options

    * `filters`: JSON encoded value of the filters (a `map[string][]string`) to
      process on the volumes list. Available filters:
      
      - `dangling=<boolean>` When set to `true` (or `1`), returns all
         volumes that are not in use by a container. When set to `false`
         (or `0`), only volumes that are in use by one or more
         containers are returned.
      - `driver=<volume-driver-name>` Matches volumes based on their driver.
      - `label=<key>` or `label=<key>:<value>` Matches volumes based on
         the presence of a `label` alone or a `label` and a value.
      - `name=<volume-name>` Matches all or part of a volume name.
      

  """
  @spec volume_list(keyword) ::
          {:ok, Engine.VolumeListResponse.t()} | {:error, Engine.ErrorResponse.t()}
  def volume_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Volume, :volume_list},
      url: "/volumes",
      method: :get,
      query: query,
      response: [{200, {Engine.VolumeListResponse, :t}}, {500, {Engine.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type volume_prune_200_json_resp :: %{
          SpaceReclaimed: integer | nil,
          VolumesDeleted: [String.t()] | nil
        }

  @doc """
  Delete unused volumes

  ## Options

    * `filters`: Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      
      Available filters:
      - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...` is used) the specified labels.
      - `all` (`all=true`) - Consider all (local) volumes for pruning and not just anonymous volumes.
      

  """
  @spec volume_prune(keyword) :: {:ok, map} | {:error, Engine.ErrorResponse.t()}
  def volume_prune(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Volume, :volume_prune},
      url: "/volumes/prune",
      method: :post,
      query: query,
      response: [
        {200, {Engine.Volume, :volume_prune_200_json_resp}},
        {500, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  "Update a volume. Valid only for Swarm cluster volumes"


  ## Options

    * `version`: The version number of the volume being updated. This is required to
      avoid conflicting writes. Found in the volume's `ClusterVolume`
      field.
      

  """
  @spec volume_update(String.t(), map, keyword) :: :ok | {:error, Engine.ErrorResponse.t()}
  def volume_update(name, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:version])

    client.request(%{
      args: [name: name, body: body],
      call: {Engine.Volume, :volume_update},
      url: "/volumes/#{name}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
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
          ClusterVolume: Engine.ClusterVolume.t() | nil,
          CreatedAt: String.t() | nil,
          Driver: String.t(),
          Labels: Engine.VolumeLabels.t(),
          Mountpoint: String.t(),
          Name: String.t(),
          Options: Engine.VolumeOptions.t(),
          Scope: String.t(),
          Status: Engine.VolumeStatus.t() | nil,
          UsageData: Engine.VolumeUsageData.t() | nil
        }

  defstruct [
    :ClusterVolume,
    :CreatedAt,
    :Driver,
    :Labels,
    :Mountpoint,
    :Name,
    :Options,
    :Scope,
    :Status,
    :UsageData
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ClusterVolume: {Engine.ClusterVolume, :t},
      CreatedAt: {:string, :generic},
      Driver: {:string, :generic},
      Labels: {Engine.VolumeLabels, :t},
      Mountpoint: {:string, :generic},
      Name: {:string, :generic},
      Options: {Engine.VolumeOptions, :t},
      Scope: {:enum, ["local", "global"]},
      Status: {Engine.VolumeStatus, :t},
      UsageData: {Engine.VolumeUsageData, :t}
    ]
  end

  def __fields__(:volume_prune_200_json_resp) do
    [SpaceReclaimed: :integer, VolumesDeleted: [string: :generic]]
  end
end

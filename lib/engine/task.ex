defmodule Engine.Task do
  @moduledoc """
  Provides API endpoints related to task
  """

  @default_client Engine.Client

  @doc """
  Inspect a task
  """
  @spec task_inspect(String.t(), keyword) ::
          {:ok, Engine.Task.t()} | {:error, Engine.ErrorResponse.t()}
  def task_inspect(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Engine.Task, :task_inspect},
      url: "/tasks/#{id}",
      method: :get,
      response: [
        {200, {Engine.Task, :t}},
        {404, {Engine.ErrorResponse, :t}},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List tasks

  ## Options

    * `filters`: A JSON encoded value of the filters (a `map[string][]string`) to
      process on the tasks list.
      
      Available filters:
      
      - `desired-state=(running | shutdown | accepted)`
      - `id=<task id>`
      - `label=key` or `label="key=value"`
      - `name=<task name>`
      - `node=<node id or name>`
      - `service=<service name>`
      

  """
  @spec task_list(keyword) :: {:ok, [Engine.Task.t()]} | {:error, Engine.ErrorResponse.t()}
  def task_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filters])

    client.request(%{
      args: [],
      call: {Engine.Task, :task_list},
      url: "/tasks",
      method: :get,
      query: query,
      response: [
        {200, [{Engine.Task, :t}]},
        {500, {Engine.ErrorResponse, :t}},
        {503, {Engine.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get task logs

  Get `stdout` and `stderr` logs from a task.
  See also [`/containers/{id}/logs`](#operation/ContainerLogs).

  **Note**: This endpoint works only for services with the `local`,
  `json-file` or `journald` logging drivers.


  ## Options

    * `details`: Show task context and extra details provided to logs.
    * `follow`: Keep connection after returning logs.
    * `stdout`: Return logs from `stdout`
    * `stderr`: Return logs from `stderr`
    * `since`: Only return logs since this time, as a UNIX timestamp
    * `timestamps`: Add timestamps to every log line
    * `tail`: Only return this number of log lines from the end of the logs.
      Specify as an integer or `all` to output all log lines.
      

  """
  @spec task_logs(String.t(), keyword) ::
          {:ok, String.t()} | {:error, any | Engine.ErrorResponse.t()}
  def task_logs(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:details, :follow, :since, :stderr, :stdout, :tail, :timestamps])

    client.request(%{
      args: [id: id],
      call: {Engine.Task, :task_logs},
      url: "/tasks/#{id}/logs",
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

  @type t :: %__MODULE__{
          AssignedGenericResources: [Engine.GenericResources.t()] | nil,
          CreatedAt: String.t() | nil,
          DesiredState: String.t() | nil,
          ID: String.t() | nil,
          JobIteration: Engine.ObjectVersion.t() | nil,
          Labels: Engine.TaskLabels.t() | nil,
          Name: String.t() | nil,
          NodeID: String.t() | nil,
          ServiceID: String.t() | nil,
          Slot: integer | nil,
          Spec: Engine.TaskSpec.t() | nil,
          Status: Engine.TaskStatus.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [
    :AssignedGenericResources,
    :CreatedAt,
    :DesiredState,
    :ID,
    :JobIteration,
    :Labels,
    :Name,
    :NodeID,
    :ServiceID,
    :Slot,
    :Spec,
    :Status,
    :UpdatedAt,
    :Version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AssignedGenericResources: [{Engine.GenericResources, :t}],
      CreatedAt: {:string, :generic},
      DesiredState:
        {:enum,
         [
           "new",
           "allocated",
           "pending",
           "assigned",
           "accepted",
           "preparing",
           "ready",
           "starting",
           "running",
           "complete",
           "shutdown",
           "failed",
           "rejected",
           "remove",
           "orphaned"
         ]},
      ID: {:string, :generic},
      JobIteration: {Engine.ObjectVersion, :t},
      Labels: {Engine.TaskLabels, :t},
      Name: {:string, :generic},
      NodeID: {:string, :generic},
      ServiceID: {:string, :generic},
      Slot: :integer,
      Spec: {Engine.TaskSpec, :t},
      Status: {Engine.TaskStatus, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

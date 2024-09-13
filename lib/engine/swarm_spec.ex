defmodule Engine.SwarmSpec do
  @moduledoc """
  Provides struct and type for a SwarmSpec
  """

  @type t :: %__MODULE__{
          CAConfig: Engine.SwarmSpecCAConfig.t() | nil,
          Dispatcher: Engine.SwarmSpecDispatcher.t() | nil,
          EncryptionConfig: Engine.SwarmSpecEncryptionConfig.t() | nil,
          Labels: Engine.SwarmSpecLabels.t() | nil,
          Name: String.t() | nil,
          Orchestration: Engine.SwarmSpecOrchestration.t() | nil,
          Raft: Engine.SwarmSpecRaft.t() | nil,
          TaskDefaults: Engine.SwarmSpecTaskDefaults.t() | nil
        }

  defstruct [
    :CAConfig,
    :Dispatcher,
    :EncryptionConfig,
    :Labels,
    :Name,
    :Orchestration,
    :Raft,
    :TaskDefaults
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CAConfig: {Engine.SwarmSpecCAConfig, :t},
      Dispatcher: {Engine.SwarmSpecDispatcher, :t},
      EncryptionConfig: {Engine.SwarmSpecEncryptionConfig, :t},
      Labels: {Engine.SwarmSpecLabels, :t},
      Name: {:string, :generic},
      Orchestration: {Engine.SwarmSpecOrchestration, :t},
      Raft: {Engine.SwarmSpecRaft, :t},
      TaskDefaults: {Engine.SwarmSpecTaskDefaults, :t}
    ]
  end
end

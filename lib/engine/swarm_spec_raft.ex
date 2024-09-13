defmodule Engine.SwarmSpecRaft do
  @moduledoc """
  Provides struct and type for a SwarmSpecRaft
  """

  @type t :: %__MODULE__{
          ElectionTick: integer | nil,
          HeartbeatTick: integer | nil,
          KeepOldSnapshots: integer | nil,
          LogEntriesForSlowFollowers: integer | nil,
          SnapshotInterval: integer | nil
        }

  defstruct [
    :ElectionTick,
    :HeartbeatTick,
    :KeepOldSnapshots,
    :LogEntriesForSlowFollowers,
    :SnapshotInterval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ElectionTick: :integer,
      HeartbeatTick: :integer,
      KeepOldSnapshots: :integer,
      LogEntriesForSlowFollowers: :integer,
      SnapshotInterval: :integer
    ]
  end
end

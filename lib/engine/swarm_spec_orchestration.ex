defmodule Engine.SwarmSpecOrchestration do
  @moduledoc """
  Provides struct and type for a SwarmSpecOrchestration
  """

  @type t :: %__MODULE__{TaskHistoryRetentionLimit: integer | nil}

  defstruct [:TaskHistoryRetentionLimit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [TaskHistoryRetentionLimit: :integer]
  end
end

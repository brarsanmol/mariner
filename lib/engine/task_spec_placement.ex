defmodule Engine.TaskSpecPlacement do
  @moduledoc """
  Provides struct and type for a TaskSpecPlacement
  """

  @type t :: %__MODULE__{
          Constraints: [String.t()] | nil,
          MaxReplicas: integer | nil,
          Platforms: [Engine.Platform.t()] | nil,
          Preferences: [Engine.TaskSpecPlacementPreferences.t()] | nil
        }

  defstruct [:Constraints, :MaxReplicas, :Platforms, :Preferences]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Constraints: [string: :generic],
      MaxReplicas: :integer,
      Platforms: [{Engine.Platform, :t}],
      Preferences: [{Engine.TaskSpecPlacementPreferences, :t}]
    ]
  end
end

defmodule Engine.TaskSpecPlacementPreferences do
  @moduledoc """
  Provides struct and type for a TaskSpecPlacementPreferences
  """

  @type t :: %__MODULE__{Spread: Engine.TaskSpecPlacementPreferencesSpread.t() | nil}

  defstruct [:Spread]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Spread: {Engine.TaskSpecPlacementPreferencesSpread, :t}]
  end
end

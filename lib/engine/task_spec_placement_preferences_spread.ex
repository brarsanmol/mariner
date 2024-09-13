defmodule Engine.TaskSpecPlacementPreferencesSpread do
  @moduledoc """
  Provides struct and type for a TaskSpecPlacementPreferencesSpread
  """

  @type t :: %__MODULE__{SpreadDescriptor: String.t() | nil}

  defstruct [:SpreadDescriptor]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [SpreadDescriptor: {:string, :generic}]
  end
end

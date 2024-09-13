defmodule Engine.TaskSpecContainerSpecPrivilegesAppArmor do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecPrivilegesAppArmor
  """

  @type t :: %__MODULE__{Mode: String.t() | nil}

  defstruct [:Mode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Mode: {:enum, ["default", "disabled"]}]
  end
end

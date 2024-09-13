defmodule Engine.TaskSpecContainerSpecPrivilegesSeccomp do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecPrivilegesSeccomp
  """

  @type t :: %__MODULE__{Mode: String.t() | nil, Profile: String.t() | nil}

  defstruct [:Mode, :Profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Mode: {:enum, ["default", "unconfined", "custom"]}, Profile: {:string, :generic}]
  end
end

defmodule Engine.TaskSpecContainerSpecUlimits do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecUlimits
  """

  @type t :: %__MODULE__{Hard: integer | nil, Name: String.t() | nil, Soft: integer | nil}

  defstruct [:Hard, :Name, :Soft]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Hard: :integer, Name: {:string, :generic}, Soft: :integer]
  end
end

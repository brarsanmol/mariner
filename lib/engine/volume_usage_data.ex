defmodule Engine.VolumeUsageData do
  @moduledoc """
  Provides struct and type for a VolumeUsageData
  """

  @type t :: %__MODULE__{RefCount: integer, Size: integer}

  defstruct [:RefCount, :Size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [RefCount: :integer, Size: :integer]
  end
end

defmodule Engine.ClusterVolumeSpecAccessModeCapacityRange do
  @moduledoc """
  Provides struct and type for a ClusterVolumeSpecAccessModeCapacityRange
  """

  @type t :: %__MODULE__{LimitBytes: integer | nil, RequiredBytes: integer | nil}

  defstruct [:LimitBytes, :RequiredBytes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [LimitBytes: :integer, RequiredBytes: :integer]
  end
end

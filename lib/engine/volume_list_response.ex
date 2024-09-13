defmodule Engine.VolumeListResponse do
  @moduledoc """
  Provides struct and type for a VolumeListResponse
  """

  @type t :: %__MODULE__{Volumes: [Engine.Volume.t()] | nil, Warnings: [String.t()] | nil}

  defstruct [:Volumes, :Warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Volumes: [{Engine.Volume, :t}], Warnings: [string: :generic]]
  end
end

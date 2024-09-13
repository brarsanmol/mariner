defmodule Engine.ClusterVolumeSpec do
  @moduledoc """
  Provides struct and type for a ClusterVolumeSpec
  """

  @type t :: %__MODULE__{
          AccessMode: Engine.ClusterVolumeSpecAccessMode.t() | nil,
          Group: String.t() | nil
        }

  defstruct [:AccessMode, :Group]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [AccessMode: {Engine.ClusterVolumeSpecAccessMode, :t}, Group: {:string, :generic}]
  end
end

defmodule Engine.ClusterVolumeInfo do
  @moduledoc """
  Provides struct and type for a ClusterVolumeInfo
  """

  @type t :: %__MODULE__{
          AccessibleTopology: [Engine.Topology.t()] | nil,
          CapacityBytes: integer | nil,
          VolumeContext: Engine.ClusterVolumeInfoVolumeContext.t() | nil,
          VolumeID: String.t() | nil
        }

  defstruct [:AccessibleTopology, :CapacityBytes, :VolumeContext, :VolumeID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AccessibleTopology: [{Engine.Topology, :t}],
      CapacityBytes: :integer,
      VolumeContext: {Engine.ClusterVolumeInfoVolumeContext, :t},
      VolumeID: {:string, :generic}
    ]
  end
end

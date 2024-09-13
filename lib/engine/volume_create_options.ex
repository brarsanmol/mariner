defmodule Engine.VolumeCreateOptions do
  @moduledoc """
  Provides struct and type for a VolumeCreateOptions
  """

  @type t :: %__MODULE__{
          ClusterVolumeSpec: Engine.ClusterVolumeSpec.t() | nil,
          Driver: String.t() | nil,
          DriverOpts: Engine.VolumeCreateOptionsDriverOpts.t() | nil,
          Labels: Engine.VolumeCreateOptionsLabels.t() | nil,
          Name: String.t() | nil
        }

  defstruct [:ClusterVolumeSpec, :Driver, :DriverOpts, :Labels, :Name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ClusterVolumeSpec: {Engine.ClusterVolumeSpec, :t},
      Driver: {:string, :generic},
      DriverOpts: {Engine.VolumeCreateOptionsDriverOpts, :t},
      Labels: {Engine.VolumeCreateOptionsLabels, :t},
      Name: {:string, :generic}
    ]
  end
end

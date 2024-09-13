defmodule Engine.MountVolumeOptions do
  @moduledoc """
  Provides struct and type for a MountVolumeOptions
  """

  @type t :: %__MODULE__{
          DriverConfig: Engine.MountVolumeOptionsDriverConfig.t() | nil,
          Labels: Engine.MountVolumeOptionsLabels.t() | nil,
          NoCopy: boolean | nil,
          Subpath: String.t() | nil
        }

  defstruct [:DriverConfig, :Labels, :NoCopy, :Subpath]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      DriverConfig: {Engine.MountVolumeOptionsDriverConfig, :t},
      Labels: {Engine.MountVolumeOptionsLabels, :t},
      NoCopy: :boolean,
      Subpath: {:string, :generic}
    ]
  end
end

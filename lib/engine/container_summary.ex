defmodule Engine.ContainerSummary do
  @moduledoc """
  Provides struct and type for a ContainerSummary
  """

  @type t :: %__MODULE__{
          Command: String.t() | nil,
          Created: integer | nil,
          HostConfig: Engine.ContainerSummaryHostConfig.t() | nil,
          Id: String.t() | nil,
          Image: String.t() | nil,
          ImageID: String.t() | nil,
          Labels: Engine.ContainerSummaryLabels.t() | nil,
          Mounts: [Engine.MountPoint.t()] | nil,
          Names: [String.t()] | nil,
          NetworkSettings: Engine.ContainerSummaryNetworkSettings.t() | nil,
          Ports: [Engine.Port.t()] | nil,
          SizeRootFs: integer | nil,
          SizeRw: integer | nil,
          State: String.t() | nil,
          Status: String.t() | nil
        }

  defstruct [
    :Command,
    :Created,
    :HostConfig,
    :Id,
    :Image,
    :ImageID,
    :Labels,
    :Mounts,
    :Names,
    :NetworkSettings,
    :Ports,
    :SizeRootFs,
    :SizeRw,
    :State,
    :Status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Command: {:string, :generic},
      Created: :integer,
      HostConfig: {Engine.ContainerSummaryHostConfig, :t},
      Id: {:string, :generic},
      Image: {:string, :generic},
      ImageID: {:string, :generic},
      Labels: {Engine.ContainerSummaryLabels, :t},
      Mounts: [{Engine.MountPoint, :t}],
      Names: [string: :generic],
      NetworkSettings: {Engine.ContainerSummaryNetworkSettings, :t},
      Ports: [{Engine.Port, :t}],
      SizeRootFs: :integer,
      SizeRw: :integer,
      State: {:string, :generic},
      Status: {:string, :generic}
    ]
  end
end

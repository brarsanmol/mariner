defmodule Engine.PluginConfigLinux do
  @moduledoc """
  Provides struct and type for a PluginConfigLinux
  """

  @type t :: %__MODULE__{
          AllowAllDevices: boolean,
          Capabilities: [String.t()],
          Devices: [Engine.PluginDevice.t()]
        }

  defstruct [:AllowAllDevices, :Capabilities, :Devices]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AllowAllDevices: :boolean,
      Capabilities: [string: :generic],
      Devices: [{Engine.PluginDevice, :t}]
    ]
  end
end

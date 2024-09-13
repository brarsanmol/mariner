defmodule Engine.PluginSettings do
  @moduledoc """
  Provides struct and type for a PluginSettings
  """

  @type t :: %__MODULE__{
          Args: [String.t()],
          Devices: [Engine.PluginDevice.t()],
          Env: [String.t()],
          Mounts: [Engine.PluginMount.t()]
        }

  defstruct [:Args, :Devices, :Env, :Mounts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Args: [string: :generic],
      Devices: [{Engine.PluginDevice, :t}],
      Env: [string: :generic],
      Mounts: [{Engine.PluginMount, :t}]
    ]
  end
end

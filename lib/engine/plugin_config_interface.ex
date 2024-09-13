defmodule Engine.PluginConfigInterface do
  @moduledoc """
  Provides struct and type for a PluginConfigInterface
  """

  @type t :: %__MODULE__{
          ProtocolScheme: String.t() | nil,
          Socket: String.t(),
          Types: [Engine.PluginInterfaceType.t()]
        }

  defstruct [:ProtocolScheme, :Socket, :Types]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ProtocolScheme: {:enum, ["", "moby.plugins.http/v1"]},
      Socket: {:string, :generic},
      Types: [{Engine.PluginInterfaceType, :t}]
    ]
  end
end

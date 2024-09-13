defmodule Engine.PluginInterfaceType do
  @moduledoc """
  Provides struct and type for a PluginInterfaceType
  """

  @type t :: %__MODULE__{Capability: String.t(), Prefix: String.t(), Version: String.t()}

  defstruct [:Capability, :Prefix, :Version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Capability: {:string, :generic}, Prefix: {:string, :generic}, Version: {:string, :generic}]
  end
end

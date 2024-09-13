defmodule Engine.PortStatus do
  @moduledoc """
  Provides struct and type for a PortStatus
  """

  @type t :: %__MODULE__{Ports: [Engine.EndpointPortConfig.t()] | nil}

  defstruct [:Ports]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Ports: [{Engine.EndpointPortConfig, :t}]]
  end
end

defmodule Engine.EndpointSpec do
  @moduledoc """
  Provides struct and type for a EndpointSpec
  """

  @type t :: %__MODULE__{Mode: String.t() | nil, Ports: [Engine.EndpointPortConfig.t()] | nil}

  defstruct [:Mode, :Ports]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Mode: {:enum, ["vip", "dnsrr"]}, Ports: [{Engine.EndpointPortConfig, :t}]]
  end
end

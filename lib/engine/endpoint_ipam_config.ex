defmodule Engine.EndpointIPAMConfig do
  @moduledoc """
  Provides struct and type for a EndpointIPAMConfig
  """

  @type t :: %__MODULE__{
          IPv4Address: String.t() | nil,
          IPv6Address: String.t() | nil,
          LinkLocalIPs: [String.t()] | nil
        }

  defstruct [:IPv4Address, :IPv6Address, :LinkLocalIPs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      IPv4Address: {:string, :generic},
      IPv6Address: {:string, :generic},
      LinkLocalIPs: [string: :generic]
    ]
  end
end

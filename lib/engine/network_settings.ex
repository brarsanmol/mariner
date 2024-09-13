defmodule Engine.NetworkSettings do
  @moduledoc """
  Provides struct and type for a NetworkSettings
  """

  @type t :: %__MODULE__{
          Bridge: String.t() | nil,
          EndpointID: String.t() | nil,
          Gateway: String.t() | nil,
          GlobalIPv6Address: String.t() | nil,
          GlobalIPv6PrefixLen: integer | nil,
          HairpinMode: boolean | nil,
          IPAddress: String.t() | nil,
          IPPrefixLen: integer | nil,
          IPv6Gateway: String.t() | nil,
          LinkLocalIPv6Address: String.t() | nil,
          LinkLocalIPv6PrefixLen: integer | nil,
          MacAddress: String.t() | nil,
          Networks: Engine.NetworkSettingsNetworks.t() | nil,
          Ports: Engine.PortMap.t() | nil,
          SandboxID: String.t() | nil,
          SandboxKey: String.t() | nil,
          SecondaryIPAddresses: [Engine.Address.t()] | nil,
          SecondaryIPv6Addresses: [Engine.Address.t()] | nil
        }

  defstruct [
    :Bridge,
    :EndpointID,
    :Gateway,
    :GlobalIPv6Address,
    :GlobalIPv6PrefixLen,
    :HairpinMode,
    :IPAddress,
    :IPPrefixLen,
    :IPv6Gateway,
    :LinkLocalIPv6Address,
    :LinkLocalIPv6PrefixLen,
    :MacAddress,
    :Networks,
    :Ports,
    :SandboxID,
    :SandboxKey,
    :SecondaryIPAddresses,
    :SecondaryIPv6Addresses
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Bridge: {:string, :generic},
      EndpointID: {:string, :generic},
      Gateway: {:string, :generic},
      GlobalIPv6Address: {:string, :generic},
      GlobalIPv6PrefixLen: :integer,
      HairpinMode: :boolean,
      IPAddress: {:string, :generic},
      IPPrefixLen: :integer,
      IPv6Gateway: {:string, :generic},
      LinkLocalIPv6Address: {:string, :generic},
      LinkLocalIPv6PrefixLen: :integer,
      MacAddress: {:string, :generic},
      Networks: {Engine.NetworkSettingsNetworks, :t},
      Ports: {Engine.PortMap, :t},
      SandboxID: {:string, :generic},
      SandboxKey: {:string, :generic},
      SecondaryIPAddresses: [{Engine.Address, :t}],
      SecondaryIPv6Addresses: [{Engine.Address, :t}]
    ]
  end
end

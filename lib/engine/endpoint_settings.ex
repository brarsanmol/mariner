defmodule Engine.EndpointSettings do
  @moduledoc """
  Provides struct and type for a EndpointSettings
  """

  @type t :: %__MODULE__{
          Aliases: [String.t()] | nil,
          DNSNames: [String.t()] | nil,
          DriverOpts: Engine.EndpointSettingsDriverOpts.t() | nil,
          EndpointID: String.t() | nil,
          Gateway: String.t() | nil,
          GlobalIPv6Address: String.t() | nil,
          GlobalIPv6PrefixLen: integer | nil,
          IPAMConfig: Engine.EndpointIPAMConfig.t() | nil,
          IPAddress: String.t() | nil,
          IPPrefixLen: integer | nil,
          IPv6Gateway: String.t() | nil,
          Links: [String.t()] | nil,
          MacAddress: String.t() | nil,
          NetworkID: String.t() | nil
        }

  defstruct [
    :Aliases,
    :DNSNames,
    :DriverOpts,
    :EndpointID,
    :Gateway,
    :GlobalIPv6Address,
    :GlobalIPv6PrefixLen,
    :IPAMConfig,
    :IPAddress,
    :IPPrefixLen,
    :IPv6Gateway,
    :Links,
    :MacAddress,
    :NetworkID
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Aliases: [string: :generic],
      DNSNames: [string: :generic],
      DriverOpts: {Engine.EndpointSettingsDriverOpts, :t},
      EndpointID: {:string, :generic},
      Gateway: {:string, :generic},
      GlobalIPv6Address: {:string, :generic},
      GlobalIPv6PrefixLen: :integer,
      IPAMConfig: {Engine.EndpointIPAMConfig, :t},
      IPAddress: {:string, :generic},
      IPPrefixLen: :integer,
      IPv6Gateway: {:string, :generic},
      Links: [string: :generic],
      MacAddress: {:string, :generic},
      NetworkID: {:string, :generic}
    ]
  end
end

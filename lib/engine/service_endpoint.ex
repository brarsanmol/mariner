defmodule Engine.ServiceEndpoint do
  @moduledoc """
  Provides struct and type for a ServiceEndpoint
  """

  @type t :: %__MODULE__{
          Ports: [Engine.EndpointPortConfig.t()] | nil,
          Spec: Engine.EndpointSpec.t() | nil,
          VirtualIPs: [Engine.ServiceEndpointVirtualIPs.t()] | nil
        }

  defstruct [:Ports, :Spec, :VirtualIPs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Ports: [{Engine.EndpointPortConfig, :t}],
      Spec: {Engine.EndpointSpec, :t},
      VirtualIPs: [{Engine.ServiceEndpointVirtualIPs, :t}]
    ]
  end
end

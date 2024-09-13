defmodule Engine.NetworkingConfig do
  @moduledoc """
  Provides struct and type for a NetworkingConfig
  """

  @type t :: %__MODULE__{EndpointsConfig: Engine.NetworkingConfigEndpointsConfig.t() | nil}

  defstruct [:EndpointsConfig]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [EndpointsConfig: {Engine.NetworkingConfigEndpointsConfig, :t}]
  end
end

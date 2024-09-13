defmodule Engine.ContainerSummaryNetworkSettings do
  @moduledoc """
  Provides struct and type for a ContainerSummaryNetworkSettings
  """

  @type t :: %__MODULE__{Networks: Engine.ContainerSummaryNetworkSettingsNetworks.t() | nil}

  defstruct [:Networks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Networks: {Engine.ContainerSummaryNetworkSettingsNetworks, :t}]
  end
end

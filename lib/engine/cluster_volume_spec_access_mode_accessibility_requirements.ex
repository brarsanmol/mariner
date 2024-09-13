defmodule Engine.ClusterVolumeSpecAccessModeAccessibilityRequirements do
  @moduledoc """
  Provides struct and type for a ClusterVolumeSpecAccessModeAccessibilityRequirements
  """

  @type t :: %__MODULE__{
          Preferred: [Engine.Topology.t()] | nil,
          Requisite: [Engine.Topology.t()] | nil
        }

  defstruct [:Preferred, :Requisite]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Preferred: [{Engine.Topology, :t}], Requisite: [{Engine.Topology, :t}]]
  end
end

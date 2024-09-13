defmodule Engine.ClusterVolumeSpecAccessMode do
  @moduledoc """
  Provides struct and type for a ClusterVolumeSpecAccessMode
  """

  @type t :: %__MODULE__{
          AccessibilityRequirements:
            Engine.ClusterVolumeSpecAccessModeAccessibilityRequirements.t() | nil,
          Availability: String.t() | nil,
          CapacityRange: Engine.ClusterVolumeSpecAccessModeCapacityRange.t() | nil,
          MountVolume: map | nil,
          Scope: String.t() | nil,
          Secrets: [Engine.ClusterVolumeSpecAccessModeSecrets.t()] | nil,
          Sharing: String.t() | nil
        }

  defstruct [
    :AccessibilityRequirements,
    :Availability,
    :CapacityRange,
    :MountVolume,
    :Scope,
    :Secrets,
    :Sharing
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AccessibilityRequirements:
        {Engine.ClusterVolumeSpecAccessModeAccessibilityRequirements, :t},
      Availability: {:enum, ["active", "pause", "drain"]},
      CapacityRange: {Engine.ClusterVolumeSpecAccessModeCapacityRange, :t},
      MountVolume: :map,
      Scope: {:enum, ["single", "multi"]},
      Secrets: [{Engine.ClusterVolumeSpecAccessModeSecrets, :t}],
      Sharing: {:enum, ["none", "readonly", "onewriter", "all"]}
    ]
  end
end

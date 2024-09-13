defmodule Engine.TaskSpec do
  @moduledoc """
  Provides struct and type for a TaskSpec
  """

  @type t :: %__MODULE__{
          ContainerSpec: Engine.TaskSpecContainerSpec.t() | nil,
          ForceUpdate: integer | nil,
          LogDriver: Engine.TaskSpecLogDriver.t() | nil,
          NetworkAttachmentSpec: Engine.TaskSpecNetworkAttachmentSpec.t() | nil,
          Networks: [Engine.NetworkAttachmentConfig.t()] | nil,
          Placement: Engine.TaskSpecPlacement.t() | nil,
          PluginSpec: Engine.TaskSpecPluginSpec.t() | nil,
          Resources: Engine.TaskSpecResources.t() | nil,
          RestartPolicy: Engine.TaskSpecRestartPolicy.t() | nil,
          Runtime: String.t() | nil
        }

  defstruct [
    :ContainerSpec,
    :ForceUpdate,
    :LogDriver,
    :NetworkAttachmentSpec,
    :Networks,
    :Placement,
    :PluginSpec,
    :Resources,
    :RestartPolicy,
    :Runtime
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ContainerSpec: {Engine.TaskSpecContainerSpec, :t},
      ForceUpdate: :integer,
      LogDriver: {Engine.TaskSpecLogDriver, :t},
      NetworkAttachmentSpec: {Engine.TaskSpecNetworkAttachmentSpec, :t},
      Networks: [{Engine.NetworkAttachmentConfig, :t}],
      Placement: {Engine.TaskSpecPlacement, :t},
      PluginSpec: {Engine.TaskSpecPluginSpec, :t},
      Resources: {Engine.TaskSpecResources, :t},
      RestartPolicy: {Engine.TaskSpecRestartPolicy, :t},
      Runtime: {:string, :generic}
    ]
  end
end

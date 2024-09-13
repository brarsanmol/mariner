defmodule Engine.ServiceSpec do
  @moduledoc """
  Provides struct and type for a ServiceSpec
  """

  @type t :: %__MODULE__{
          EndpointSpec: Engine.EndpointSpec.t() | nil,
          Labels: map | nil,
          Mode: map | nil,
          Name: String.t() | nil,
          Networks: [Engine.NetworkAttachmentConfig.t()] | nil,
          RollbackConfig: map | nil,
          TaskTemplate: Engine.TaskSpec.t() | nil,
          UpdateConfig: map | nil
        }

  defstruct [
    :EndpointSpec,
    :Labels,
    :Mode,
    :Name,
    :Networks,
    :RollbackConfig,
    :TaskTemplate,
    :UpdateConfig
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      EndpointSpec: {Engine.EndpointSpec, :t},
      Labels: :map,
      Mode: :map,
      Name: {:string, :generic},
      Networks: [{Engine.NetworkAttachmentConfig, :t}],
      RollbackConfig: :map,
      TaskTemplate: {Engine.TaskSpec, :t},
      UpdateConfig: :map
    ]
  end
end

defmodule Engine.RegistryServiceConfig do
  @moduledoc """
  Provides struct and type for a RegistryServiceConfig
  """

  @type t :: %__MODULE__{
          AllowNondistributableArtifactsCIDRs: [String.t()] | nil,
          AllowNondistributableArtifactsHostnames: [String.t()] | nil,
          IndexConfigs: Engine.RegistryServiceConfigIndexConfigs.t() | nil,
          InsecureRegistryCIDRs: [String.t()] | nil,
          Mirrors: [String.t()] | nil
        }

  defstruct [
    :AllowNondistributableArtifactsCIDRs,
    :AllowNondistributableArtifactsHostnames,
    :IndexConfigs,
    :InsecureRegistryCIDRs,
    :Mirrors
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AllowNondistributableArtifactsCIDRs: [string: :generic],
      AllowNondistributableArtifactsHostnames: [string: :generic],
      IndexConfigs: {Engine.RegistryServiceConfigIndexConfigs, :t},
      InsecureRegistryCIDRs: [string: :generic],
      Mirrors: [string: :generic]
    ]
  end
end

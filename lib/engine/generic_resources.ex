defmodule Engine.GenericResources do
  @moduledoc """
  Provides struct and type for a GenericResources
  """

  @type t :: %__MODULE__{
          DiscreteResourceSpec: Engine.GenericResourcesDiscreteResourceSpec.t() | nil,
          NamedResourceSpec: Engine.GenericResourcesNamedResourceSpec.t() | nil
        }

  defstruct [:DiscreteResourceSpec, :NamedResourceSpec]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      DiscreteResourceSpec: {Engine.GenericResourcesDiscreteResourceSpec, :t},
      NamedResourceSpec: {Engine.GenericResourcesNamedResourceSpec, :t}
    ]
  end
end

defmodule Engine.DistributionInspect do
  @moduledoc """
  Provides struct and type for a DistributionInspect
  """

  @type t :: %__MODULE__{
          Descriptor: Engine.OCIDescriptor.t(),
          Platforms: [Engine.OCIPlatform.t()]
        }

  defstruct [:Descriptor, :Platforms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Descriptor: {Engine.OCIDescriptor, :t}, Platforms: [{Engine.OCIPlatform, :t}]]
  end
end

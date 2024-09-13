defmodule Engine.ResourceObject do
  @moduledoc """
  Provides struct and type for a ResourceObject
  """

  @type t :: %__MODULE__{
          GenericResources: [Engine.GenericResources.t()] | nil,
          MemoryBytes: integer | nil,
          NanoCPUs: integer | nil
        }

  defstruct [:GenericResources, :MemoryBytes, :NanoCPUs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [GenericResources: [{Engine.GenericResources, :t}], MemoryBytes: :integer, NanoCPUs: :integer]
  end
end

defmodule Engine.ContainerSummaryHostConfig do
  @moduledoc """
  Provides struct and type for a ContainerSummaryHostConfig
  """

  @type t :: %__MODULE__{
          Annotations: Engine.ContainerSummaryHostConfigAnnotations.t() | nil,
          NetworkMode: String.t() | nil
        }

  defstruct [:Annotations, :NetworkMode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Annotations: {Engine.ContainerSummaryHostConfigAnnotations, :t},
      NetworkMode: {:string, :generic}
    ]
  end
end

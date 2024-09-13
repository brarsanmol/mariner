defmodule Engine.ImageManifestSummaryImageData do
  @moduledoc """
  Provides struct and type for a ImageManifestSummaryImageData
  """

  @type t :: %__MODULE__{
          Containers: [String.t()],
          Platform: Engine.OCIPlatform.t(),
          Size: Engine.ImageManifestSummaryImageDataSize.t()
        }

  defstruct [:Containers, :Platform, :Size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Containers: [string: :generic],
      Platform: {Engine.OCIPlatform, :t},
      Size: {Engine.ImageManifestSummaryImageDataSize, :t}
    ]
  end
end

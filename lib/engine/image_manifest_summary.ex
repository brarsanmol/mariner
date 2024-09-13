defmodule Engine.ImageManifestSummary do
  @moduledoc """
  Provides struct and type for a ImageManifestSummary
  """

  @type t :: %__MODULE__{
          AttestationData: Engine.ImageManifestSummaryAttestationData.t() | nil,
          Available: boolean,
          Descriptor: Engine.OCIDescriptor.t(),
          ID: String.t(),
          ImageData: Engine.ImageManifestSummaryImageData.t() | nil,
          Kind: String.t(),
          Size: Engine.ImageManifestSummarySize.t()
        }

  defstruct [:AttestationData, :Available, :Descriptor, :ID, :ImageData, :Kind, :Size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      AttestationData: {Engine.ImageManifestSummaryAttestationData, :t},
      Available: :boolean,
      Descriptor: {Engine.OCIDescriptor, :t},
      ID: {:string, :generic},
      ImageData: {Engine.ImageManifestSummaryImageData, :t},
      Kind: {:enum, ["image", "attestation", "unknown"]},
      Size: {Engine.ImageManifestSummarySize, :t}
    ]
  end
end

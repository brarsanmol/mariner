defmodule Engine.ImageSummary do
  @moduledoc """
  Provides struct and type for a ImageSummary
  """

  @type t :: %__MODULE__{
          Containers: integer,
          Created: integer,
          Id: String.t(),
          Labels: Engine.ImageSummaryLabels.t(),
          Manifests: [Engine.ImageManifestSummary.t()] | nil,
          ParentId: String.t(),
          RepoDigests: [String.t()],
          RepoTags: [String.t()],
          SharedSize: integer,
          Size: integer,
          VirtualSize: integer | nil
        }

  defstruct [
    :Containers,
    :Created,
    :Id,
    :Labels,
    :Manifests,
    :ParentId,
    :RepoDigests,
    :RepoTags,
    :SharedSize,
    :Size,
    :VirtualSize
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Containers: :integer,
      Created: :integer,
      Id: {:string, :generic},
      Labels: {Engine.ImageSummaryLabels, :t},
      Manifests: [{Engine.ImageManifestSummary, :t}],
      ParentId: {:string, :generic},
      RepoDigests: [string: :generic],
      RepoTags: [string: :generic],
      SharedSize: :integer,
      Size: :integer,
      VirtualSize: :integer
    ]
  end
end

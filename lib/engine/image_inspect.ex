defmodule Engine.ImageInspect do
  @moduledoc """
  Provides struct and type for a ImageInspect
  """

  @type t :: %__MODULE__{
          Architecture: String.t() | nil,
          Author: String.t() | nil,
          Comment: String.t() | nil,
          Config: Engine.ImageConfig.t() | nil,
          Created: String.t() | nil,
          DockerVersion: String.t() | nil,
          GraphDriver: Engine.DriverData.t() | nil,
          Id: String.t() | nil,
          Metadata: Engine.ImageInspectMetadata.t() | nil,
          Os: String.t() | nil,
          OsVersion: String.t() | nil,
          Parent: String.t() | nil,
          RepoDigests: [String.t()] | nil,
          RepoTags: [String.t()] | nil,
          RootFS: Engine.ImageInspectRootFS.t() | nil,
          Size: integer | nil,
          Variant: String.t() | nil,
          VirtualSize: integer | nil
        }

  defstruct [
    :Architecture,
    :Author,
    :Comment,
    :Config,
    :Created,
    :DockerVersion,
    :GraphDriver,
    :Id,
    :Metadata,
    :Os,
    :OsVersion,
    :Parent,
    :RepoDigests,
    :RepoTags,
    :RootFS,
    :Size,
    :Variant,
    :VirtualSize
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Architecture: {:string, :generic},
      Author: {:string, :generic},
      Comment: {:string, :generic},
      Config: {Engine.ImageConfig, :t},
      Created: {:string, :generic},
      DockerVersion: {:string, :generic},
      GraphDriver: {Engine.DriverData, :t},
      Id: {:string, :generic},
      Metadata: {Engine.ImageInspectMetadata, :t},
      Os: {:string, :generic},
      OsVersion: {:string, :generic},
      Parent: {:string, :generic},
      RepoDigests: [string: :generic],
      RepoTags: [string: :generic],
      RootFS: {Engine.ImageInspectRootFS, :t},
      Size: :integer,
      Variant: {:string, :generic},
      VirtualSize: :integer
    ]
  end
end

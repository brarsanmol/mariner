defmodule Engine.ClusterVolume do
  @moduledoc """
  Provides struct and type for a ClusterVolume
  """

  @type t :: %__MODULE__{
          CreatedAt: String.t() | nil,
          ID: String.t() | nil,
          Info: Engine.ClusterVolumeInfo.t() | nil,
          PublishStatus: [Engine.ClusterVolumePublishStatus.t()] | nil,
          Spec: Engine.ClusterVolumeSpec.t() | nil,
          UpdatedAt: String.t() | nil,
          Version: Engine.ObjectVersion.t() | nil
        }

  defstruct [:CreatedAt, :ID, :Info, :PublishStatus, :Spec, :UpdatedAt, :Version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CreatedAt: {:string, :generic},
      ID: {:string, :generic},
      Info: {Engine.ClusterVolumeInfo, :t},
      PublishStatus: [{Engine.ClusterVolumePublishStatus, :t}],
      Spec: {Engine.ClusterVolumeSpec, :t},
      UpdatedAt: {:string, :generic},
      Version: {Engine.ObjectVersion, :t}
    ]
  end
end

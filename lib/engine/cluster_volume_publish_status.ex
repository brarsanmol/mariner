defmodule Engine.ClusterVolumePublishStatus do
  @moduledoc """
  Provides struct and type for a ClusterVolumePublishStatus
  """

  @type t :: %__MODULE__{
          NodeID: String.t() | nil,
          PublishContext: Engine.ClusterVolumePublishStatusPublishContext.t() | nil,
          State: String.t() | nil
        }

  defstruct [:NodeID, :PublishContext, :State]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      NodeID: {:string, :generic},
      PublishContext: {Engine.ClusterVolumePublishStatusPublishContext, :t},
      State:
        {:enum,
         [
           "pending-publish",
           "published",
           "pending-node-unpublish",
           "pending-controller-unpublish"
         ]}
    ]
  end
end

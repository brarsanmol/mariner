defmodule Engine.TaskSpecNetworkAttachmentSpec do
  @moduledoc """
  Provides struct and type for a TaskSpecNetworkAttachmentSpec
  """

  @type t :: %__MODULE__{ContainerID: String.t() | nil}

  defstruct [:ContainerID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ContainerID: {:string, :generic}]
  end
end

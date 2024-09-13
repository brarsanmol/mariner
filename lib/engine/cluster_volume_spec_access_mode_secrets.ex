defmodule Engine.ClusterVolumeSpecAccessModeSecrets do
  @moduledoc """
  Provides struct and type for a ClusterVolumeSpecAccessModeSecrets
  """

  @type t :: %__MODULE__{Key: String.t() | nil, Secret: String.t() | nil}

  defstruct [:Key, :Secret]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Key: {:string, :generic}, Secret: {:string, :generic}]
  end
end

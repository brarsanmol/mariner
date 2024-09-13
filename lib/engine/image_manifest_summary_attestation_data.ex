defmodule Engine.ImageManifestSummaryAttestationData do
  @moduledoc """
  Provides struct and type for a ImageManifestSummaryAttestationData
  """

  @type t :: %__MODULE__{For: String.t()}

  defstruct [:For]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [For: {:string, :generic}]
  end
end

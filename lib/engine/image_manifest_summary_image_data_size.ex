defmodule Engine.ImageManifestSummaryImageDataSize do
  @moduledoc """
  Provides struct and type for a ImageManifestSummaryImageDataSize
  """

  @type t :: %__MODULE__{Unpacked: integer}

  defstruct [:Unpacked]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Unpacked: :integer]
  end
end

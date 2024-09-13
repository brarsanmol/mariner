defmodule Engine.ImageManifestSummarySize do
  @moduledoc """
  Provides struct and type for a ImageManifestSummarySize
  """

  @type t :: %__MODULE__{Content: integer, Total: integer}

  defstruct [:Content, :Total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Content: :integer, Total: :integer]
  end
end

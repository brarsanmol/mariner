defmodule Engine.ImageInspectRootFS do
  @moduledoc """
  Provides struct and type for a ImageInspectRootFS
  """

  @type t :: %__MODULE__{Layers: [String.t()] | nil, Type: String.t()}

  defstruct [:Layers, :Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Layers: [string: :generic], Type: {:string, :generic}]
  end
end

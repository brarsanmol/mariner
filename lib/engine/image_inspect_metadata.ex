defmodule Engine.ImageInspectMetadata do
  @moduledoc """
  Provides struct and type for a ImageInspectMetadata
  """

  @type t :: %__MODULE__{LastTagTime: String.t() | nil}

  defstruct [:LastTagTime]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [LastTagTime: {:string, :generic}]
  end
end

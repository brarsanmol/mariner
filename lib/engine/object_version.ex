defmodule Engine.ObjectVersion do
  @moduledoc """
  Provides struct and type for a ObjectVersion
  """

  @type t :: %__MODULE__{Index: integer | nil}

  defstruct [:Index]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Index: :integer]
  end
end

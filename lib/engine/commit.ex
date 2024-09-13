defmodule Engine.Commit do
  @moduledoc """
  Provides struct and type for a Commit
  """

  @type t :: %__MODULE__{Expected: String.t() | nil, ID: String.t() | nil}

  defstruct [:Expected, :ID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Expected: {:string, :generic}, ID: {:string, :generic}]
  end
end

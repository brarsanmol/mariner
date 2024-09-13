defmodule Engine.ConfigReference do
  @moduledoc """
  Provides struct and type for a ConfigReference
  """

  @type t :: %__MODULE__{Network: String.t() | nil}

  defstruct [:Network]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Network: {:string, :generic}]
  end
end

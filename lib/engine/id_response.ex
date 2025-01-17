defmodule Engine.IdResponse do
  @moduledoc """
  Provides struct and type for a IdResponse
  """

  @type t :: %__MODULE__{Id: String.t()}

  defstruct [:Id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Id: {:string, :generic}]
  end
end

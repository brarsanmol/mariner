defmodule Engine.NetworkCreateResponse do
  @moduledoc """
  Provides struct and type for a NetworkCreateResponse
  """

  @type t :: %__MODULE__{Id: String.t(), Warning: String.t()}

  defstruct [:Id, :Warning]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Id: {:string, :generic}, Warning: {:string, :generic}]
  end
end

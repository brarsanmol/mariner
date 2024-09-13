defmodule Engine.FilesystemChange do
  @moduledoc """
  Provides struct and type for a FilesystemChange
  """

  @type t :: %__MODULE__{Kind: 0 | 1 | 2, Path: String.t()}

  defstruct [:Kind, :Path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Kind: {:enum, [0, 1, 2]}, Path: {:string, :generic}]
  end
end

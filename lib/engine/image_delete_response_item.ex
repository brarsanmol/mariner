defmodule Engine.ImageDeleteResponseItem do
  @moduledoc """
  Provides struct and type for a ImageDeleteResponseItem
  """

  @type t :: %__MODULE__{Deleted: String.t() | nil, Untagged: String.t() | nil}

  defstruct [:Deleted, :Untagged]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Deleted: {:string, :generic}, Untagged: {:string, :generic}]
  end
end

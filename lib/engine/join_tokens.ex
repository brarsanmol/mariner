defmodule Engine.JoinTokens do
  @moduledoc """
  Provides struct and type for a JoinTokens
  """

  @type t :: %__MODULE__{Manager: String.t() | nil, Worker: String.t() | nil}

  defstruct [:Manager, :Worker]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Manager: {:string, :generic}, Worker: {:string, :generic}]
  end
end

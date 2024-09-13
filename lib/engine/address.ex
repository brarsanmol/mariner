defmodule Engine.Address do
  @moduledoc """
  Provides struct and type for a Address
  """

  @type t :: %__MODULE__{Addr: String.t() | nil, PrefixLen: integer | nil}

  defstruct [:Addr, :PrefixLen]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Addr: {:string, :generic}, PrefixLen: :integer]
  end
end
